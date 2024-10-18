package com.kh.usTwo.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Chat {
	/*
	CHATTING_NUM
	MY_CHAT
	EMAIL
	CHAT_STATUS
	CHAT_ROOM_NO
	COUPLE_CODE
	*/
	
	private int chattingNum;
	private String myChat;
	private String email;
	private String chatStatus;
	private String chatRoomNo;
	private String coupleCode;
	
	

}
