package com.kh.usTwo.fun.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.usTwo.fun.model.service.FunServiceImpl;
import com.kh.usTwo.fun.model.vo.Atest;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.fun.model.vo.Test;
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
	@RequestMapping(value="selectQtest.test", produces = "application/json; charset=utf-8")
	public String selectQtest(Member m) {
		return new Gson().toJson(fService.selectQtest(m));
	}
	
	@ResponseBody
	@RequestMapping(value="selectOptionTest.test", produces = "application/json; charset=utf-8")
	public String selectOptionTest(int testNo) {
		return new Gson().toJson(fService.selectOptionTest(testNo));
	}
	
	@ResponseBody
	@RequestMapping(value="selectQlove.qna", produces = "application/json; charset=utf-8")
	public String selectQlove(Member m) {
		return new Gson().toJson(fService.selectQlove(m));
	}
	
	@ResponseBody
	@RequestMapping(value="selectAlove.qna", produces = "application/json; charset=utf-8")
	public String selectAlove(Member m) {
		return new Gson().toJson(fService.selectAlove(m));
	}
	
	@ResponseBody
	@RequestMapping(value="selectAtest.test", produces = "application/json; charset=utf-8")
	public String selectAtest(Test t) {
		return new Gson().toJson(fService.selectAtest(t));
	}
	
	@ResponseBody
	@RequestMapping("updateAtest.test")
	public int updateAtest(Atest a) {
		return fService.updateAtest(a);
	}
	
	@ResponseBody
	@RequestMapping("insertAtest.test")
	public int insertAtest(Atest a) {
		return fService.insertAtest(a);
	}
	
	@ResponseBody
	@RequestMapping("updateTest.test")
	public int updateTest(Test t) {
		return fService.updateTest(t);
	}
	
	@ResponseBody
	@RequestMapping("countAtest.test")
	public int countAtest(Member m) {
		return fService.countAtest(m);
	}
}
