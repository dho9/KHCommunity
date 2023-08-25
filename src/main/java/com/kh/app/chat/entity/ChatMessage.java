package com.kh.app.chat.entity;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ChatMessage {

	private int chatNo;
	private int chatId;
	private String memberId;
	private String employeeId;
	private String chatContent;
	private LocalDateTime chatSendAt;
	
}
