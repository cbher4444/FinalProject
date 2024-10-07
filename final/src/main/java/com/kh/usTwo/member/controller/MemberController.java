package com.kh.usTwo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.usTwo.member.model.service.MemberServiceImpl;
import com.kh.usTwo.member.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("login")
	public String homeMember(HttpSession session, Member m) {
		Member loginUser = mService.loginMember(m);
		if(loginUser != null) {
			Member partner = mService.selectPartnerEmail(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("partner", partner);
			return "home/homeMember";
		}else {
			session.setAttribute("alertMsg", "로그인 실패");
			return "member/loginForm";
		}
		
		
		
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home/homeGuest";
	}
	
	@RequestMapping("signupForm")
	public String loginConditions() {
		return "member/loginConditions";
	}
	
	@RequestMapping("enterSignupForm")
	public String signupForm() {
		return "member/signupForm";
	}
	
	
	@RequestMapping("reEnrollFrom.me")
	public String reEnrollForm(){
		return "member/loginForm";		
	}
	
}
