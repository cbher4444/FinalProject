package com.kh.usTwo.member.model.dao;

public class MemberDao {

<<<<<<< HEAD
=======
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
			return  sqlSession.selectOne("memberMapper.loginUser", m);
	}

	public Member selectPartnerEmail(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectPartnerEmail", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

>>>>>>> 795de97b18067b18f189b169196ebadfadfd95be
}
