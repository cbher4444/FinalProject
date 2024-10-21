package com.kh.usTwo.common.template;

import com.kh.usTwo.common.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int testLimit) {
		int maxPage = (int)Math.ceil((double)listCount / testLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, testLimit, maxPage, startPage, endPage);
	}
}
