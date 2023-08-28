package com.kh.app.report.entity;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Report {

	public int reportId;
	public int postId;
	public int commentId;
	public int messageId;
	public String reporterId;
	public String attackerId;
	public String reportContent;
	public String reportType;
	public LocalDate reportSendDate;
	public ReportCheck reportCheck;
	public String reportAction;
	
}
