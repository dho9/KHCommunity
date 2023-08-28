package com.kh.app.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.chat.entity.ChatRoom;
import com.kh.app.chat.entity.Talker;
import com.kh.app.chat.service.ChatService;
import com.kh.app.notification.service.NotificationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@Autowired
	private NotificationService notificationService;
	
	@PostMapping("/chatConsultingRequest.do")
	@ResponseBody
	public int chatConsultingRequest(@RequestParam(value = "memberId", required=false) String memberId) {
		
//		System.out.println(memberId);
		
		int chatId = chatService.insertNewChatRoom(memberId);
		
		Talker talker = new Talker();
		talker.setChatId(chatId);
		talker.setStudentId(memberId);
		
		int result = notificationService.notifyChatCreate(talker);
		
		return chatId;
	}
	
	@GetMapping("/chatConsultingRequest.do")
	public void chatConsultingRequest() {}
	
}
