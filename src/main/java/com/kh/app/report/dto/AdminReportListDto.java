package com.kh.app.report.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AdminReportListDto {

	public int reportId;
	public int postId;
	public int commentId;
	public int messageId;
	public String reporterId;
	public String reportContent;
	public String attakerId;
	public LocalDate reportSendDate;
	
}
