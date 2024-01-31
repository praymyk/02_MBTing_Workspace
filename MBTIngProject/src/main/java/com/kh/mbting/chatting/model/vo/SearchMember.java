package com.kh.mbting.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchMember {
	private int userNo;
	private int startAge;
	private int endAge;
	private int startHeight;
	private int endHeight;
	private String address;
	private String mbti; 
	private String gender;
	private String age;
	private String height;
	private String email;
	
	/**/
	public SearchMember(String age, String height, String address, String mbti, String gender, int userNo, String email) {
		this.age = age;
		this.height = height;
		this.address = address;
		this.mbti = mbti;
		this.gender = gender;
		this.userNo = userNo;
		this.email = email;
	}
	
	public SearchMember(int startAge, int endAge, int startHeight, int endHeight, String address, String mbti, String gender, int userNo , String email) {
		this.startAge = startAge;
		this.endAge = endAge;
		this.startHeight = startHeight;
		this.endHeight = endHeight;
		this.address = address;
		this.mbti = mbti;
		this.gender = gender;
		this.userNo = userNo;
		this.email = email;
	}
	
	/*age와 height 중 height만 없음일 때 */
	public SearchMember(int startAge, String address, int endAge, String mbti, String gender , String height, int userNo, String email) {
		this.startAge = startAge;
		this.address = address;
		this.endAge = endAge;
		this.mbti = mbti;
		this.gender = gender;
		this.height = height;
		this.userNo = userNo;
		this.email = email;
	}
	
	/*age와 height중 age만 없음일 때*/
	public SearchMember(int startHeight, int endHeight, String address, String mbti, String gender , String age, int userNo, String email) {
		this.startHeight = startHeight;
		this.endHeight = endHeight;
		this.address = address;
		this.mbti = mbti;
		this.gender = gender;
		this.age = age;
		this.userNo = userNo;
		this.email = email;
	}
}
