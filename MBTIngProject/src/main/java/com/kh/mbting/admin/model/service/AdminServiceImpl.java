package com.kh.mbting.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mbting.admin.model.dao.AdminDao;
import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

@Service
@EnableTransactionManagement
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 전체 회원 수 조회
	@Override
	@Transactional
	public int selectTotalMembers() {
		return adminDao.selectTotalMembers(sqlSession);
	}
	
	// 전체 커플매칭 수 조회
	@Override
	@Transactional
	public int selectTotalCouple() {

		return adminDao.selectTotalCouple(sqlSession);
	}

	// 전체 결제금액 조회
	@Override
	@Transactional
	public int selectTotalPay() {
		
		return adminDao.selectTotalPay(sqlSession);
	}

	// 전체 후기게시글 수 조회
	@Override
	@Transactional
	public int selectTotalBoard() {
		
		return adminDao.selectTotalBoard(sqlSession);
	}

	// 월 별 회원가입 수 조회
	@Override
	public ArrayList<Month> selectTotalMonthly() {
		return adminDao.selectTotalMonthly(sqlSession);
	}

	// 커플 매칭 상태 수락 그래프
	@Override
	public ArrayList<Matching> totalMatchingSuccess() {

		return adminDao.totalMatchingSuccess(sqlSession);
	}
	
	// 커플 매칭 상태 거절 그래프
	@Override
	public ArrayList<Matching> totalMatchingRefusal() {

		return adminDao.totalMatchingRefusal(sqlSession);
	}

	// 커플 매칭 상태 보류 그래프
	@Override
	public ArrayList<Matching> totalMatchingPending() {

		return adminDao.totalMatchingPending(sqlSession);
	}

	// MBTI 성향 분포도
	@Override
	public ArrayList<Member> totalMbtiCount() {

		return adminDao.totalMbtiCount(sqlSession);
	}

	// 남녀성비 원그래프
	@Override
	public ArrayList<Member> totalGenderRate() {

		return adminDao.totalGenderRate(sqlSession);
	}

	// 매칭 성공률 원그래프
	@Override
	public ArrayList<Matching> totalMatchingRate() {

		return adminDao.totalMatchingRate(sqlSession);
	}
	
	// 유료계정비율 원그래프totalFreeCount
	@Override
	public ArrayList<KakaoPay> totalPremiumCount() {

		return adminDao.totalPremiumCount(sqlSession);
	}
	
	// 무료계정비율 원그래프
	@Override
	public ArrayList<KakaoPay> totalFreeCount() {

		return adminDao.totalFreeCount(sqlSession);
	}

	@Override
	public ArrayList<KakaoPay> totalMonthlySalesCount() {
		
		return adminDao.totalMonthlySalesCount(sqlSession);
	}

	@Override
	public ArrayList<KakaoPay> totalyearlySalesCount() {

		return adminDao.totalyearlySalesCount(sqlSession);
	}

	
	/* 회원관리 관리 시작!!!!!!!!!!!!!!!!!! */
	
	// 회원관리 전체조회
	@Override
	public int memberSelectListCount() {
		
		return adminDao.memberSelectListCount(sqlSession);
	}
	// 회원관리 전체조회
	@Override
	public ArrayList<Member> memberSelectList(PageInfo pi) {
	
		return adminDao.memberSelectList(sqlSession, pi);
	}
	
	/*
	 * @Override public ArrayList<MemPay> memberSelectList2(PageInfo pi) {
	 * 
	 * return adminDao.memberSelectList2(sqlSession, pi); }
	 */

	/* 선택된 회원 저장
	@Override
	public void updateSelectedUserStatus(List<Integer> selectedUserNos) {
	    
		adminDao.updateSelectedUserStatus(sqlSession, selectedUserNos);
	}
*/
	// 회원관리 검색 조회용
	@Override
	public int memberSearchListCount(String keyword) {

		return adminDao.memberSearchListCount(sqlSession, keyword);
	}
	// 회원관리 검색 조회용
	@Override
	public List<Member> memberSearchList(String keyword, int currentPage, int pageLimit, int boardLimit) {
		
		return adminDao.memberSearchList(sqlSession, keyword, currentPage, pageLimit, boardLimit);
	}
    
	/*
	 * @Override public int updateSelectedStatus( ArrayList<String> memNo) {
	 * 
	 * return adminDao.updateSelectedStatus(sqlSession, memNo ); }
	 * 
	 * @Override public int updateSelectedStatus2(List<String> statusN) { return
	 * adminDao.updateSelectedStatus2(sqlSession, statusN); }
	 * 
	 * @Override public int selectAllMember() { return
	 * adminDao.selectAllMember(sqlSession); }
	 */
	
	 // 회원관리 상태 변경 및 저장
	 @Override
	 public int updateStatus(String userNo, String status) {
		 Map<String, Object> paramMap = new HashMap<>(); 
		 paramMap.put("userNo",userNo); 
		 paramMap.put("status", status);
		 
		 return adminDao.updateStatus(sqlSession, paramMap); 
	 }
	 

	
    
	// 회원 관리에서 클릭한 회원의 상세조회를 위한 정보 가져오기
	@Override
	public Member adminMemberDetailView(String userNo) {
		return adminDao.adminMemberDetailView(sqlSession, userNo );
	}
	

	/* 매칭후기 관리 시작!!!!!!!!!!!!!!!!!! */
	@Override
	public int boardSelectListCount() {
		
		return adminDao.boardSelectListCount(sqlSession);
	}
	
	// 게시글 전체 조회
	@Override
	public ArrayList<Board> boardSelectList(PageInfo pi) {
		
		return adminDao.boardSelectList(sqlSession, pi);
	}
	// 검색 게시글 개수 조회
	@Override
	public int adminSearchListCount(String keyword) {
       
		return adminDao.adminSearchListCount(sqlSession, keyword);
    }
	// 검색 게시글 조회
	@Override
	public List<Board> adminSearchList(String keyword, int currentPage, int pageLimit, int boardLimit) {
       
		return adminDao.adminSearchList(sqlSession, keyword, currentPage, pageLimit, boardLimit);
    }

	/* 결제 관리 시작!!!!!!!!!!!!!!!!!! */
	// 결제관리 게시글 개수 조회
	@Override
	public int adminPaySelectListCount() {
		
		return adminDao.adminPaySelectListCount(sqlSession);
	}
	
	// 결제관리 게시글 전체 조회
	@Override
	public ArrayList<KakaoPay> adminPaySelectList(PageInfo pi) {
		
		return adminDao.adminPaySelectList(sqlSession, pi);
	}

	// 환불요청 승인 버튼 클릭
	@Override
	@Transactional
	public int refundSuccess(KakaoPay k) {
		return adminDao.refundSuccess(sqlSession, k);
	}
	
	// 환불요청 거절 버튼 클릭
	@Override
	@Transactional
	public int refundRefusal(KakaoPay k) {
		return adminDao.refundSuccess(sqlSession, k);
	}

	// 환불 회원수 검색 조회용
	@Override
	public int paySearchListCount(String keyword) {

		return adminDao.paySearchListCount(sqlSession, keyword);
	}
	// 환불 회원 검색 조회용
	@Override
	public List<KakaoPay> paySearchList(String keyword, int currentPage, int pageLimit, int boardLimit) {
		
		return adminDao.paySearchList(sqlSession, keyword, currentPage, pageLimit, boardLimit);
	}

	
	
}
