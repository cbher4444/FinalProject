package com.kh.usTwo.adminPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.adminPage.model.dao.AdminPageDao;
import com.kh.usTwo.common.model.vo.PageInfo;
import com.kh.usTwo.member.model.vo.Member;

@Service
public class AdminPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminPageDao adDao;
	
	public ArrayList<Member> selectMemberList(PageInfo pi){
		
		return adDao.selectMemberList(sqlSession, pi);
	}
	
	public int selectListCount() {
		return adDao.selectListCount(sqlSession);
	}

}
