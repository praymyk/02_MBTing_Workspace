package com.kh.mbting.admin.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemPay {
	private String userNo;			//	USER_NO	NUMBER
	private String email; 			//	EMAIL	VARCHAR2(30 BYTE)
	private String userPwd;			//	USER_PWD	VARCHAR2(60 BYTE)
	private String profileImg;		//	PROFILE_IMG	VARCHAR2(100 BYTE)
	private String userName;		//	USER_NAME	VARCHAR2(30 BYTE)
	private int age;				//	AGE	NUMBER
	private String gender;			//	GENDER	CHAR(1 BYTE)
	private int height;				// HEIGHT NUMBER
	private String phone;			//	PHONE	VARCHAR2(13 BYTE)
	private String mbti;			//	MBTI	VARCHAR2(4 BYTE)
	private String mbtiNick;		//	MBTI_NICK	VARCHAR2(30 BYTE)
	private String mbtiMatch;
	private String introduce;		//	INTRODUCE	VARCHAR2(1000 BYTE)
	private String address;			// ADDRESS
	private Date enrollDate;		//	ENROLL_DATE	DATE
	private Date modifyDate;		//	MODIFY_DATE	DATE
	private int matchStat;			//	MATCH_STAT	NUMBER
	private int matchCoin;			//	MATCH_COIN	NUMBER
	private String status;			//	STATUS	CHAR(1 BYTE)		
	private int proposerNum;		//  나에게 매칭을 신청한 사람 숫자를 확인하기 위한 변수
	private int matchRoomNo;
	private int proposerNo;			//PROPOSER_NO 나에게 매칭을 신청한 사람의 user_no를 확인하기 위한 변수
	private String changePwd;		// 비밀번호 변경용 Pwd;
	private String receiverNo;
	private String partnerUserId; // KAKAOPAY
}