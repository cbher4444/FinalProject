package com.kh.usTwo.plan.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.plan.model.vo.Schedule;

@Repository
public class PlanDao {

	public ArrayList<Schedule> selectScheduleList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("");
	}



}
