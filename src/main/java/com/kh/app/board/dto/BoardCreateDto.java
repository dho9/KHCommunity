package com.kh.app.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.kh.app.board.entity.PostAttachment;

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
	private PostAttachment attachment;
	private LocalDateTime postCreatedAt;
}
