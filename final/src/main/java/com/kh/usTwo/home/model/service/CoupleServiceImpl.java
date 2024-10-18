package com.kh.usTwo.home.model.service;

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

}
