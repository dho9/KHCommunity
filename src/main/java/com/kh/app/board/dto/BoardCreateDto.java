package com.kh.app.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.kh.app.board.entity.PostAttachment;

//github.com/MinHeeJ/KHCommunity

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardCreateDto {
	private int postId;
	private int boardId;
	private String memberId;
	private String title;
	private String content;
	private List<PostAttachment> attachments;
	private LocalDateTime postCreatedAt;
	private List<String> tags;
	private boolean anonymousCheck;
}
