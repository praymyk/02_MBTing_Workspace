package com.kh.mbting.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Month {
	private String month;
	private int    enrollCount;
	private int matchStat;
}
