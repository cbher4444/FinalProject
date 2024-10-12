package com.kh.usTwo.plan.model.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class SelectSchedule {

	private String coupleCode;
	private String yearMonth;
	private ArrayList<Integer> calendarNoList;
	private int calendarNo;
	
}
