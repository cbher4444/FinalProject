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
public class Aservey {
	private int aserveyNo;
	private String aserveyContent;
	private int qserveyNo;
	private String email;
	private String coupleCode;
}
