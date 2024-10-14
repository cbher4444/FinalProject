package com.kh.usTwo.chat;

import java.io.IOException;
import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import org.slf4j.LoggerFactory;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ChatHandler extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		log.info("{} 연결됨", session.getId());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		log.info("{} 연결 끊김" , session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		
	}
	
	
}
