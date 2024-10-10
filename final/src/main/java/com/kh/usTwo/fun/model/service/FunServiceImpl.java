package com.kh.usTwo.fun.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.usTwo.fun.model.dao.FunDao;
import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.Atest;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.fun.model.vo.Test;
import com.kh.usTwo.member.model.vo.Member;

@Service
public class FunServiceImpl implements FunService {
	@Autowired
	private FunDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Qtest> selectQtest(Member m) {
		return fDao.selectQtest(m, sqlSession);
	}

	@Override
	public ArrayList<OptionTest> selectOptionTest(int testNo) {
		return fDao.selectOptionTest(testNo, sqlSession);
	}

	@Override
	public ArrayList<Qservey> selectQservey() {
		return fDao.selectQservey(sqlSession);
	}

	@Override
	public ArrayList<Aservey> selectAservey(Member m) {
		return fDao.selectAservey(m, sqlSession);
	}
	
	@Override
	public int insertQlove(Qlove q) {
		return fDao.insertQlove(q, sqlSession);
	}

	@Override
	public int insertAlove(Alove a) {
		return fDao.insertAlove(a, sqlSession);
	}

	@Override
	public ArrayList<Qlove> selectQlove(Member m) {
		return fDao.selectQlove(m, sqlSession);
	}

	@Override
	public Qlove selectQloveOne(Member m) {
		return fDao.selectQloveOne(m, sqlSession);
	}

	@Override
	public ArrayList<Alove> selectAlove(Member m) {
		return fDao.selectAlove(m, sqlSession);
	}
	
	@Override
	public ArrayList<Test> selectTest(Member m) {
		return fDao.selectTest(m, sqlSession);
	}

	@Override
	public Test selectTestOne(Member m) {
		return fDao.selectTestOne(m, sqlSession);
	}

	@Override
	public int insertTest(Test t) {
		return fDao.insertTest(t, sqlSession);
	}

	@Override
	public int insertQtest(Qtest q) {
		return fDao.insertQtest(q, sqlSession);
	}

	@Override
	public int insertOptionTest(OptionTest o) {
		return fDao.insertOptionTest(o, sqlSession);
	}

	@Override
	public int insertAtest(Atest a) {
		return fDao.insertAtest(a, sqlSession);
	}

	@Override
	public Qtest selectQtestOne(Member m) {
		return fDao.selectQtestOne(m, sqlSession);
	}

	@Override
	public ArrayList<Atest> selectAtest(Test t) {
		return fDao.selectAtest(t, sqlSession);
	}

	@Override
	public int updateAtest(Atest a) {
		return fDao.updateAtest(a, sqlSession);
	}

	@Override
	public int updateTest(Test t) {
		return fDao.updateTest(t, sqlSession);
	}

	@Override
	public int countAtest(Member m) {
		return fDao.countAtest(m, sqlSession);
	}

	@Override
	public int countAservey(Member m) {
		return fDao.countAservey(m, sqlSession);
	}

	@Override
	public int countTest(Member m) {
		return fDao.countTest(m, sqlSession);
	}

}
