package com.kh.usTwo.member.model.service;

import javax.servlet.http.HttpSession;

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
	
	int inviteCodeCheck(String inviteCode); // 초대코드 중복체크 - 추가함 by 동규 (2024.10.14)
	
	int updateInviteCode(Member m); // 내 초대코드 업데이트 - 추가함 by 동규 (2024.10.14)
	
	Member partnerInviteCodeCheck(String inviteCode); // 상대방 초대코드 체크 - 추가함 by 동규 (2024.10.14)
	
	int coupleCodeCheck(String coupleCode); // 커플코드 중복체크 - 추가함 by 동규 (2024.10.14)
	
	int insertCouple(String coupleCode, HttpSession session); // 커플코드 추가 - 추가함 by 동규 (2024.10.14)
}
