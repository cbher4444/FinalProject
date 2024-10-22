package com.kh.usTwo.chat;

import java.io.IOException;
import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import org.slf4j.LoggerFactory;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class Chathandler extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	 private final Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();
	
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
		
		String payload = message.getPayload();
        System.out.println("받은 메시지: " + payload);

		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		
		 for(WebSocketSession s : sessions.values()) {
	          if(s.isOpen() && !s.getId().equals(session.getId())) { // 자신을 제외하고 전송
	               s.sendMessage(new TextMessage(payload));
	            }
	        }
		 
		 for (WebSocketSession sess : sessionList) {
		        if (sess.isOpen() && !sess.getId().equals(session.getId())) { // 자신을 제외하고 전송
		            sess.sendMessage(new TextMessage(payload));
		        }
		    }
	    }
		
		
	}
	
	

