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
public class QnA {
	private int qtodayNo;
	private Date qtodayDate;
	private String qtodayContent;
	private String myContent;
	private String partnerContent;
}
