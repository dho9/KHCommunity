package com.kh.app.chat.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 성근 - 학생이 상담 신청 누르면 채팅방, 토커 생성되고 관리자에게 알림 보내기
	@PostMapping("/chatConsultingRequest.do")
	@ResponseBody
	public int chatConsultingRequest(@RequestParam(value = "memberId", required=false) String memberId) {
		
		int chatId = chatService.insertNewChatRoom(memberId);
		
		Talker talker = new Talker();
		talker.setChatId(chatId);
		talker.setStudentId(memberId);
		
		int result = notificationService.notifyChatCreate(talker);
		
		return chatId;
	}
	
	// 화면 띄우기
	@GetMapping("/chatConsultingRequest.do")
	public void chatConsultingRequest() {}
	
	// 관리자가 수락 누르면 토커에 관리자 업데이트
	@PostMapping("/updateAdminTalker.do")
	public String updateAdminTalker(@RequestParam(value = "chatId", required=false) int chatId) {
		
		int result = chatService.updateAdminTalker(chatId);
		
		return "redirect:/chat/chatConsultingRequest.do";
	}
	
	// 학생이 채팅 입력하면 db에 저장
	@PostMapping("/insertStudentChatMsg.do")
	public String insertStudentChatMsg(
							@RequestParam(value = "chatId", required=false) int chatId,
							@RequestParam(value = "studentId", required=false) String studentId,
							@RequestParam(value = "message", required=false) String message
							) {
		
		
		// 채팅 메세지 db에 저장
		int result = chatService.insertStudentChatMsg(chatId, studentId, message);
		
		return "redirect:/chat/chatConsultingRequest.do";
	}
	
	// 관리자가 채팅 입력하면 db에 저장
	@PostMapping("/insertAdminChatMsg.do")
	public String insertAdminChatMsg(
							@RequestParam(value = "chatId", required=false) int chatId,
							@RequestParam(value = "message", required=false) String message
							) {


		//채팅 메세지 db에 저장
		int result = chatService.insertAdminChatMsg(chatId, message);

		return "redirect:/chat/chatConsultingRequest.do";
	}
	
	// 관리자가 채팅 마치기 누르면 chat_type 업데이트
	@PostMapping("/updateChatTypeInChatRoom.do")
	public String updateChatTypeInChatRoom(
						@RequestParam(value = "chatId", required=false) int chatId,
						@RequestParam(value = "inputText", required=false) String chatType) {
		
		int result = chatService.updateChatTypeInChatRoom(chatId, chatType);
		
		return "redirect:/admin/adminMain.do";
	}
	
}
