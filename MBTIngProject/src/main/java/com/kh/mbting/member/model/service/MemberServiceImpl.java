package com.kh.mbting.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.dao.MemberDao;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.member.model.vo.Verification;
import com.kh.mbting.pay.vo.KakaoPay;

@Service
public class MemberServiceImpl implements MemberService {

	//Autowired할 구문들만 모아놓음.
	@Autowired 
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@Override
	public ArrayList<Member> selecToptMemberList(String email) {
		return memberDao.selectTopMemberList(sqlSession , email);
	}
	@Override
	public ArrayList<Member> selecToptMemberList() {
		return memberDao.selectTopMemberList(sqlSession);
	}
	
	//login한 회원의 정보를 처리해줄 method
	@Override
	public Member loginMember(Member m) {		
	
		return memberDao.loginMember(sqlSession, m);
	
	}

	//회원가입 후 회원의 정보를 처리해줄 method
	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	//카카오로 로그인을 했을 경우, 카카오에 접속할 수 있는 Token을 얻어오기 위한 method
	@Override
	public String getKakaoAccessToken(String code) {
		
		 //필요한 변수명 먼저 빼놓음 
		 String access_Token 	= "";
	     String refresh_Token 	= "";
	     String reqURL 			= "https://kauth.kakao.com/oauth/token";
	     //저 위에 reqURL은 kakao에서 제공하는 token에 접근하기 위한 공식 주소임 !!
	     
	     try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //POST 요청을 위해서 기본값이 false인 setDoOutPut을 true로 만들어줌. ! 
	            //Post로 요청을 할 때는 OutputStream 객체로 데이터를 전송하는데, 
	            //DoOutPut 객체가 false라면 데이터를 전송 안한다는 뜻이라서 true로 바꿔주는 거임요. 
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송합니담.
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=670371a54748d4645ec474b68405a19c"); //본인이 발급받은 REST_API를 넣어주면 됨. 
	            sb.append("&redirect_uri=http://192.168.40.37:8081/mbting/kakaoLog.me"); //본인이 설정한 주소를 넣어주면 됨. 
	            sb.append("&code=" + code); //get방식으로 받아온 code임.
	            bw.write(sb.toString());
	            bw.flush();

	            //결과 코드가 200이라면 성공 !!
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return access_Token;
	    }

	//카카오로 로그인한 회원의 정보를 얻어내기 위한 service
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		
		  //회원의 정보를 받을 HashMap을 설정해줌. 
		  HashMap<String, Object> userInfo = new HashMap<String , Object>();
		  String reqURL = "https://kapi.kakao.com/v2/user/me";
		   
		  try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        
		        // 이건 kakao 공식 문서에 있는 건데 권한을 얻어내기 위한 공식적인 문구임!!!
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String line = "";
		        String result = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("response body : " + result);
		        
		        JsonParser parser = new JsonParser();
		        JsonElement element = parser.parse(result);
		       
		        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		        
		        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
		        System.out.println("�뀑1" +nickname);
		        
		        String email = kakao_account.getAsJsonObject().get("email").getAsString();
		        
		        System.out.println("email" + email);
		        
		        userInfo.put("nickname", nickname);
		        userInfo.put("profile_image", profile_image);
		        userInfo.put("email", email);
		       
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    
		    return userInfo;
	}

	// 마이페이지 - 회원정보 수정용 메소드
	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}
	// 마이페이지 내 비밀번호 수정용 method
	@Override
	public int updatePwd(Member m) {
		return memberDao.updatePwd(sqlSession, m);
	}

	// 마이페이지 - 내게 매칭을 신청한 회원의 수 확인용 메소드
	@Override
	public int proposerCount(String userNo) {
		return memberDao.proposerCount(sqlSession, userNo);
	}

	// 마이페이지 - 내게 매칭을 신청한 회원 리스트 확인용 메소드
	@Override
	public ArrayList<Member> proposerList(String userNo) {
		return memberDao.proposerList(sqlSession, userNo);
	}
	
	// 마이페이지 - 매칭 신청 수락용 메소드(신청자 상태 변화)
	@Override
	public int proposeAccept(String proposerNo) {
		return memberDao.proposeAccept(sqlSession, proposerNo);
	}
	// 마이페이지 - 매칭 신청 수락용 메소드(대상자 상태 변화)
	@Override
	public int proposeAccepted(String receiverNo) {
		return memberDao.proposeAccepted(sqlSession, receiverNo);
	}
	// 마이페이지 = 매칭 신청 수락 시 대상자의 회원 정보 추출용 메소드
	@Override
	public Member proposerInfo(String proposerNo) {
		return memberDao.proposerInfo(sqlSession, proposerNo);
	}
	// 마이페이지 - 매칭 거절용 메소드
	@Override
	public int refusePropose(Matching mc) {
		return memberDao.refusePropose(sqlSession, mc);
	}
	// 마이페이지 - 매칭 신청이 수락되었을 때 쳇룸 생성용 method
	@Override
	public int createChatroom(ChatRoom cr) {
		return  memberDao.createChatroom(sqlSession, cr);
	}
	// 마이페이지 = 매칭 수락 후 첫 메시지 생성용 method
	@Override
	public int createChatMessage(ChatMessage cm) {
		return memberDao.createChatMessage(sqlSession, cm);
	}
	// 1:1 대화 시작 시 매칭 테이블 의 매칭 상태를(3/매칭 진행) 업데이트용 method
	@Override
	public int matchingStrat(Matching mc) {
		return memberDao.matchingStrat(sqlSession, mc);
	}
	
	// 마이페이지 - 내 후기 게시글 총 갯수 확인용 메소드
	@Override
	public int selectListCount(String userNo) {
		return memberDao.selectListCount(sqlSession, userNo);
	}

	// 마이페이지 - 내 후기 조회용 메소드
	@Override
	public ArrayList<Board> selectList(PageInfo pi, String userNo) {
		return memberDao.selectList(sqlSession, pi, userNo);
	}

	// 마이페이지 - 내 대화 상대 조회용 메소드
	@Override
	public ArrayList<Member> myChat(String userNo) {
		return memberDao.myChat(sqlSession, userNo);
	}

	// 마이페이지 - 내 결제 리스트 수 조회용 메소드
	@Override
	public int selectOrderListCount(String email) {
		return memberDao.selectOrderListCount(sqlSession, email);
	}
	// 마이페이지 - 내 결제 내역 조회용 메소드
	@Override
	public ArrayList<KakaoPay> orderList(PageInfo pi, String email) {
		return memberDao.orderList(sqlSession, pi, email);
	}

	// 회원가입 - 이메일 중복 검사용 메소드
	@Override
	public int checkEmail(Member m) {
		return memberDao.checkEmail(sqlSession, m);
	}

	// 카카오 로그인 시 카카오 이메일로 회원가입이 되었는지 확인용 메소드
	@Override
	public Member kakaoLoginCheck(String email) {
		return memberDao.kakaoLoginCheck(sqlSession, email);
	}

	// 인증 메일 발송용 메소드
	@Override
	public int getCertNo(Verification v) {
		return memberDao.getCertNo(sqlSession, v);
	}

	// 인증 번호 확인용 메소드
	@Override
	public Verification checkCertNo(Verification v) {
		return memberDao.checkCertNo(sqlSession, v);
	}

	// 비밀번호 초기화용 메소드
	@Override
	public int newPassWord(Member m) {
		return memberDao.newPassWord(sqlSession, m);
	}

	// 인증메일 삭제용 메소드
	@Override
	public int deleteCertNo(Member m) {
		return memberDao.deleteCertNo(sqlSession, m);
	}














}
	


