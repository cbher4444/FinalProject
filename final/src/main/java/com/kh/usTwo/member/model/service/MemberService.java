package com.kh.usTwo.member.model.service;

import com.kh.usTwo.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	Member selectPartnerEmail(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(String email); // 회원탈퇴 추가 - by 동규 (2024.10.13)
	String findId(Member m);
	
	String checkUser(Member m);
	
	int updatePwd(Member m);
	
	String partnerUser(Member m);
}
