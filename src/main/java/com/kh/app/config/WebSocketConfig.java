package com.kh.app.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/chat").withSockJS(); // 웹소켓 미지원 브라우저를 위한 설정 : withSockJS
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 1. SimpleBroker로 처리하는 url 등록
		registry.enableSimpleBroker("/topic"); // 필요하면 ,로 추가
		
		// 2. MessageHandler로 처리하는 url 등록
		registry.setApplicationDestinationPrefixes("/app");
	}
	
}
