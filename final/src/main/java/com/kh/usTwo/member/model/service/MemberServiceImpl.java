package com.kh.usTwo.member.model.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.member.model.dao.MemberDao;
import com.kh.usTwo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginUser(sqlSession, m);
	}
	
	public Member selectPartnerEmail(Member m) {
		return mDao.selectPartnerEmail(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String email) {
		return mDao.deleteMember(sqlSession, email);
	}

	@Override
	public String findId(Member m) {
		return mDao.findId(sqlSession, m);
	}

	
	@Override
	public String checkUser(Member m) {
		return mDao.checkUser(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}

	@Override
	public String partnerUser(Member m) {
		return mDao.partnerUser(sqlSession, m);
	}
	
	@Override
	public int inviteCodeCheck(String inviteCode) {
		return mDao.inviteCodeCheck(sqlSession, inviteCode);
	}
	
	@Override
	public int updateInviteCode(Member m) {
		return mDao.updateInviteCode(sqlSession, m);
	}

	@Override
	public Member partnerInviteCodeCheck(String inviteCode) {
		return mDao.partnerInviteCodeCheck(sqlSession, inviteCode);
	}

	@Override
	public int coupleCodeCheck(String coupleCode) {
		return mDao.coupleCodeCheck(sqlSession, coupleCode);
	}

	@Override
	public int insertCouple(String coupleCode, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Member partner = (Member)session.getAttribute("partner");
		
		loginUser.setCoupleCode(coupleCode);
		partner.setCoupleCode(coupleCode);
		
		loginUser.setPartnerEmail(partner.getEmail());
		partner.setPartnerEmail(loginUser.getEmail());
		
		int result1 = mDao.insertCouple(sqlSession, coupleCode);
		int result2 = mDao.updateCoupleCodeOnMember(sqlSession, loginUser);
		int result3 = mDao.updateCoupleCodeOnMember(sqlSession, partner);
		
		return result1 * result2 * result3;
	}








	


	
	

	
	

}
