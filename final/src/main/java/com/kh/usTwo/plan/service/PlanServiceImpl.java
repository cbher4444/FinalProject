package com.kh.usTwo.plan.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.member.model.vo.Member;
import com.kh.usTwo.plan.dao.PlanDao;
import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Mindmap;
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

	@Override
	public int updateSchedule(Schedule s) {
		return pDao.updateSchedule(sqlSession, s);
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		return pDao.deleteSchedule(sqlSession, scheduleNo);
	}

	@Override
	public ArrayList<Mindmap> selectMindmapList(String coupleCode) {
		return pDao.selectMindmapList(sqlSession, coupleCode);
	}

	@Override
	public int updateMindmapList(ArrayList<Mindmap> mindmapList, HttpSession session) {
		String coupleCode = ((Member)session.getAttribute("loginUser")).getCoupleCode();
		pDao.deleteMindmapList(sqlSession, coupleCode); // 기존 데이터 지우기
		if(mindmapList.size() > 0) { // 새로 넣을 데이터가 있는경우
			return pDao.insertMindmapList(sqlSession, mindmapList); // 새로운 데이터로 새로 넣기
		}else { // 새로 넣을 데이터가 없는 경우.
			return 1;
		}
	}

	
	

}
