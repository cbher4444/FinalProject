package com.kh.usTwo.album.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.google.api.services.drive.model.Reply;
import com.kh.usTwo.album.model.vo.Story;
import com.kh.usTwo.member.model.vo.Member;

@Repository
public class AlbumDao {
	
	public ArrayList<Story> selectStory(SqlSessionTemplate sqlSession, String coupleCode){
		return (ArrayList)sqlSession.selectList("albumMapper.selectStroy", coupleCode);
	}
	
	public int insertStory(SqlSessionTemplate sqlSession, Story s) {
		return sqlSession.insert("albumMapper.insertStory", s);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, String storyNo){
		return (ArrayList)sqlSession.selectList("albumMapper.selectReplyList", storyNo);
	}

}
