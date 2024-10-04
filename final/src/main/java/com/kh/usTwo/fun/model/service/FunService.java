package com.kh.usTwo.fun.model.service;

import java.util.ArrayList;

import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.member.model.vo.Member;

public interface FunService {
	ArrayList<Qtest> selectQuestion(Member m);
	ArrayList<OptionTest> selectOption(int testNo);
	ArrayList<Qservey> selectQservey();
	ArrayList<Aservey> selectAservey(Member m);
	int insertQlove(Qlove q);
	int insertAlove(Alove a);
	ArrayList<Qlove> selectQlove(Member m);
	Qlove selectQloveOne(Member m);
	ArrayList<Alove> selectAlove(Member m);
}
