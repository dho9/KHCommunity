package com.kh.app.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyList {
	private int postId;
	private int boardId;
	private String memberId;
	private List<String> tag;
	private String studyName;
	private int studyPeople;
	private int memberCount;
	private LocalDateTime studyCreatedAt;
	private LocalDateTime studyEndAt;
	
}
