package com.kh.usTwo.plan.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;
import com.kh.usTwo.plan.service.PlanServiceImpl;

@Controller
public class PlanController {

	@Autowired
	private PlanServiceImpl pService;
	
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
	
	@ResponseBody
	@RequestMapping(value="clist.pl", produces="application/json; charset=utf-8")
	public String ajaxSelectCalendarList(String coupleCode) {
		ArrayList<Calendar> list = pService.selectCalendarList(coupleCode);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="slist.pl", produces="application/json; charset=utf-8")
	public String ajaxSelectScheduleList(SelectSchedule ss) {
		ArrayList<Schedule> list = pService.selectScheduleList(ss);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="sinsert.pl")
	public String ajaxInsertSchedule(Schedule s) {
		int result = pService.insertSchedule(s);
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="supdate.pl")
	public String ajaxUpdateSchedule(Schedule s) {
		int result = pService.updateSchedule(s);
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="sdelete.pl")
	public String ajaxDeleteSchedule(int scheduleNo) {
		int result = pService.deleteSchedule(scheduleNo);
		return result > 0 ? "success" : "fail";
	}
}

















