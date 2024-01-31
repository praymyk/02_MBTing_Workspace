package com.kh.mbting.notice.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor

@Getter
@Setter
@ToString
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeName;
	private String modifyDate;
	private String enrollDate;
	private int views;
	private String status;
}
