package com.kh.app.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentReportDto {
	private int reportId;
	private int commentId;
	private String reporterId;
	private String attackerId;
	private String reportContent;
	private String reportType;
}
