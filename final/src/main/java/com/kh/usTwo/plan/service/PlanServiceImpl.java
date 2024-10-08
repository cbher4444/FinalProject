package com.kh.usTwo.plan.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.plan.dao.PlanDao;
import com.kh.usTwo.plan.model.vo.Schedule;

@Service
public class PlanServiceImpl implements PlanService{

	@Autowired
	private PlanDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Schedule> selectScheduleList() {
		return pDao.selectScheduleList(sqlSession);
	}
	
	

}
