package com.kh.usTwo.member.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
			return "redirect:home"; // 홈으로 리다이렉트 되도록 수정함. - by 동규 (2024.10.13)
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
	
}
