package com.kh.usTwo.member.controller;

import javax.servlet.http.HttpSession;

<<<<<<< HEAD
=======
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 795de97b18067b18f189b169196ebadfadfd95be
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("login")
<<<<<<< HEAD
	public String homeMember(HttpSession session) {
		session.setAttribute("loginUser", "loginUser");
		return "home/homeMember";
=======
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
>>>>>>> 795de97b18067b18f189b169196ebadfadfd95be
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home/homeGuest";
	}
<<<<<<< HEAD
=======
	
	@RequestMapping("signupForm")
	public String loginConditions() {
		return "member/loginConditions";
	}
	
	@RequestMapping("signupPage.me")
	public String enterSignupForm() {
		return "member/signupForm";
	}
	
	@RequestMapping(value="insert.me")
	public String insertMember(Member m, HttpSession session) {
		int result = mService.insertMember(m);
		
		System.out.println(result);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공하였습니다.");
			return "member/loginForm";
		}else {
			session.setAttribute("alertMsg", "회원가입 실패");
			return "member/signupForm";
		}
		
		
	}
	
	
	@RequestMapping("reEnrollFrom.me")
	public String reEnrollForm(){
		return "member/loginForm";		
	}
	
>>>>>>> 795de97b18067b18f189b169196ebadfadfd95be
}
