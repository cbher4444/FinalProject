package com.kh.usTwo.common.model.vo;

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
public class PageInfo {
	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int testLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
}
