package com.kh.app.ws.dto;

import com.kh.app.messageBox.entity.AnonymousCheck;
import com.kh.app.notification.entity.AlarmType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MsgPayload {

	private String sendId;
	private String receivedId;
	private AnonymousCheck anonymousCheck;
	private String content;
	private long createdAt;
	private int messageId;
	private AlarmType alarmType;
	
	
}
