package com.kh.mbting.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Board {
	
	private int boardNo;			//	BOARD_NO	NUMBER
	private String boardTitle;		//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;	//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private int views;				//	VIEWS	NUMBER
	private Date enrollDate;		//	ENROLL_DATE	DATE
	private Date modifyDate;		//	MODIFY_DATE	DATE
	private String status;			//	STATUS	CHAR(1 BYTE)
	private String userNo;			//	USER_NO	NUMBER
	private int matchNo;			//	MATCH_NO	NUMBER
	
	// 타 테이블에서 참고해올 것
	private String originName;		//	BOARDIMG 테이블의 ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName;		//	BOARDIMG 테이블의 CHANGE_NAME VARCHAR2(100 BYTE)
	private String userName;		//	MEMBER 테이블의 MBTI_NICK VARCHAR2(30 BYTE)
	private int thumbCount;			//	THUMB 테이블의 데이터를 BOARD_NO 기준으로 카운트할 변수
}
