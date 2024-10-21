package com.kh.usTwo.album.model.service;

import java.util.ArrayList;

import com.kh.usTwo.album.model.vo.Reply;
import com.kh.usTwo.album.model.vo.Story;

public interface AlbumService {
	
	// 스토리 리스트 불러오기
	ArrayList<Story> selectStory(String coupleCode);
	
	// 스토리 추가하기
	int insertStory(Story s);
	
	// 스토리 삭제하기
	int deleteStory(String storyNo);
	
	
	// 댓글 불러오기
	ArrayList<Reply> selectReplyList(String sno);
	
	// 댓글 달기
	int insertReply(Reply r);
	
	// 스토리 댓글 수 증가하기
	int increaseReplyCount(String storyNo);
	
	// 댓글 좋아요 달기
	int increaseReplyLike(String storyNo);
}
