package com.kh.app.chat.entity;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ChatRoom {

	private int chatId;
	private LocalDate chatDate;
	private String chatType;
}
