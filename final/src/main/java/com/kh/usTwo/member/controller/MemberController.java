package com.kh.usTwo.member.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("findIdForm")
	public String findIdform() {
		return "member/findId";
	}
	
	@RequestMapping("findPwdForm")
	public String findPwdform() {
		return "member/findPwd";
	}
	
	@RequestMapping("findId")
	public String findId(Member m, HttpSession session) {
		String email = mService.findId(m);
		
		if(email != null) {
			session.setAttribute("alertMsg", "당신의 아이디는 "+email+" 입니다.");
			session.setAttribute("email", email);
			return "member/findId";
		}else {
			session.setAttribute("alertMsg", "아이디를 찾지 못했습니다.");
			return "member/loginForm";
		}
		
	}
	
	@RequestMapping("checkUser")
	public String checkUser(Member m, HttpSession session) {
		String checkUser = mService.checkUser(m);
		System.out.println(checkUser);
		
		if(checkUser != null) {
			session.setAttribute("checkUser", checkUser);
			return "member/findPwd2";
		}else {
			session.setAttribute("alertMsg", "잘못 입력하셨습니다. 정확히 입력해주세요.");
			return "member/findPwd";
		}
		
	}
	
	@RequestMapping("updatePwd")
	public String updatePwd(Member m , HttpSession session) {
		
		int updatePwd = mService.updatePwd(m);
		
		
		if(updatePwd > 0) {
			session.setAttribute("alertMsg", "비밀번호 변경 완료했습니다.");
			return "member/loginForm";
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
			return "member/findPwd";
		}
	}
	
	
	
	
	
}
