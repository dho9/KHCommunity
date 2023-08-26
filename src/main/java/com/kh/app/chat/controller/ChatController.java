package com.kh.app.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.chat.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@PostMapping("/chatConsultingRequest.do")
	@ResponseBody
	public int chatConsultingRequest(@RequestParam(value = "memberId", required=false) String memberId) {
		
		System.out.println(memberId);
		
		int chatId = chatService.insertNewChatRoom(memberId);
		
		System.out.println(chatId);
		
		return chatId;
	}
	
}
