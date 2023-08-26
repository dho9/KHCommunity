package com.kh.app.chat.dto;

import java.time.LocalDate;
import java.util.List;

import com.kh.app.chat.entity.ChatMessage;
import com.kh.app.member.entity.StudentType;

import lombok.Data;

@Data
public class AdminChatListDto {

	private int chatId; // 채팅방 ID
	private String studentId; // 상담요청자 ID
	private String studentName;
	private String chatType;
	private LocalDate chatDate;
	private String curriculumName;
	private String classId;
	private StudentType studentType;
	private List<ChatMessage> chatMessage;
	
}
