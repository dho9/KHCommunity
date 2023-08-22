package com.kh.app.messageBox.entity;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MessageBox {

	private String messageId;
	private String sendId;
	private String receiveId;
	private String messageContent;
	private LocalDate sendAt;
	private AnonymousCheck anonymousCheck;
	private ReadCheck readCheck;
	
}
