package com.kh.usTwo.fun.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.usTwo.fun.model.service.FunServiceImpl;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.member.model.vo.Member;

@Controller
public class FunController {
	@Autowired
	private FunServiceImpl fService;
	
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
	
	@ResponseBody
	@RequestMapping(value="selectQuestion.test", produces = "application/json; charset=utf-8")
	public String selectQuestion(Member m) {
		return new Gson().toJson(fService.selectQuestion(m));
	}
	
	@ResponseBody
	@RequestMapping(value="selectOption.test", produces = "application/json; charset=utf-8")
	public String selectOption(int testNo) {
		return new Gson().toJson(fService.selectOption(testNo));
	}
}
