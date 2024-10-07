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
public class OptionTest {
	private int optionNo;
	private String optionContent;
	private String optionTrue;
	private int qtestNo;
	private int testNo;
	private String email;
	private String coupleCode;
}
