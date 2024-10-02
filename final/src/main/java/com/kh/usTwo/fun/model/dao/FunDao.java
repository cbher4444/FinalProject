package com.kh.usTwo.fun.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.member.model.vo.Member;

@Repository
public class FunDao {

	public ArrayList<Qtest> selectQuestion(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectQuestion", m);
	}

}
