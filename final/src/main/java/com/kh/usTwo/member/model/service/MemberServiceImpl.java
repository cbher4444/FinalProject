package com.kh.usTwo.member.model.service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

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
	public int deleteMember(Member loginUser) { // 회원탈퇴 - by 동규
		// 1. 내 계정 회원탈퇴
		int result1 = mDao.deleteMember(sqlSession, loginUser);

		// 2. 상대방이 있다면,
		int result2 = 1;
		if (loginUser.getPartnerEmail() != null) {
			// 2_1. 상대방 회원탈퇴
			Member partner = mDao.selectPartnerEmail(sqlSession, loginUser);
			result2 = mDao.deleteMember(sqlSession, partner);
			
			// 2_2.  커플코드 비활성화
			result2 *= mDao.deleteCoupleCode(sqlSession, loginUser.getCoupleCode());
		}
		
		return result1 * result2;
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
	public int updatePwdMember(Member m) {
		return mDao.updatePwdMember(sqlSession, m);
	}
	

	@Override
	public int updatePwdMember(Member m) {
		return mDao.updatePwdMember(sqlSession, m);
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

	@Override
	public int revertCoupleCode(String coupleCode) {
		return mDao.revertCoupleCode(sqlSession, coupleCode);
	}

	@Override
	public int revertMember(Member m) {
		return mDao.revertMember(sqlSession, m);
	}





	public int idCheck(String email) {
		return mDao.idCheck(sqlSession, email);
	}

	@Override
	public Object kakaoLogin(String snsId) {
		// TODO Auto-generated method stub
		return null;
	}
@Override
	public ArrayList<Member> selectMember() {
		return mDao.selectMember(sqlSession);
	}

	@Override
	public int updateProfile(Member m) {
		return mDao.updateProfile(sqlSession, m);
	}






	


	
	

	
	

}
