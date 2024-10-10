package com.kh.usTwo.plan.service;

import java.util.ArrayList;

import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;

public interface PlanService {

	ArrayList<Schedule> selectScheduleList(SelectSchedule ss);
	
	int insertSchedule(Schedule s);
	
}
