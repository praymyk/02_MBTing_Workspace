package com.kh.mbting.member.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.service.MemberService;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.member.model.vo.Verification;
import com.kh.mbting.pay.vo.KakaoPay;



@Controller
public class MemberController {

	@Autowired	
	private MemberService memberService; 

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	//0. 전체 회원을 불러오기 위한 method 
	@ResponseBody
	@PostMapping("list.mem")
	public String selecToptMemberList(HttpSession session) {
		ArrayList<Member> list = new ArrayList<>();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			String email = loginMember.getEmail();
			list = memberService.selecToptMemberList(email);
		}else {
			list = memberService.selecToptMemberList();
		}
		
		
		
		return new Gson().toJson(list);
	}
	
	//1. 로그인 기능을 위한 method.
	@PostMapping("/login.me")
	public String loginMember(Member 			  m, 
							  Model 			  model,
							  HttpSession 		  session,
							  String 			  saveId,
							  HttpServletResponse response
							  ) {
		
		//로그인한 회원의 정보를 담아서 service로 요청함
		Member loginMember = memberService.loginMember(m);
		
		if(loginMember != null && 
				bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())){
					
			  if(saveId != null && saveId.equals("y")){
				  Cookie cookie = new Cookie("saveId", m.getEmail());
				  cookie.setMaxAge(24 * 60 * 60 * 1); //유효기간은 1일로 계산했움.
				  response.addCookie(cookie);
			  }else {
					Cookie cookie = new Cookie("saveId", m.getEmail());
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					//쿠키를 제거하는 메소드가 없기 때문에 
					//같은 키값의 쿠키 생성 후 만료기간을 0초로 지정했슴
				}

			  
			session.setAttribute("alertMsg", "로그인 성공");
			session.setAttribute("loginMember", loginMember);
			
			return "redirect:/";
			
		} else {
			 session.setAttribute("alertMsg" , "없는 메일이거나 비밀번호가 일치하지 않습니다.");
			 return "redirect:/";
		}
	}
	
	
	//2. 로그아웃 기능을 위한 method
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
	
		return "redirect:/";
	}
	
	
	//3. 회원가입을 눌렀을 시에 회원가입 폼을 띄워주기 위한 method
	@RequestMapping("enrollForm.me")
	public String enrollForm(HttpSession session) {
		session.removeAttribute("alertMsg");
		return "member/memberEnrollForm";
	}
	
	//4. 회원가입에서 자신의 정보를 입력한 것에 대한 처리를 해줄 method
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session,
								Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		System.out.println("회원가입" + m);
		int result = memberService.insertMember(m);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다.");
				
			return "redirect:/";
			
		} else {
			
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			return "common/errorPage";
		}
			
	}
	
	//4-1 회원가입에서 이메일 중복체크용 method
	@ResponseBody
	@RequestMapping(value = "emailCheck.me", produces = "text/html; charset=UTF-8")
	public String checkEmail(Member m) {
		
		int result = memberService.checkEmail(m);
		
		return (result > 0 ) ? "NNNNN" : "NNNNY";
		
	}

	//5. 카카오 로그인을 시도했을 경우 실행될 method
	@GetMapping("/kakaoLog.me")
	public String kakaoCallback(@RequestParam String code,HttpSession session ) {
		
		String access_Token = memberService.getKakaoAccessToken(code);
								//System.out.println("야 안옴?");
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		String email = (String)userInfo.get("email");
		Member member = memberService.kakaoLoginCheck(email);
		
		 if (userInfo.get("email") != null) {
		       
			 // 카카오 계정 이메일로 회원가입이 안되어있을 경우 > 회원가입 유도
			
			 if(member == null) {	// 가입된 계정이 없을 경우
				 
				 session.setAttribute("alertMsg", "카카오 계정으로 가입된 정보가 없습니다.");
				 session.setAttribute("access_Token", access_Token);
				 session.setAttribute("nickname", userInfo.get("nickname"));
				 session.setAttribute("profile",userInfo.get("profile_image"));
				 session.setAttribute("email", email);
				 
			 }
			 return "member/memberEnrollForm";
		 } else {
			 
			 // 카카오 계정 이메일로 회원가입이 되어있을 경우
			 Member m = new Member();
			 m.setEmail(email);
			 Member loginMember = memberService.loginMember(m);
		 }
		return "main";
	}
	
	//6. 마이페이지 진입용 method
	//a 마이페이지 - 메인
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myMbting";
	}
	//b 마이페이지 - 프로필
	@RequestMapping("myProfile.me")
	public String myProfile() {
	
		return "member/myProfile";
	}
	
	//b-1 마이페이지 - 상단상태(매칭 신청자 수 확인용/ajax)
	@ResponseBody
	@RequestMapping(value="proposerCount.me", produces="text/html; charset=UTF-8")
	public String ajaxProposer(@RequestParam Map<String, Object> param) {
		
		String userNo = (String)param.get("userNo");
		
		String proposerNum = String.valueOf(memberService.proposerCount(userNo));
		return proposerNum;
		
	}
	
	//b-2 내게 매칭을 신청한 회원 리스트 조회용 메소드 (ajax)
	@ResponseBody
	@RequestMapping(value="proposerList.me", produces="application/json; charset=UTF-8")
	public String ajaxProposerList(@RequestParam Map<String, Object> param) {
		
		String userNo = (String)param.get("userNo");
		
		ArrayList<Member> list = memberService.proposerList(userNo);
				
		return new Gson().toJson(list);
	}
	
	//b-3 매칭 신청 수락용 메소드
	//매칭 신청을 수락하는 순간 자신의 MatchStat=3 으로 UPDATE (accepted) 메소드
	// proposerNo => 매칭 신청자의 userNo
	// receiverNo => 매칭 대상자의 userNo

	@RequestMapping	(value="accept.me")
	public String proposeAccept(@RequestParam String proposerNo,
								@RequestParam String receiverNo,
								 Model model,
							     HttpSession session) {
		
		// result1 : 매칭 신청자의 상태를 mastStat 값 update
		int result1 = memberService.proposeAccept(proposerNo);
		// result2 : 매칭 대상자의 상태를 mastStat 값 update
		int result2 = memberService.proposeAccepted(receiverNo);
		
		
			if(result1>0 && result2>0) {	// 수락 성공 시

				session.setAttribute("alertMsg", "매칭 수락 완료");
				
				// result 3
				// proposerInfo : 수락 대상자의 회원 정보를 받기
				Member proposerInfo = memberService.proposerInfo(proposerNo);
				
				Member receiverInfo = (Member)session.getAttribute("loginMember");
				
				// result4 : 신청 수락 뒤 쳇룸 추가 (회원의 정보를 모두 넘김)
				// 신청자, 수락자 정보를 ChatRoom VO에 담기
				ChatRoom cr = new ChatRoom();
				cr.setUserEmail(receiverInfo.getEmail());
				cr.setUserName(receiverInfo.getUserName());
				cr.setUserPic(receiverInfo.getProfileImg());
				cr.setMasterEmail(proposerInfo.getEmail());
				cr.setMasterName(proposerInfo.getUserName());
				cr.setMasterPic(proposerInfo.getProfileImg());
				
				int result4 = memberService.createChatroom(cr);
				
				// result5 : 챗 메세지 생성해야함
				// 수락한 사람 정보를 CharMessage VO에 담기
				ChatMessage cm = new ChatMessage();
				
				// 매칭 수락 후 첫 출력되는 메시지
				cm.setMessageContent(receiverInfo.getUserName()+"님이 대화 신청을 수락했습니다.");
				cm.setName("챗봇");
				cm.setEmail(receiverInfo.getEmail());
				int result5 = memberService.createChatMessage(cm);
				
				// result6 : 매칭 테이블의 matching 상태를 3으로 후기 작성시 조회가 되도록
				Matching mc = new Matching();
				mc.setProposerNo(proposerNo);
				mc.setReceiverNo(receiverNo);
				
				int result6 = memberService.matchingStrat(mc);
				
			return "redirect:/myPage.me";

			} else {
				
				model.addAttribute("errorMsg", "매칭 수락에 실패했습니다. 관리자한테 연락하세요.");
				
				return "common/errorPage";
			}
		
	}
	// b-4 신청자 거절용 메소드 (ajax)
	@ResponseBody
	@RequestMapping (value="refusePropose.me", produces="text/html; charset=UTF-8")
	public String refusePropose(Matching mc) {
		String refuse="";
		// 선택한 회원의 번호를 넘기고 대상의 신청 거절 (Matching테이블 stat(1/거절) update)
		int result = memberService.refusePropose(mc);
		if(result>0) {
			refuse = "대화 신청을 거절했습니다.";
		} else {
			refuse = "신청 거절 실패";
		}
		
		return refuse;
	}
	
	
	// b-5 내 대화 상대 정보 표시용 메소드(ajax)
	@ResponseBody
	@RequestMapping (value="myChat.me", produces="application/json; charset=UTF-8")
	public String myChat(String userNo,
						HttpSession session) {
		
		ArrayList<Member> list = memberService.myChat(userNo);

		return new Gson().toJson(list);
	}
	
	
	//b-6 마이페이지 - 프로필(수정)
	
	@PostMapping("update.me")
	public String updateMember(Member m,
							   MultipartFile reupfile,
								Model model,
								HttpSession session){
		
		// 프로필 이미지 변경
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// case1. 등록 프로필이 있을 경우
			if(m.getProfileImg() != null) {
				
				String realPath = session.getServletContext()
						.getRealPath(m.getProfileImg());
				
				
				new File(realPath).delete();
			}
			
			// case2. 등록 프로필 이미지가 없을 경우
			String changeName = saveFile(reupfile, session);
			
			// File 메소드에서 변경한 파일 이름으로 포르필 이미지 경로 등록
			m.setProfileImg("/resources/images/profile/" + changeName);
			
		}
				
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			Member updateMem = memberService.loginMember(m);
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "정보 변경에 성공했습니다.");
			
			return "redirect:/myPage.me";
		} else {
			
			model.addAttribute("errorMsg", "회원정보 변경에 실패했습니다.");
			return "common/errorPage";
		}
		
	}
	
	//b-7 마이페이지 비밀번호 수정용 method
	@PostMapping(value="updatePwd.me")
	public String updatePwd(Member m, Model model, HttpSession session){
		
		// step1 비밀번호 변경하기 위해 입력한 비밀번호가 현재 비밀번호와 일치하는가
		Member loginMember = memberService.loginMember(m);
		if(loginMember != null && 
			bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())){
						
			// step2 변경할 비밀번호를 암호화
			String encPwd = bcryptPasswordEncoder.encode(m.getChangePwd());
			
			// step3 변경할 비밀번호로 현재 비밀번호 변경
			m.setUserPwd(encPwd);
			int result = memberService.updatePwd(m);

			// step4 비밀번호 변경 결과에 따라 알림 메시지 출력
			if(result > 0) {
				Member updateMem = memberService.loginMember(m);
				session.setAttribute("loginMember", updateMem);
				session.setAttribute("alertMsg", "비밀번호 변경에 성공했습니다.");
				return "redirect:/myProfile.me";
			} else {
				model.addAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
				return "common/errorPage";
			}
			
		} else {
			 model.addAttribute("errorMsg" , "입력한 비밀번호가 일치하지 않습니다.");
			 return "common/errorPage";
		}
		
	}
	
	
	//c 마이페이지 - 내후기
	@RequestMapping(value="myReview.me")
	public String myReview() {
		
		return "member/myReview";
	}
	
	//c-마이페이지 - 내후기 리스트 수 조회 
	@GetMapping(value="myList.me")
	public ModelAndView selectList(
			@RequestParam(value = "uno") String userNo,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = memberService.selectListCount(userNo);
		
		int pageLimit = 5;
		int boardLimit = 8;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = memberService.selectList(pi, userNo);
				
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("member/myReview");
	
		return mv;
	}
	
	// d 마이페이지 - 프로필 이미지 첨부용 메소드
	public String saveFile(MultipartFile upfile,
			   HttpSession session) {

		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss")
											.format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 하고자 하는 물리적인 경로 입력
		String savePath = session.getServletContext()
			.getRealPath("/resources/images/profile/");
		
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		}
	
	// e-1 마이페이지 - 내 결제 조회 + 결제 페이지 이동용 메소드
	@RequestMapping(value= "myPay.me")
	public String myPay() {
		return "member/myPay";
	}
	
	// e-2 마이페이지 - 내 결제 리스트 조회 용 메소드
	@ResponseBody
	@RequestMapping(value="orderList.me",	 produces="application/json; charset=UTF-8")
	public String orderList(Member m, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "morePage", defaultValue ="0") int morePage) {
		
		// 전체 결제 리스트 수 조회
		int listCount = memberService.selectOrderListCount(m.getEmail());
		
		int pageLimit = 5;
		int boardLimit = 8;
		
		if(morePage > 8) {
			boardLimit = morePage;
		} else {
			boardLimit = 8;
		}
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		request.setAttribute("pi", pi);
		session.setAttribute("pi", pi);
	
		ArrayList<KakaoPay> list = memberService.orderList(pi, m.getEmail());
	
		// Gson을 사용하여 list와 pi를 JSON으로 직렬화
	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    jsonObject.addProperty("pi", gson.toJson(pi));
	    jsonObject.addProperty("list", gson.toJson(list));
   
	    return jsonObject.toString();
	}
	
	// 비밀번호 찾기 이동용 메소드
	@RequestMapping("findPass.me")
	public String findPass() {
		
		return "common/findPassWord";
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 비밀번호 찾기전 인증 메일 발송용 메소드
	@ResponseBody
	@RequestMapping(value="getCertNo.me", produces="text/html; charset=UTF-8")
	public String getCertNo(Member m, HttpSession session) throws MessagingException{
		
		MimeMessage message = mailSender.createMimeMessage();
		// 인증번호 생성
		int emailCode = (int)(Math.random() * 900000 + 100000);
		String email = m.getEmail();
		Verification v = new Verification();
		v.setEmail(email);
		v.setEmailCode(emailCode);
		
		// 인증번호 요청 메일 주소와 인증번호를 DB에 저장하기
		int result = memberService.getCertNo(v);
		System.out.println("잘 인설트 됐나? "+ result);
		
		MimeMessageHelper mimeMessageHelper
		= new MimeMessageHelper(message, true, "UTF-8");
		
		String to = m.getEmail();
		String mimeMessage = "Mbting <br> 인증번호 : " + emailCode;
				
		if( result > 0 ) {	// 인증번호 발송에 성공한 경우
			
			mimeMessageHelper.setTo(to);
			
			mimeMessageHelper.setSubject("MBTIng 비밀번호 초기화 인증메일입니다.");
			
			mimeMessageHelper.setText(mimeMessage, true);
			
			mailSender.send(message);
			
			return "인증메일 발송 성공";
			
		} else {
			
			session.setAttribute("alertMsg", "인증메일 발송에 실패했습니다.");
		}
		
		return "인증메일 발송 실패";
	}
	
	// 인증코드 확인용 메소드
	@ResponseBody
	@RequestMapping(value="checkCertNo.me", produces="text/htlm; charset=UTF-8")
	public String checkCertNo(Verification v) {
		
		Verification emailCode = memberService.checkCertNo(v);
		// 최종 결과 확인용 메시지
		String resultMsg = "";

		if( emailCode != null) { // 인증코드를 잘 입력했을 경우
			// 비밀번호를 초기화할 멤버 객체 만들기
			Member m = new Member();
			
			System.out.println(emailCode);
			// 인증코스 생성시간 현재시간을 시간형태로 가공하기 위한 객체 생성
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// 인증코드 생성 시간
			String createDate = emailCode.getCreateDate();
			// 시간을 더하는 용도의 객체 생성
			Calendar cal = Calendar.getInstance();
			
			try {
				// 코드 생성시간과 현재 시간을 같은 형태로 가공
				// 코드 생성 시간 (+5분)
				Date codeDate = simpleDate.parse(createDate);
				cal.setTime(codeDate);
				cal.add(Calendar.MINUTE, +5);
				codeDate = cal.getTime();
				System.out.println(codeDate);
				// 현재 시간
				Date now = new Date();
				simpleDate.format(now);
				System.out.println(now);
				
				System.out.println(!now.after(codeDate));
				System.out.println(now.after(codeDate));
				System.out.println(codeDate.after(now));
				
				
				// 현재 시간이 5분이 지난 인증번호 생성시간 보다 크지 않을 동안 => 아직 인증번호(현재시간+5분)의 유효시간이 지나지 않았음
				if(!now.after(codeDate)) {
					
					int ranNum = (int)(Math.random() * 90000 + 10000);
					m.setEmail(v.getEmail());
					// 16자리 영문 대소문자 특수문자 포함 임시 비밀번호 생성 후  m에 대입
					String newPwd = RandomStringUtils.random(16, 33, 125, false, false);
					// step2 변경할 비밀번호를 암호화
					String encPwd = bcryptPasswordEncoder.encode(newPwd);
					System.out.println(encPwd);
					m.setUserPwd(encPwd);
					
					// 임시비밀번호로 회원 정보 업데이트
					int result = memberService.newPassWord(m);
					
					resultMsg = "인증이 완료되었습니다. 초기화된 비밀번호는 " +newPwd+ " 입니다.";
				} else {
					
					resultMsg = "인증번호의  유효 시간이 만료되었습니다. 새로 인증번호를 요청해주세요.";
				} 
				
				// 불필요해진 인증 번호 삭제하기
				int result = memberService.deleteCertNo(m);
				
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
		} else {	// 인증코드 불일치 시
				
			resultMsg = "인증 번호가 일치하지 않거나 존재하지 않는 번호입니다.";
		}
		
		return resultMsg;
	}
						
	
}