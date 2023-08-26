package com.kh.app.board.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Report_ {
	private int reportId;
	private int postId;
	private int commentId;
	private int messageId;
	private String reporterId;
	private String attackerId;
	private String reportContent;
	private String reportType;
	private LocalDateTime reportSendDate;
	private String reportCheck;
	private String reportAction;
	
}
