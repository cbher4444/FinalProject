package com.kh.usTwo.fun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FunController {
	@RequestMapping("goFun1")
	public String goFun1() {
		return "fun/fun1";
	}
	
	@RequestMapping("goFun2")
	public String goFun2() {
		return "fun/fun2";
	}
	
	@RequestMapping("goFun3")
	public String goFun3() {
		return "fun/fun3";
	}
	
	@RequestMapping("goFun4")
	public String goFun4() {
		return "fun/fun4";
	}
}
