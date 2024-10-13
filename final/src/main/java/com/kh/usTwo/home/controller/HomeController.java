package com.kh.usTwo.home.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.usTwo.member.model.vo.Member;

@Controller
public class HomeController {
	
	@RequestMapping("home")
	public String home(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "home/homeGuest";
		}else {
			if(loginUser.getEmail().equals("admin@email.com")) { // 관리자인 경우
				return "adminPage/adminPage";
			}else if(!loginUser.getStatus().equals("Y")){ // 커플등록이 미완료된 경우, 탈퇴대기 상태인경우,
				return "mypage/myPage";
			}else { // 커플등록 완료
				return "home/homeMember";
			}
		}
		
	}
}
