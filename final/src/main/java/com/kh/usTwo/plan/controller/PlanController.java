package com.kh.usTwo.plan.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.usTwo.member.model.vo.Member;
import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Mindmap;
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

	@RequestMapping("mindmap")
	public String bucket() {
		return "plan/mindmap";
	}

	@RequestMapping("todo")
	public String todo() {
		return "plan/todo";
	}

	@ResponseBody
	@RequestMapping(value = "clist.pl", produces = "application/json; charset=utf-8")
	public String ajaxSelectCalendarList(String coupleCode) {
		ArrayList<Calendar> list = pService.selectCalendarList(coupleCode);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "slist.pl", produces = "application/json; charset=utf-8")
	public String ajaxSelectScheduleList(SelectSchedule ss) {
		ArrayList<Schedule> list = pService.selectScheduleList(ss);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "sinsert.pl")
	public String ajaxInsertSchedule(Schedule s) {
		int result = pService.insertSchedule(s);
		return result > 0 ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping(value = "supdate.pl")
	public String ajaxUpdateSchedule(Schedule s) {
		int result = pService.updateSchedule(s);
		return result > 0 ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping(value = "sdelete.pl")
	public String ajaxDeleteSchedule(int scheduleNo) {
		int result = pService.deleteSchedule(scheduleNo);
		return result > 0 ? "success" : "fail";
	}

	// 마인드맵 리스트 조회
	@ResponseBody
	@RequestMapping(value = "mlist.pl", produces = "application/json; charset=utf-8")
	public String ajaxSelectMindmapList(String coupleCode) {
		ArrayList<Mindmap> list = pService.selectMindmapList(coupleCode);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "mupdate.pl")
	public String ajaxUpdateMindmapList(@RequestBody ArrayList<Mindmap> mindmapList, HttpSession session) {
		System.out.println(mindmapList);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String coupleCode = loginUser.getCoupleCode();
		
		for(Mindmap m : mindmapList) {
			m.setCoupleCode(coupleCode);
		}
		
		int result = pService.updateMindmapList(mindmapList, session);
		return result > 0 ? "success" : "fail";
	}

}
