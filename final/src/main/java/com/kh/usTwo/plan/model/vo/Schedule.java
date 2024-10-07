package com.kh.usTwo.plan.model.vo;

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
	private String createDate;
	private String writerEmail;
	private String color;
	private String isAnniversary;
	private String alertDate;
	private String status;
	
}
