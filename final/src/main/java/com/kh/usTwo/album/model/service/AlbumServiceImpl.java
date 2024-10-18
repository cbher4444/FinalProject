package com.kh.usTwo.album.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.services.drive.model.Reply;
import com.kh.usTwo.album.model.dao.AlbumDao;
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
	public int deleteStory() {
		return 0;
	}


	@Override
	public int updateStory(Story s) {
		return 0;
	}


	@Override
	public ArrayList<Reply> selectReplyList(int sno) {
		return null;
	}

}
