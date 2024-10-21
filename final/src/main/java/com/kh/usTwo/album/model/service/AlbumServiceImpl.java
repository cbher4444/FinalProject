package com.kh.usTwo.album.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.album.model.dao.AlbumDao;
import com.kh.usTwo.album.model.vo.Reply;
import com.kh.usTwo.album.model.vo.Story;
import com.kh.usTwo.member.model.vo.Member;

@Service
public class AlbumServiceImpl implements AlbumService{
	
	@Autowired
	private AlbumDao aDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Story> selectStory(String coupleCode) {
		return aDao.selectStory(sqlSession, coupleCode);
	}


	@Override
	public int insertStory(Story s) {
		return aDao.insertStory(sqlSession, s);
	}


	@Override
	public int deleteStory(String storyNo) {
		return aDao.deleteStory(sqlSession, storyNo);
	}



	@Override
	public ArrayList<Reply> selectReplyList(String storyNo) {
		return aDao.selectReplyList(sqlSession, storyNo);
	}


	@Override
	public int insertReply(Reply r) {
		return aDao.insertReply(sqlSession, r);
	}


	@Override
	public int increaseReplyCount(String storyNo) {
		return aDao.increaseReplyCount(sqlSession, storyNo);
	}


	@Override
	public int increaseReplyLike(String replyNo) {
		return aDao.increaseReplyLike(sqlSession, replyNo);
	}

}
