package com.kh.usTwo.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
			return  sqlSession.selectOne("memberMapper.loginUser", m);
	}

	public Member selectPartnerEmail(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectPartnerEmail", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMember");
	}

}
