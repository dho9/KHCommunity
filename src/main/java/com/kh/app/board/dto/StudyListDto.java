package com.kh.app.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyListDto {
	private int postId;
	private int boardId;
	private int studyId;
	private String memberId;
	private List<String> tag;
	private String title;
	private int studyPeople;
	private int memberCount;
	private LocalDateTime postCreatedAt;
	private LocalDateTime studyEndAt;
	private String content;
	
	
}
