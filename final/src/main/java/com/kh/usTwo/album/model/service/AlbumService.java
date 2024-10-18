package com.kh.usTwo.album.model.service;

import java.util.ArrayList;

import com.google.api.services.drive.model.Reply;
import com.kh.usTwo.album.model.vo.Story;

public interface AlbumService {
	
	// 스토리 리스트 불러오기
	ArrayList<Story> selectStory(String coupleCode);
	
	// 스토리 추가하기
	int insertStory(Story s);
	
	// 스토리 삭제하기
	int deleteStory();
	
	// 스토리 수정하기
	int updateStory(Story s);
	
	// 댓글 불러오기
	ArrayList<Reply> selectReplyList(int sno);
	
	// 댓글 달기
	
	// 댓글 삭제하기
	
	// 댓글 좋아요 달기

}
