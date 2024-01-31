package com.kh.mbting.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.admin.model.dto.MemPay;
import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

@Repository
public class AdminDao {
	
	// 전체 회원 수 조회
	public int selectTotalMembers(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectTotalMembers");
	}
	
	// 전체 커플매칭 수 조회
	public int selectTotalCouple(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectTotalCouple");
	}
	
	// 전체 결제금액 조회
	public int selectTotalPay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("kakaoPayMapper.selectTotalPay");
	}

	// 전체 후기게시글 수 조회
	public int selectTotalBoard(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectTotalBoard");
	}
	
	// 월별 회원 가입 그래프 
	public ArrayList<Month> selectTotalMonthly(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTotalMonthly");
	}
	
	// 커플 매칭 상태 수락 그래프
	public ArrayList<Matching> totalMatchingSuccess(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingSuccess");
	}
	
	// 커플 매칭 상태 거절 그래프 totalMatchingRefusal
	public ArrayList<Matching> totalMatchingRefusal(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingRefusal");
	}
	
	// 커플 매칭 상태 보류 그래프
	public ArrayList<Matching> totalMatchingPending(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingPending");
	}
	
	// MBTI 성향 분포도
	public ArrayList<Member> totalMbtiCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMbtiCount");
	}
	
	// 남녀성비 원그래프
	public ArrayList<Member> totalGenderRate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalGenderRate");
	}
	
	// 매칭 성공률 원그래프
	public ArrayList<Matching> totalMatchingRate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingRate");
	}
	
	// 유료계정비율 원그래프
	public ArrayList<KakaoPay> totalPremiumCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalPremiumCount");
	}
	
	// 무료계정비율 원그래프
	public ArrayList<KakaoPay> totalFreeCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalFreeCount");
	}
	
	// 월별매출 그래프
	public ArrayList<KakaoPay> totalMonthlySalesCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalMonthlySalesCount");
	}
	
	// 년별매출 그래프
	public ArrayList<KakaoPay> totalyearlySalesCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalyearlySalesCount");
	}
	
	/* 회원 관리 시작!!!!!!!!!!!!!!!!!! */
	
	
	public int memberSelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.memberSelectListCount");
	}
	
	// 회원관리 전체조회
	public ArrayList<Member> memberSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.memberSelectList2", null, rowBounds);
	}
	
	
	/*
	 * public ArrayList<MemPay> memberSelectList2(SqlSessionTemplate sqlSession,
	 * PageInfo pi) {
	 * 
	 * int limit = pi.getBoardLimit(); int offset = (pi.getCurrentPage() - 1) *
	 * limit;
	 * 
	 * RowBounds rowBounds = new RowBounds(offset, limit);
	 * 
	 * return (ArrayList)sqlSession.selectList("memberMapper.memberSelectList2",
	 * null, rowBounds); }
	 */
	
	
	
	
	// 검색된 회원 수 조회
	public int memberSearchListCount(SqlSessionTemplate sqlSession, String keyword) {
      
		return sqlSession.selectOne("memberMapper.memberSearchListCount", keyword);
    }

	// 검색된 회원 리스트 조회
	public List<Member> memberSearchList(SqlSessionTemplate sqlSession, String keyword, int currentPage, int pageLimit, int boardLimit) {
	    int startRow = (currentPage - 1) * boardLimit;
	    int endRow = startRow + boardLimit;

	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("startRow", startRow);
	    parameters.put("endRow", endRow);

	    return sqlSession.selectList("memberMapper.memberSearchList", parameters);
	}
	
	
	// 단일 사용자 상태 업데이트
    public int updateStatus(SqlSessionTemplate sqlSession, @Param("status") String status, @Param("userNo") String userNo) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("status", status);
        parameters.put("userNo", userNo);
        return sqlSession.update("memberMapper.updateStatus", parameters);
    }
    
	/*
	 * // 선택된 회원의 상태 업데이트 public int updateSelectedStatus(SqlSessionTemplate
	 * sqlSession, ArrayList<String> memNo) {
	 * 
	 * System.out.println(memNo);
	 * 
	 * int result = 1; for(int i = 0; i < memNo.size(); i++) {
	 * System.out.println("반복 " + i); String memberNo = memNo.get(i);
	 * System.out.println(memberNo); result *=
	 * sqlSession.update("memberMapper.updateSelectedStatus", memberNo);
	 * 
	 * } System.out.println("result : " + result);
	 * 
	 * return result; }
	 * 
	 * // 선택되지 않은 회원의 상태 업데이트 public int updateSelectedStatus2(SqlSessionTemplate
	 * sqlSession, List<String> statusN) {
	 * 
	 * System.out.println(statusN);
	 * 
	 * int result = 1; for(int i = 0; i < statusN.size(); i++) { String memberNo =
	 * statusN.get(i); result *=
	 * sqlSession.update("memberMapper.updateSelectedStatus2", memberNo); } return
	 * result; }
	 */
    // 	회원관리 상태 변경 및 저장
    public int updateStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
    	return sqlSession.update("memberMapper.updateStatus", map);
    }
	// 회원 관리에서 클릭한 회원의 상세조회를 위한 정보 가져오기
	public Member adminMemberDetailView(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.adminMemberDetailView" , userNo);
	}
	
	
	/* 매칭후기 관리 시작!!!!!!!!!!!!!!!!!! */
	public int boardSelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	// 게시글 전체 조회
	public ArrayList<Board> boardSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.adminSelectList", null, rowBounds);
	}
	
	// 검색된 게시글 개수 조회
	public int adminSearchListCount(SqlSessionTemplate sqlSession, String keyword) {
      
		return sqlSession.selectOne("boardMapper.adminSearchListCount", keyword);
    }

	// 검색된 게시글 리스트 조회
	public List<Board> adminSearchList(SqlSessionTemplate sqlSession, String keyword, int currentPage, int pageLimit, int boardLimit) {
	    int startRow = (currentPage - 1) * boardLimit;
	    int endRow = startRow + boardLimit; 

	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("startRow", startRow);
	    parameters.put("endRow", endRow);

	    return sqlSession.selectList("boardMapper.adminSearchList", parameters);
	}
	
	public int selectAllMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectAllMember");
	}

	
	/* 결제 관리 시작!!!!!!!!!!!!!!!!!! */
	// 결제관리 게시글 총 개수 조회
	public int adminPaySelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("kakaoPayMapper.adminPaySelectListCount");
	}
	
	// 결제관리 게시글 전체 조회
	public ArrayList<KakaoPay> adminPaySelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.adminPaySelectList", null, rowBounds);
	}
	
	// 환불 요청 승인/거절 
	public int refundSuccess(SqlSessionTemplate sqlSession, KakaoPay k) {
		return sqlSession.update("kakaoPayMapper.refundSuccess", k);
	}
	
	// 환불 회원 게시글 수 검색 조회용
	public int paySearchListCount(SqlSessionTemplate sqlSession, String keyword) {
      
		return sqlSession.selectOne("kakaoPayMapper.paySearchListCount", keyword);
    }

	// 환불 회원 회원 검색 조회용
	public List<KakaoPay> paySearchList(SqlSessionTemplate sqlSession, String keyword, int currentPage, int pageLimit, int boardLimit) {
	    int startRow = (currentPage - 1) * boardLimit;
	    int endRow = startRow + boardLimit; 

	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("startRow", startRow);
	    parameters.put("endRow", endRow);

	    return sqlSession.selectList("kakaoPayMapper.paySearchList", parameters);
	}
    
	
	
}
