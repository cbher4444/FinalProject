package com.kh.usTwo.fun.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.usTwo.fun.model.dao.FunDao;
import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.member.model.vo.Member;

@Service
public class FunServiceImpl implements FunService {
	@Autowired
	private FunDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Qtest> selectQuestion(Member m) {
		return fDao.selectQuestion(m, sqlSession);
	}

	@Override
	public ArrayList<OptionTest> selectOption(int testNo) {
		return fDao.selectOption(testNo, sqlSession);
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

}
