package com.kh.usTwo.home.model.service;

import java.util.Map;

import com.kh.usTwo.home.model.vo.Couple;
import com.kh.usTwo.member.model.vo.Member;

public interface CoupleService {

	Couple selectCouple(Member m);
	
	int updateCouple(Couple c);
	
	Map<String, Object> calculateDaysSinceStart(Couple c);
}
