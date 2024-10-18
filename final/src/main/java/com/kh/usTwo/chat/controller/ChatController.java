package com.kh.usTwo.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.usTwo.member.model.service.MemberServiceImpl;
import com.kh.usTwo.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	private final MemberServiceImpl mService;

    // 생성자 주입 방식 사용
    @Autowired
    public ChatController(MemberServiceImpl mService) {
        this.mService = mService;
    }
	
    @RequestMapping("/chat")
	public String chat(Model model, Member m, HttpSession session) {
		
			log.info("[Controller] : chat.do");
			return "chat";
	
	}
	
	@ResponseBody
	@RequestMapping("chatbox")
	public String chatBox() {
		
		return "success";
	}
	
	
	@RequestMapping("faceTalk")
	public String faceTalk() {
		return "common/faceTalkFrom";
	}
	
}
