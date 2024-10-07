package com.kh.usTwo.fun.model.vo;

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
public class Qtest {
	private int qtestNo;
	private String qtestContent;
	private int testNo;
	private String email;
	private String coupleCode;
}
