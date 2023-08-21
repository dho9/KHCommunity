package com.kh.app.board.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardCreateDto {
	private int postId;
	private int boardId;
	private String memberId;
	private String title;
	private String content;
	private LocalDateTime postCreatedAt;
}
