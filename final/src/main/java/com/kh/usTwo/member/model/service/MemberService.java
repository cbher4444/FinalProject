package com.kh.usTwo.member.model.service;

import java.util.ArrayList;

import com.kh.usTwo.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	Member selectPartnerEmail(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	ArrayList<Member> selectMember();
}
