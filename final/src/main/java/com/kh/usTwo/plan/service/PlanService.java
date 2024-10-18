package com.kh.usTwo.plan.service;

import java.util.ArrayList;

import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;

public interface PlanService {

	ArrayList<Calendar> selectCalendarList(String coupleCode);
	
	ArrayList<Schedule> selectScheduleList(SelectSchedule ss);
	
	int insertSchedule(Schedule s);
	
	int updateSchedule(Schedule s);
	
	int deleteSchedule(int scheduleNo);
}
