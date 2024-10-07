package com.kh.usTwo.fun.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Qtoday {
	private int qtodayNo;
	private String qtodayContent;
	private Date qtodayDate;
	private String coupleCode;
}
