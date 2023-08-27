package com.kh.app.notification.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.chat.entity.Talker;
import com.kh.app.ws.dto.ChatPayload;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;
	
	@Override
	public int notifyChatCreate(Talker talker) {
		
		ChatPayload payload = ChatPayload.builder()
				.chatId(talker.getChatId())
				.content(talker.getStudentId() + "님이 상담을 요청하셨습니다. / 채팅방 : " + talker.getChatId() + "번")
				.createdAt(System.currentTimeMillis())
				.build();
		
		simpMessagingTemplate.convertAndSend("/topic/admin", payload);
		
		// 3. db 알림행 등록
		return 0;
		
	}
	
}
