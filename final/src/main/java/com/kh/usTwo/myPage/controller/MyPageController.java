package com.kh.usTwo.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("myPage")
	public String calendar() {
		return "mypage/myPage";
	}
	
}
