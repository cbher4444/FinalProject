package com.kh.usTwo.plan.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {

	@RequestMapping("calendar")
	public String calendar() {
		return "plan/calendar";
	}
	
	@RequestMapping("bucket")
	public String bucket() {
		return "plan/bucket";
	}
	
	@RequestMapping("todo")
	public String todo() {
		return "plan/todo";
	}
	
	@RequestMapping(value="slist.pl", produces="application/json; charset=utf-8")
	public String ajaxSelectScheduleList() {
//		ArrayList<E>
		return "";
	}
}
