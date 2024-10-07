package com.kh.usTwo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("login")
	public String homeMember(HttpSession session) {
		session.setAttribute("loginUser", "loginUser");
		return "home/homeMember";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home/homeGuest";
	}
}
