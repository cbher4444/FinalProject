package com.kh.usTwo.plan.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Mindmap {
	
	private int key;
	private Integer parent; // null 값을 허용하게 하기위해 int가 아닌 Integer를 사용함.
	private String text;
	private String brush;
	private String dir;
	private String loc;
	private String coupleCode;
	
}
