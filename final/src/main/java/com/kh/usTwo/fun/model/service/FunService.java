package com.kh.usTwo.fun.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.Atest;
import com.kh.usTwo.fun.model.vo.Atoday;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.fun.model.vo.Qtoday;
import com.kh.usTwo.fun.model.vo.Test;
import com.kh.usTwo.member.model.vo.Member;

public interface FunService {
	ArrayList<Qtest> selectQtest(Member m);
	ArrayList<OptionTest> selectOptionTest(int testNo);
	ArrayList<Qservey> selectQservey();
	ArrayList<Aservey> selectAservey(Member m);
	int insertQlove(Qlove q);
	int insertAlove(Alove a);
	ArrayList<Qlove> selectQlove(Member m);
	Qlove selectQloveOne(Member m);
	ArrayList<Alove> selectAlove(Member m);
	ArrayList<Test> selectTest(Member m);
	Test selectTestOne(Member m);
	int insertTest(Test t);
	int insertQtest(Qtest q);
	int insertOptionTest(OptionTest o);
	int insertAtest(Atest a);
	Qtest selectQtestOne(Member m);
	ArrayList<Atest> selectAtest(Test t);
	int updateAtest(Atest a);
	int updateTest(Test t);
	int countAtest(Member m);
	int countAservey(Member m);
	int countTest(Member m);
	int insertAservey(Aservey a);
	ArrayList<Qtoday> selectQtoday();
	ArrayList<Atoday> selectAtoday(HashMap<String, String> hm);
	int countAtoday(Member m);
	ArrayList<Atoday> checkAtodayDupl(HashMap<String, String> hm);
	int insertAtoday(HashMap<String, String> hm);
	int updateAtoday(Atoday a);
}
