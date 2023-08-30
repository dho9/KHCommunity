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
public class Study {
	private int studyId;
	private int boardId;
	private String studyName;
	private String memberId;
	private int studyPeople;
	private int memberCount;
	private LocalDateTime studyCreatedAt;
	private LocalDateTime studyEndAt;
	
}
