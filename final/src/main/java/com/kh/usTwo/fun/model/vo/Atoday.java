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
public class Atoday {
	private int atodayNo;
	private String atodayContent;
	private Date atodayDate;
	private int qtodayNo;
	private String email;
	private String couplCode;
}
