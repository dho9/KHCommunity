package com.kh.app.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PostReportDto {
	private int reportId;
	private int postId;
	private String reporterId;
	private String attackerId;
	private String reportContent;
	private String reportType;
}
