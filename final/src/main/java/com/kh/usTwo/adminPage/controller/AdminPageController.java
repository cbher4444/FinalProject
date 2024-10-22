package com.kh.usTwo.adminPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.usTwo.adminPage.model.service.AdminPageService;
import com.kh.usTwo.common.model.vo.PageInfo;
import com.kh.usTwo.common.template.Pagination;
import com.kh.usTwo.member.model.vo.Member;

@Controller
public class AdminPageController {
	
	@Autowired
	private AdminPageService adService;
	
	@RequestMapping("adminPage")
	public String adminPage(@RequestParam(value="cpage", defaultValue="1") int currentPage ,Model model) {
		
		int listCount = adService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = adService.selectMemberList(pi);
		
		model.addAttribute("list", list).addAttribute("pi",pi);
		return "adminPage/adminPage";
	}
}
