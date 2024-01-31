package com.kh.mbting.matching.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Matching {

	private int matchNo;
	private String receiverNo;
	private String proposerNo;
	private int matchTime;
	private String propStat;
	private String receStat;
	private int matchStat;
}
