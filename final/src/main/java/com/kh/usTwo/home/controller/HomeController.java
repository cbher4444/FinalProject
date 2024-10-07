package com.kh.usTwo.home.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("home")
	public String home(HttpSession session) {
		
		String loginUser = null;
		
		if(session.getAttribute("loginUser") != null) {
			loginUser = (String)session.getAttribute("loginUser");
		}
		
		if(loginUser == null) {
			return "home/homeGuest";
		}else {
			return "home/homeMember";
		}
		
	}
}
