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
public class Test {
	private int testNo;
	private int testScore;
	private Date testDate;
	private String email;
	private String coupleCode;
}
