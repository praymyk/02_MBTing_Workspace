package com.kh.mbting.mbti.model.vo;

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
public class Mbti {
	private 	int 		userNo;
	private 	String 		userName;
	private 	String 		introduce;
	private 	String 		profileImg;
	private 	String 		mbti;
	private 	String 		mbtiNick;
	private 	String 		mbtiMatch;
	private 	int 		proposerNo;			//PROPOSER_NO 나에게 매칭을 신청한 사람의 user_no를 확인하기 위한 변수
	private 	int 		receiverNo;
	private 	String 		status;
}
