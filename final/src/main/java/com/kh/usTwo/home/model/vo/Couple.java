package com.kh.usTwo.home.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Couple {

	private String coupleCode;
	private Date startDate;
	private String originName;
	private String changeName;
	private String sentence;
	private String status;
}
