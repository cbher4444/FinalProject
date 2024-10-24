package com.kh.usTwo.fun.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.usTwo.common.model.vo.PageInfo;
import com.kh.usTwo.common.template.Pagination;
import com.kh.usTwo.fun.model.service.FunServiceImpl;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.Atest;
import com.kh.usTwo.fun.model.vo.Atoday;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.QnA;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.fun.model.vo.Qtoday;
import com.kh.usTwo.fun.model.vo.ResponseData;
import com.kh.usTwo.fun.model.vo.Test;
import com.kh.usTwo.member.model.vo.Member;

@Controller
public class FunController {
	@Autowired
	private FunServiceImpl fService;
	
	@RequestMapping("goFun1")
	public String goFun1(HttpSession session, Member m) {
		// 1. A -> X / B -> X : 바로 설문조사 화면 출력, 연애고사 응시 불가
		// 2. A -> X / B -> O : 바로 설문조사 화면 출력, 연애고사 응시 불가
		// 3. A -> O / B -> X : 상대방 재촉(알람), 연애고사 응시 불가
		// 4. A -> O / B -> O : 연애 고사 응시 가능
		
		// A와 B의 설문조사 결과를 모두 받아와야 함.
		String result = fService.countTest(m) + "/";
		result += fService.countAservey(m) + "/";
		m.setEmail(m.getPartnerEmail());
		result += fService.countAservey(m);
		
		session.setAttribute("count", result);
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
	
	@RequestMapping("goGame")
	public String goGame() {
		return "fun/game";
	}
	
	@ResponseBody
	@RequestMapping(value="selectQtest.test", produces = "application/json; charset=utf-8")
	public String selectQtest(Member m) {
		return new Gson().toJson(fService.selectQtest(m));
	}
	
	@ResponseBody
	@RequestMapping(value="selectQtestSpecific.test", produces = "application/json; charset=utf-8")
	public String selectQtestSpecific(int testNo) {
		return new Gson().toJson(fService.selectQtestSpecific(testNo));
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
	@RequestMapping(value="countAtest.test", produces = "application/json; charset=utf-8")
	public int countAtest(Member m) {
		return fService.countAtest(m);
	}
	
	@ResponseBody
	@RequestMapping(value="selectQservey.test", produces = "application/json; charset=utf-8")
	public String selectQservey() {
		return new Gson().toJson(fService.selectQservey());
	}
	
	@ResponseBody
	@RequestMapping(value="insertAservey.servey", produces = "application/json; charset=utf-8")
	public int insertAservey(Aservey a) {
		return fService.insertAservey(a);
	}
	
	@ResponseBody
	@RequestMapping(value="selectQnA.today", produces = "application/json; charset=utf-8")
	public ArrayList<QnA> selectQnA(String email, String coupleCode, String partnerEmail, String startDate, String endDate) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("email", email);
		hm.put("coupleCode", coupleCode);
		hm.put("startDate", startDate);
		hm.put("endDate", endDate);
		
		ArrayList<Qtoday> qlist = fService.selectQtoday();
		
		ArrayList<Atoday> myAlist = fService.selectAtoday(hm);
		
		hm.replace("email", partnerEmail);
		
		ArrayList<Atoday> partnerAlist = fService.selectAtoday(hm);
		
		ArrayList<QnA> allList = new ArrayList<QnA>();
		
		for (Qtoday q : qlist) {
			for (Atoday my : myAlist) {
				for (Atoday partner : partnerAlist) {
					if (q.getQtodayNo() == my.getQtodayNo() && q.getQtodayNo() == partner.getQtodayNo()) {
						allList.add(new QnA(q.getQtodayNo(),
											my.getQtodayDate(),
											q.getQtodayContent(),
											my.getAtodayContent(),
											partner.getAtodayContent()));
					}
				}
			}
		}
		
		System.out.println(allList);
		return allList;
	}
	
	@ResponseBody
	@RequestMapping("updateAtoday.today")
	public int updateAtoday(String atodayContent, String email, String coupleCode, String today) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("atodayContent", atodayContent);
		hm.put("email", email);
		hm.put("coupleCode", coupleCode);
		hm.put("today", today);
		
		return fService.updateAtoday(hm);
	}
	
	@ResponseBody
	@RequestMapping(value="selectTest.test", produces = "application/json; charset=utf-8")
	public String selectTest(@RequestParam(value="cpage", defaultValue="1") int currentPage, String coupleCode) {
		int listCount = fService.countTestCouple(coupleCode);
		int pageLimit = 10;
		int testLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, testLimit);
		
		ArrayList<Test> list = fService.selectTestCouple(coupleCode, pi);
		
		return new Gson().toJson(new ResponseData(list, pi));
	}
}
