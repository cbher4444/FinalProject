package com.kh.usTwo.home.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.usTwo.member.model.vo.Member;

@Controller
public class HomeController {
	
	@RequestMapping("home")
	public String home(HttpSession session) {
		
		Member loginUser = null;
		
		if(session.getAttribute("loginUser") != null) {
			loginUser = (Member)session.getAttribute("loginUser");
		}
		
		if(loginUser == null) {
			return "home/homeGuest";
		}else {
			return "home/homeMember";
		}
		
	}
}
