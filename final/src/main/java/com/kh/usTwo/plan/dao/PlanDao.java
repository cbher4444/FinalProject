package com.kh.usTwo.plan.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.plan.model.vo.Schedule;

@Repository
public class PlanDao {

	public ArrayList<Schedule> selectScheduleList(SqlSessionTemplate sqlSession, String yearMonth) {
		return (ArrayList)sqlSession.selectList("planMapper.selectScheduleList", yearMonth);
	}

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		System.out.println(s);
		return sqlSession.insert("planMapper.insertSchedule", s);
	}



}
