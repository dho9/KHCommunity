package com.kh.app.board.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PostAttachment {
	private int postAttachId;
	private int postId;
	private int boardId;
	private String postOriginalFilename;
	private String postRenamedFilename;
	
}
