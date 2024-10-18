package com.kh.usTwo.home.model.service;

import com.kh.usTwo.home.model.vo.Couple;
import com.kh.usTwo.member.model.vo.Member;

public interface CoupleService {

	Couple selectCouple(Member m);
}
