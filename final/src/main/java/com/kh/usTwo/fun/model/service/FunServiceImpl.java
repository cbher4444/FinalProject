package com.kh.usTwo.fun.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.usTwo.fun.model.dao.FunDao;
import com.kh.usTwo.fun.model.vo.OptionTest;
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

}
