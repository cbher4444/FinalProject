package com.kh.usTwo.member.model.dao;

import javax.servlet.http.HttpSession;
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

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.deleteMember", m);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public String checkUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkUser", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	public String partnerUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.partnerUser", m);
	}

	public int inviteCodeCheck(SqlSessionTemplate sqlSession, String inviteCode) {
		return sqlSession.selectOne("memberMapper.inviteCodeCheck", inviteCode);
	}
	
	public int updateInviteCode(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateInviteCode", m);
	}

	public Member partnerInviteCodeCheck(SqlSessionTemplate sqlSession, String inviteCode) {
		return sqlSession.selectOne("memberMapper.partnerInviteCodeCheck", inviteCode);
	}

	public int coupleCodeCheck(SqlSessionTemplate sqlSession, String coupleCode) {
		return sqlSession.selectOne("memberMapper.coupleCodeCheck", coupleCode);
	}

	public int insertCouple(SqlSessionTemplate sqlSession, String coupleCode) {
		return sqlSession.insert("memberMapper.insertCouple", coupleCode);
	}

	public int updateCoupleCodeOnMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateCoupleCodeOnMember", m);
	}

	public int deleteCoupleCode(SqlSessionTemplate sqlSession, String coupleCode) {
		return sqlSession.update("memberMapper.deleteCoupleCode", coupleCode);
	}

	public int revertCoupleCode(SqlSessionTemplate sqlSession, String coupleCode) {
		return sqlSession.update("memberMapper.revertCoupleCode", coupleCode);
	}

	public int revertMember(SqlSessionTemplate sqlSession, Member m) {
		if (m.getPartnerEmail() != null) { // 상대방이 있으면 -> status = 'Y'로
			return sqlSession.update("memberMapper.revertMemberToY", m);
		}else { // 상대방이 없으면 -> status = 'W'로
			return sqlSession.update("memberMapper.revertMemberToW", m);
		}
	}



	
}

