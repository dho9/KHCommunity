package com.kh.app.board.dto;


import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BoardListDto{
	private int postId;
	private String title;
	private String content;
	private LocalDateTime postCreatedAt;
	private int postLike;
	private int commentCount;
}
