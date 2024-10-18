package com.kh.usTwo.plan.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Calendar {
	
	private int calendarNo;
	private String coupleCode;
	private String owner;
	private String defaultColor;
	private String status;
}
