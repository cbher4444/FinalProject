package com.kh.usTwo.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	public String chat(Model model) {
		log.info("[Controller] : chat.do");
		return "chat";
	}
	
	@ResponseBody
	@RequestMapping("chatbox")
	public String chatBox() {
		return "success";
	}
	
}
