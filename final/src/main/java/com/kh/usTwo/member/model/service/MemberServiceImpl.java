package com.kh.usTwo.member.model.service;

<<<<<<< HEAD
public class MemberServiceImpl {
=======
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
		// TODO Auto-generated method stub
		return 0;
	}

	
	

	
	
>>>>>>> 795de97b18067b18f189b169196ebadfadfd95be

}
