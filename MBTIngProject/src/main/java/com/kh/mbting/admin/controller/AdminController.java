package com.kh.mbting.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mbting.admin.model.service.AdminService;
import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 전체 회원수 조회
	@ResponseBody
	@RequestMapping("selectTotalMembers.ad")
	public int totalMemberCount() {

		int totalMemberCount = adminService.selectTotalMembers();
		// System.out.println(totalMemberCount);

		return totalMemberCount;
	}

	// 전체 커플 매칭수 조회
	@ResponseBody
	@RequestMapping("selectTotalCouple.ad")
	public int totalCoupleCount() {

		int totalCoupleCount = adminService.selectTotalCouple();
		// System.out.println(totalCoupleCount);
		return totalCoupleCount;
	}

	// 전체 결제 금액 조회
	@ResponseBody
	@RequestMapping("selectTotalPay.ad")
	public int totalPayCount() {
		// System.out.println("여");
		int totalPayCount = adminService.selectTotalPay();

		return totalPayCount;
	}

	// 전체 후기 게시글 수 조회
	@ResponseBody
	@RequestMapping("selectTotalBoard.ad")
	public int totalBoardCount() {

		int totalBoardCount = adminService.selectTotalBoard();

		return totalBoardCount;
	}

	// 월 별 회원가입 수 그래프
	@ResponseBody
	@RequestMapping(value = "selectTotalMonthly.ad", produces = "application/json; charset=UTF-8")
	public String selectTotalMonthly() {

		ArrayList<Month> list = adminService.selectTotalMonthly();
		// System.out.println(list);

		return new Gson().toJson(list);
	}

	// 커플 매칭 상태 수락 그래프
	@ResponseBody
	@RequestMapping(value = "selectTotalMatchingSuccess.ad", produces = "application/json; charset=UTF-8")
	public String totalMatchingSuccess() {

		ArrayList<Matching> list = adminService.totalMatchingSuccess();

		// System.out.println(list);;
		// 3번이 수락, 2번이 보류

		return new Gson().toJson(list);
	}

	// 커플 매칭 상태 거절 그래프
	@ResponseBody
	@RequestMapping(value = "selectTotalMatchingRefusal.ad", produces = "application/json; charset=UTF-8")
	public String totalMatchingRefusal() {

		ArrayList<Matching> list = adminService.totalMatchingRefusal();

		return new Gson().toJson(list);
	}

	// 커플 매칭 상태 보류 그래프
	@ResponseBody
	@RequestMapping(value = "selectTotalMatchingPending.ad", produces = "application/json; charset=UTF-8")
	public String totalMatchingPending() {

		ArrayList<Matching> list = adminService.totalMatchingPending();

		// System.out.println(list);;
		// 3번이 수락, 2번이 보류, // 1번 거절ㄱ

		return new Gson().toJson(list);
	}

	// MBTI 성향 분포도
	@ResponseBody
	@RequestMapping(value = "totalMbtiCount.ad", produces = "application/json; charset=UTF-8")
	public String totalMbtiCount() {

		ArrayList<Member> list = adminService.totalMbtiCount();

		return new Gson().toJson(list);
	}

	// 남녀성비 원그래프
	@ResponseBody
	@RequestMapping(value = "totalGenderRate.ad", produces = "application/json; charset=UTF-8")
	public String totalGenderRate() {

		ArrayList<Member> list = adminService.totalGenderRate();

		return new Gson().toJson(list);
	}

	// 매칭 성공률 원그래프
	@ResponseBody
	@RequestMapping(value = "totalMatchingRate.ad", produces = "application/json; charset=UTF-8")
	public String totalMatchingRate() {

		ArrayList<Matching> list = adminService.totalMatchingRate();

		return new Gson().toJson(list);
	}

	// 유료계정비율 원그래프
	@ResponseBody
	@RequestMapping(value = "totalPremiumCount.ad", produces = "application/json; charset=UTF-8")
	public String totalPremiumCount() {

		ArrayList<KakaoPay> list = adminService.totalPremiumCount();

		return new Gson().toJson(list);
	}

	// 무료계정비율 원그래프
	@ResponseBody
	@RequestMapping(value = "totalFreeCount.ad", produces = "application/json; charset=UTF-8")
	public String totalFreeCount() {

		ArrayList<KakaoPay> list = adminService.totalFreeCount();

		return new Gson().toJson(list);
	}

	// 월 별 매출 그래프
	@ResponseBody
	@RequestMapping(value = "totalMonthlySalesCount.ad", produces = "application/json; charset=UTF-8")
	public String totalMonthlySalesCount() {

		ArrayList<KakaoPay> list = adminService.totalMonthlySalesCount();

		return new Gson().toJson(list);
	}

	// 년 별 매출 그래프
	@ResponseBody
	@RequestMapping(value = "totalyearlySalesCount.ad", produces = "application/json; charset=UTF-8")
	public String totalyearlySalesCount() {

		ArrayList<KakaoPay> list = adminService.totalyearlySalesCount();

		return new Gson().toJson(list);
	}

	/* 회원 관리 시작!!!!!!!!!!!!!!!!!! */
	@RequestMapping("adminMain.ad")
	public String adminMain() {

		return "admin/adminMainPage";
	}

	// 전체회원 조회
	@GetMapping("list.adme")
	public ModelAndView memberSelectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int listCount = adminService.memberSelectListCount();

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Member> list = adminService.memberSelectList(pi);
		// System.out.println(list);
		mv.addObject("list", list).addObject("result", new Gson().toJson(list)).addObject("pi", pi)
				.setViewName("admin/adminMemberListView");

		return mv;
	}

	/*
	 * // dto
	 * 
	 * @GetMapping("list.adme") public ModelAndView memberSelectList2(
	 * 
	 * @RequestParam(value="cpage", defaultValue = "1") int currentPage,
	 * ModelAndView mv) {
	 * 
	 * int listCount = adminService.memberSelectListCount();
	 * 
	 * int pageLimit = 5; int boardLimit = 10;
	 * 
	 * PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit,
	 * boardLimit);
	 * 
	 * ArrayList<MemPay> list = adminService.memberSelectList2(pi); //
	 * System.out.println(list); mv.addObject("list", list) .addObject("result", new
	 * Gson().toJson(list)) .addObject("pi", pi)
	 * .setViewName("admin/adminMemberListView");
	 * 
	 * return mv; }
	 */

	// 회원관리 검색 조회용
	@GetMapping("search.adme")
	public ModelAndView adminSearchMember(@RequestParam("keyword") String keyword,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {

		int listCount = adminService.memberSearchListCount(keyword);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Member> searchResult = adminService.memberSearchList(keyword, pi.getCurrentPage(), pi.getBoardLimit(),
				pi.getPageLimit());

		mv.addObject("list", searchResult).addObject("pi", pi).setViewName("admin/adminMemberListView");

		return mv;
	}

	/*
	 * @RequestMapping("update-status") public void
	 * updateSelectedStatus(@RequestParam("selectedUserNos") ArrayList<String>
	 * selectedUserNos){
	 * 
	 * //System.out.println(selectedUserNos);
	 * 
	 * int result1 = adminService.updateSelectedStatus(selectedUserNos);
	 * //System.out.println("result : " + result1);
	 * 
	 * 
	 * List<String> statusN = new ArrayList<>();
	 * 
	 * if(result1 > 0 ) { // 내가 선택한 회원의 스텟을 Y로 바꾸는 것이 성공했을 때 // int allMember =
	 * adminService.selectAllMember(); // 전체 회원을 조회함( 전체회원의 숫자 확인) //
	 * System.out.println("allMember : " + allMember); //6이 담김
	 * 
	 * for (int i = 1; i <= 10; i++) { if
	 * (!selectedUserNos.contains(String.valueOf(i))) {
	 * statusN.add(String.valueOf(i)); } System.out.println("statusN :" + statusN);
	 * }
	 * 
	 * int result2 = adminService.updateSelectedStatus2(statusN); // status가 N인 회원의
	 * 번호들을 다시 스테이터스 N으로 업데이트 함! //System.out.println("result2 : " + result2); }
	 * 
	 * 
	 * System.out.println("result1" + result1); }
	 */

	// 회원관리 상태 변경 및 저장
	  @ResponseBody
	  @RequestMapping("update-status") 
	  public String updateStatus(@RequestParam("userNo") String userNo, @RequestParam("status") String status) {
	  
	  
	  int result = adminService.updateStatus(userNo, status);
	  if(result > 0) {
		  return "YYY";
	  } else {
		  return  "NNN";  
		  }
		  	  
	  }
	  
	 
	// 회원 관리에서 클릭한 회원의 상세조회를 위한 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "adminMemberDetailView.adme", produces = "application/json; charset=UTF-8")
	public String adminMemberDetailView(String userNo) {
		// System.out.println("여기는 오나 ? ? 2번째임" + userNo);
		Member m = adminService.adminMemberDetailView(userNo);

		return new Gson().toJson(m);
	}

	// 상세조회 화면 포워딩
	@RequestMapping("detail.adme")
	public String detailMember(@RequestParam("userNo") String userNo, @RequestParam("currentPage") String currentPage,
			Model model) {
		// System.out.println("userNo : 야 오냐 ! " + userNo);
		// System.out.println("화긴확인" + currentPage);
		model.addAttribute("userNo", userNo);
		model.addAttribute("currentPage", currentPage);

		return "admin/detailViewMember";
	}

	/* 매칭후기 관리 시작!!!!!!!!!!!!!!!!!! */

	// 매칭후기 게시글 전체 조회
	@GetMapping("list.adbo")
	public ModelAndView boardSelectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int listCount = adminService.boardSelectListCount();

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.boardSelectList(pi);

		mv.addObject("list", list).addObject("pi", pi).setViewName("admin/adminBoardListView");

		return mv;
	}

	// 매칭후기 검색
	@GetMapping("search.adbo")
	public ModelAndView searchBoard(@RequestParam("keyword") String keyword,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {

		int listCount = adminService.adminSearchListCount(keyword);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Board> searchResult = adminService.adminSearchList(keyword, pi.getCurrentPage(), pi.getBoardLimit(),
				pi.getPageLimit());

		mv.addObject("list", searchResult).addObject("pi", pi).setViewName("admin/adminBoardListView");

		return mv;
	}

	/* 결제 관리 시작!!!!!!!!!!!!!!!!!!!! */
	// 결제관리 게시글 전체 조회
	@GetMapping("list.adpa")
	public ModelAndView adminPaySelectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int listCount = adminService.adminPaySelectListCount();

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<KakaoPay> list = adminService.adminPaySelectList(pi);

		// System.out.println(list);

		mv.addObject("list", list).addObject("pi", pi).setViewName("admin/adminPayListView");

		return mv;
	}

	// 환불요청 승인 버튼 클릭
	@ResponseBody
	@RequestMapping("refundSuccess.adpa")
	public int refundSuccess(KakaoPay k) {

		System.out.println("넘어는 오나?");
		int refundRequest = 3;
		k.setRefundRequest(refundRequest);

		int refundNum = adminService.refundSuccess(k);

		return refundNum;
	}

	// 환불요청 거절 버튼 클릭
	@ResponseBody
	@RequestMapping("refundRefusal.adpa")
	public int refundRefusal(KakaoPay k) {

		System.out.println("넘어는 오나?");

		int refundRequest = 4;
		k.setRefundRequest(refundRequest);

		int refundNum = adminService.refundSuccess(k);

		return refundNum;
	}

	// 환불 회원 검색 조회용
	@GetMapping("search.adpa")
	public ModelAndView adminPaySearchMember(@RequestParam("keyword") String keyword,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {

		int listCount = adminService.paySearchListCount(keyword);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<KakaoPay> searchResult = adminService.paySearchList(keyword, pi.getCurrentPage(), pi.getBoardLimit(),
				pi.getPageLimit());

		mv.addObject("list", searchResult).addObject("pi", pi).setViewName("admin/adminPayListView");

		return mv;
	}

	/* 1:1문의 관리!!!!!!!!!!!!!!! */
	// 1:1 문의 페이지 포워딩
	@ResponseBody
	@RequestMapping("list.adse")
	public String adminServiceSelectList() {

		return "https://dashboard.tawk.to/#/chat";
	}

}
