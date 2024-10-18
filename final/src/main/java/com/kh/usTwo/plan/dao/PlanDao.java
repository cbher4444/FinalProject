package com.kh.usTwo.plan.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;

@Repository
public class PlanDao {

	public ArrayList<Calendar> selectCalendarList(SqlSessionTemplate sqlSession, String coupleCode) {
		return (ArrayList)sqlSession.selectList("planMapper.selectCalendarList", coupleCode);
	}
	
	public ArrayList<Schedule> selectScheduleList(SqlSessionTemplate sqlSession, SelectSchedule ss) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		for(int i : ss.getCalendarNoList()) {
			ss.setCalendarNo(i);
			list.addAll((ArrayList)sqlSession.selectList("planMapper.selectScheduleList", ss));
		}
		return list;
	}

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("planMapper.insertSchedule", s);
	}

	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("planMapper.updateSchedule", s);
	}

	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		return sqlSession.update("planMapper.deleteSchedule", scheduleNo);
	}





}
