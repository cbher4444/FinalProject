package com.kh.usTwo.home.model.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.home.model.dao.CoupleDao;
import com.kh.usTwo.home.model.vo.Couple;
import com.kh.usTwo.member.model.vo.Member;

@Service
public class CoupleServiceImpl implements CoupleService {

	@Autowired
	private CoupleDao cDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Couple selectCouple(Member m) {
		return cDao.selectCouple(sqlSession, m);
	}

	@Override
	public int updateCouple(Couple c) {
		return cDao.updateCouple(sqlSession, c);
	}

	@Override
	public Map<String, Object> calculateDaysSinceStart(Couple c) {
		
		// Convert java.sql.Date to LocalDate
        LocalDate startDate = c.getStartDate().toLocalDate();
        LocalDate today = LocalDate.now();
        
        // Use Period to calculate years, months, and days
        Period period = Period.between(startDate, today);
        int years = period.getYears();
        int months = period.getMonths();
        int days = period.getDays();
        
        // Calculate total number of days
        long totalDays = ChronoUnit.DAYS.between(startDate, today);
        
        // Create a map to hold the data
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("years", years);
        resultMap.put("months", months);
        resultMap.put("days", days);
        resultMap.put("totalDays", totalDays);
        
        return resultMap;
	}

}
