package com.kh.usTwo.plan.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Schedule {
	
	private int scheduleNo;
	private int calendarNo;
	private String title;
	private String content;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private Date createDate;
	private Date alertDate;
	private String color;
	private String writer;
	private String status;
	
}
