package com.kh.app.board.entity;

import lombok.Data;

@Data
public class PostContent {
	private int postId;
	private int boardId;
	private String content;
}
