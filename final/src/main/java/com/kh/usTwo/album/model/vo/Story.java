package com.kh.usTwo.album.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Story {
	
	private int storyNo;
	private String coupleCode;
	private String writerEmail;
	private String storyTitle;
	private Date createDate;
	private int replyCount;
	private String originName;
	private String changeName;
	private String status;
	
	// 프로필 경로
	private String profileChangeName;

}
