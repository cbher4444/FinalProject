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
	private String scheduleTitle;
	private String scheduleContent;
	private String startDate;
	private String endDate;
	private Date createDate;
	private String writerEmail;
	private String color;
	private String isAnniversary;
	private Date alertDate;
	private String status;
	
}
