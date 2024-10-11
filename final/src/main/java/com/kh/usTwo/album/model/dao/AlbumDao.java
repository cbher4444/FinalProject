package com.kh.usTwo.album.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.album.model.vo.Story;

@Repository
public class AlbumDao {
	
	public ArrayList<Story> selectStory(SqlSession sqlSession){
		return null;
	}

}
