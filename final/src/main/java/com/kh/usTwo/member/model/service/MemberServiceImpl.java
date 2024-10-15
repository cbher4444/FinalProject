package com.kh.usTwo.member.model.service;

import org.apache.ibatis.session.SqlSessionManager;
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

	public int idCheck(String email) {
		return mDao.idCheck(sqlSession, email);
	}

	@Override
	public Object kakaoLogin(String snsId) {
		// TODO Auto-generated method stub
		return null;
	}




	


	
	

	
	

}
