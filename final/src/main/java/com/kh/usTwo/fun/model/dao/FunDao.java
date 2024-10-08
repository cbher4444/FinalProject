package com.kh.usTwo.fun.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.member.model.vo.Member;

@Repository
public class FunDao {

	public ArrayList<Qtest> selectQuestion(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectQuestion", m);
	}

	public ArrayList<OptionTest> selectOption(int testNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectOption", testNo);
	}
	
	public ArrayList<Qservey> selectQservey(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectQservey");
	}

	public ArrayList<Aservey> selectAservey(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectAservey", m);
	}
	
	public int insertQlove(Qlove q, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("funMapper.insertQlove", q);
	}

	public int insertAlove(Alove a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("funMapper.insertAlove", a);
	}

	public ArrayList<Qlove> selectQlove(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectQlove", m);
	}

	public Qlove selectQloveOne(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("funMapper.selectQloveOne", m);
	}

	public ArrayList<Alove> selectAlove(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectAlove", m);
	}

}
