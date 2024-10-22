package com.kh.usTwo.adminPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.common.model.vo.PageInfo;
import com.kh.usTwo.member.model.vo.Member;

@Repository
public class AdminPageDao {
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList",null, rowBounds);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

}


