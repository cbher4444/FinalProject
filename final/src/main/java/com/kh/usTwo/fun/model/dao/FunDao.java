package com.kh.usTwo.fun.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.Atest;
import com.kh.usTwo.fun.model.vo.OptionTest;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.fun.model.vo.Qtest;
import com.kh.usTwo.fun.model.vo.Test;
import com.kh.usTwo.member.model.vo.Member;

@Repository
public class FunDao {

	public ArrayList<Qtest> selectQtest(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectQtest", m);
	}

	public ArrayList<OptionTest> selectOptionTest(int testNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectOptionTest", testNo);
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
	
	public ArrayList<Test> selectTest(Member m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("funMapper.selectTest", m);
	}

	public Test selectTestOne(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("funMapper.selectTestOne", m);
	}

	public int insertTest(Test t, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("funMapper.insertTest", t);
	}

	public int insertQtest(Qtest q, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("funMapper.insertQtest", q);
	}

	public int insertOptionTest(OptionTest o, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("funMapper.insertOptionTest", o);
	}

	public int insertAtest(Atest a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("funMapper.insertAtest", a);
	}

	public Qtest selectQtestOne(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("funMapper.selectQtestOne", m);
	}
	
	
}
