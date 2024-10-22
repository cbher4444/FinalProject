package com.kh.usTwo.plan.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Mindmap;
import com.kh.usTwo.plan.model.vo.Phone;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;

@Repository
public class PlanDao {

	public ArrayList<Calendar> selectCalendarList(SqlSessionTemplate sqlSession, String coupleCode) {
		return (ArrayList)sqlSession.selectList("planMapper.selectCalendarList", coupleCode);
	}

	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("planMapper.insertCalendar", c);
	}

	public int updateCalendarColors(SqlSessionTemplate sqlSession, ArrayList<Calendar> list) {
		int result = 1;
		for(Calendar c : list) {
			result *= sqlSession.update("planMapper.updateCalendarColors", c);
		}
		return result;
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

	public ArrayList<Mindmap> selectMindmapList(SqlSessionTemplate sqlSession, String coupleCode) {
		return (ArrayList)sqlSession.selectList("planMapper.selectMindmapList", coupleCode);
	}

	public int deleteMindmapList(SqlSessionTemplate sqlSession, String coupleCode) {
		return sqlSession.delete("planMapper.deleteMindmapList", coupleCode);
	}

	public int insertMindmapList(SqlSessionTemplate sqlSession, ArrayList<Mindmap> mindmapList) {
		int result = 0;
		for (Mindmap mindmap : mindmapList) {
			result = sqlSession.insert("planMapper.insertMindmap", mindmap);
	    }
		return result;
	}

	public ArrayList<Schedule> findScheduleWithAlertTime(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("planMapper.findScheduleWithAlertTime");
	}

	public Phone selectPhone(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.selectOne("planMapper.selectPhone", s);
	}

	public ArrayList<Phone> selectPhoneList(SqlSessionTemplate sqlSession, String coupleCode) {
		return (ArrayList)sqlSession.selectList("planMapper.selectPhoneList", coupleCode);
	}

}
