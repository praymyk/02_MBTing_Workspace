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
public class BoardImg {
	
	private int imgNo;	// IMG_NO	NUMBER
	private String originName;	// ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName;	// CHANGE_NAME	VARCHAR2(100 BYTE)
	private String thumbnail;	// THUMBNAIL	CHAR(1 BYTE)
	private int boardNo;	// BOARD_NO	NUMBER
	
}
