package com.kh.usTwo.chat.controller;

import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.kh.usTwo.chat.ChatHandler;

public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		 registry.addHandler(new ChatHandler(), "/chat")
         .addInterceptors(new HttpSessionHandshakeInterceptor()) // HTTP 세션 정보 전달
         .setAllowedOrigins("*");
	}

}
