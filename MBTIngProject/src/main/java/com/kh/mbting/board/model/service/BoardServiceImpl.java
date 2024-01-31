package com.kh.mbting.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mbting.board.model.dao.BoardDao;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.board.model.vo.BoardImg;
import com.kh.mbting.common.model.vo.PageInfo;

@Service
@EnableTransactionManagement
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	@Override
	@Transactional
	public int insertBoard(Board b) {
		return boardDao.insertBoard(sqlSession, b);
	}

	@Override
	@Transactional
	public int insertBoardImg(BoardImg bi) {
		return boardDao.insertBoardImg(sqlSession, bi);
	}
	
	@Override
	@Transactional
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}
	
	@Override
	public ArrayList<BoardImg> selectBoardImg(int boardNo) {
		return boardDao.selectBoardImg(sqlSession, boardNo);
	}

	@Override
	@Transactional
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}
	
	@Override
	@Transactional
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Board> selectTopBoardList() {
		return boardDao.selectTopBoardList(sqlSession);
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return boardDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return boardDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public int checkThumb(HashMap<String, Object> map) {
		return boardDao.checkThumb(sqlSession, map);
	}

	@Override
	public int insertThumb(HashMap<String, Object> map) {
		return boardDao.insertThumb(sqlSession, map);
	}

	@Override
	public int deleteThumb(HashMap<String, Object> map) {
		return boardDao.deleteThumb(sqlSession, map);
	}
	
	/* 관리자 페이지 코드 */
	// 후기게시글 상세조회
	@Override
	public Board adminSelectBoard(int boardNo) {
		return boardDao.adminSelectBoard(sqlSession, boardNo);
	}
	
	// 후기게시글 상세조회 시 이미지 가져오기(?)
	@Override
	public ArrayList<BoardImg> adminSelectBoardImg(int boardNo) {
		return boardDao.adminSelectBoardImg(sqlSession, boardNo);
	}
	
	// 후기게시글 삭제
	@Override
	@Transactional
	public int adminDeleteBoard(int boardNo) {
		return boardDao.adminDeleteBoard(sqlSession, boardNo);
	}

}
