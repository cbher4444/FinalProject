package com.kh.usTwo.chat.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;


import com.kh.usTwo.chat.Chathandler;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket // 웹 소켓에 대해 자동 설정
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		 registry.addHandler(new Chathandler(), "/chat")
         .addInterceptors(new HttpSessionHandshakeInterceptor()) // HTTP 세션 정보 전달
         .setAllowedOrigins("*");
	}
	
    // 웹 소켓에서 rtc 통신을 위한 최대 텍스트 버퍼와 바이너리 버퍼 사이즈를 설정한다?
    @Bean
    public ServletServerContainerFactoryBean createWebSocketContainer() {
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
        container.setMaxTextMessageBufferSize(8192);
        container.setMaxBinaryMessageBufferSize(8192);
        return container;
    }
	
}
