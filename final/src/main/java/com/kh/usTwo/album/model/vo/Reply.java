package com.kh.usTwo.album.model.vo;

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
public class Reply {
	
	private String replyNo;
	private String refStoryNo;
	private String replyWriter;
	private String replyContent;
	private String replyLike;
	private String createDate;
	private String status;

}
