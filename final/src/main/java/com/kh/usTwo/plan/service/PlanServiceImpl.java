package com.kh.usTwo.plan.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.plan.dao.PlanDao;
import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;

@Service
public class PlanServiceImpl implements PlanService{

	@Autowired
	private PlanDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Calendar> selectCalendarList(String coupleCode) {
		return pDao.selectCalendarList(sqlSession, coupleCode);
	}
	
	@Override
	public ArrayList<Schedule> selectScheduleList(SelectSchedule ss) {
		return pDao.selectScheduleList(sqlSession, ss);
	}

	@Override
	public int insertSchedule(Schedule s) {
		return pDao.insertSchedule(sqlSession, s);
	}

	
	

}
