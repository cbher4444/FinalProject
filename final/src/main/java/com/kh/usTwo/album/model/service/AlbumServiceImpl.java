package com.kh.usTwo.album.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.album.model.dao.AlbumDao;
import com.kh.usTwo.album.model.vo.Story;

@Service
public class AlbumServiceImpl implements AlbumService{
	
	@Autowired
	private AlbumDao aDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Story> selectStory() {
		
		return aDao.selectStory(sqlSession);
	}

}
