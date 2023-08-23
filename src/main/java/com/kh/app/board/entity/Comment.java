package com.kh.app.board.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Comment {
	private int commentId;
	private int postId;
	private int boardId;
	private String memberId;
	private String commentContent;
	private int commentLevel;
	private Date commentCreatedAt;
	private boolean anonymousCheck;
}
