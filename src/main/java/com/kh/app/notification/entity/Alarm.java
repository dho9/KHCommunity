package com.kh.app.notification.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Alarm {

	private int alarmId;
	private String receivedId; // 알림 수신자
	private String content;
	private LocalDateTime createdAt;
	private AlarmType alarmType;
	private AlarmReadCheck readCheck;
	
}
