package com.kh.mbting.board.model.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.board.model.vo.BoardImg;
import com.kh.mbting.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;		
		RowBounds rowBounds = new RowBounds(offset, limit);		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertBoardImg(SqlSessionTemplate sqlSession, BoardImg bi) {
		return sqlSession.insert("boardMapper.insertBoardImg", bi);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	
	public ArrayList<BoardImg> selectBoardImg(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardImg", boardNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}
	
	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopBoardList");
	}

	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount", map);
	}

    public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
        int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
    }
   
    public int checkThumb(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
    	return sqlSession.selectOne("boardMapper.checkThumb", map);
    }
    
    public int insertThumb(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
    	return sqlSession.insert("boardMapper.insertThumb", map);
    }
    
    public int deleteThumb(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
    	return sqlSession.delete("boardMapper.deleteThumb", map);
    }
    
    /* 관리자 페이지 코드 */
	// 후기게시글 상세조회
    public Board adminSelectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	
    // 후기게시글 상세조회 시 이미지 가져오기(?)
	public ArrayList<BoardImg> adminSelectBoardImg(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardImg", boardNo);
	}
	
	// 후기게시글 삭제
	public int adminDeleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

}
