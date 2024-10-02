package com.kh.usTwo.fun.model.service;

import java.util.ArrayList;

import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.member.model.vo.Member;

public interface FunService {
	ArrayList<Qtest> selectQuestion(Member m);
}
