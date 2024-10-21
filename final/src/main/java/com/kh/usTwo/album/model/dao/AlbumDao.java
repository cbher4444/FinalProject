package com.kh.usTwo.album.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.album.model.vo.Reply;
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
	
	public int deleteStory(SqlSessionTemplate sqlSession, String storyNo) {
		return sqlSession.update("albumMapper.deleteStory",storyNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("albumMapper.insertReply", r);
	}
	
	public int increaseReplyCount(SqlSessionTemplate sqlSession, String storyNo) {
		return sqlSession.update("albumMapper.increaseReplyCount", storyNo);
	}
	
	public int increaseReplyLike(SqlSessionTemplate sqlSession, String replyNo) {
		return sqlSession.update("albumMapper.increaseReplyLike", replyNo);
	}

}
