package com.kh.mbting.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.board.model.vo.BoardImg;
import com.kh.mbting.common.model.vo.PageInfo;

public interface BoardService {
	
	int selectListCount();
	
	ArrayList<Board> selectList(PageInfo pi);
	
	int insertBoard(Board b);
	
	int insertBoardImg(BoardImg bi);
	
	int increaseCount(int boardNo);
	
	Board selectBoard(int boardNo);

	ArrayList<BoardImg> selectBoardImg(int boardNo);

	int deleteBoard(int boardNo);
	
	int updateBoard(Board b);

	ArrayList<Board> selectTopBoardList();

    int selectSearchListCount(HashMap<String, String> map);

    ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);
    
    int checkThumb(HashMap<String, Object> map);
    
    int insertThumb(HashMap<String, Object> map);
    
    int deleteThumb(HashMap<String, Object> map);
    
    /* 관리자 페이지 코드 */
	// 후기게시글 상세조회
    Board adminSelectBoard(int boardNo);

    // 후기게시글 상세조회 시 이미지 가져오기(?)
	ArrayList<BoardImg> adminSelectBoardImg(int boardNo);
	
	// 후기게시글 삭제
	int adminDeleteBoard(int boardNo);
	
}