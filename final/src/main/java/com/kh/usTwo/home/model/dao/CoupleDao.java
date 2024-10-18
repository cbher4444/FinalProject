package com.kh.usTwo.home.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.home.model.vo.Couple;
import com.kh.usTwo.member.model.vo.Member;

@Repository
public class CoupleDao {

	public Couple selectCouple(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("coupleMapper.selectCouple", m);
	}

}
