package com.kh.app.messageBox.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MessageReportDto {
	private int reportId;
	private int messageId;
	private String reporterId;
	private String attackerId;
	private String reportContent;
	private String reportType;
}
