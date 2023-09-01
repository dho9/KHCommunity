package com.kh.app.notification.entity;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Notification {
	
	private int alarmId;
	private String receivedId;
	private String content;
	private LocalDate createdAt;
	private AlarmType alarmType;
	private AlarmReadCheck readCheck;
	
}
