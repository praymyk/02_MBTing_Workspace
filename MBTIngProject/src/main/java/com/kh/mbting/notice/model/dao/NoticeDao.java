package com.kh.mbting.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	// 검색된 공지사항 개수 조회
	public int searchListCount(SqlSessionTemplate sqlSession, String keyword) {
      
		return sqlSession.selectOne("noticeMapper.searchListCount", keyword);
    }

	// 검색된 공지사항 리스트 조회
	public List<Notice> searchList(SqlSessionTemplate sqlSession, String keyword, int currentPage, int pageLimit, int boardLimit) {
	    int startRow = (currentPage - 1) * boardLimit;
	    int endRow = startRow + boardLimit; 

	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("startRow", startRow);
	    parameters.put("endRow", endRow);

	    return sqlSession.selectList("noticeMapper.searchList", parameters);
	}
	
	// 조회수 업데이트 메소드
    public int updateViews(SqlSessionTemplate sqlSession, int noticeNo) {
       
    	return sqlSession.update("noticeMapper.updateViews", noticeNo);
    }


}
