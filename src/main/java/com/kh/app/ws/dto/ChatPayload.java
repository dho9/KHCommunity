package com.kh.app.ws.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatPayload {
	private String from;
	private int chatId;
	private String to;
	private String content;
	private long createdAt;
}
