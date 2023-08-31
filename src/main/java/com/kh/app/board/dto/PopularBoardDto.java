package com.kh.app.board.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PopularBoardDto {
	private int postId;
	private String title;
	private String content;
	private int likeCount;
	private int commentCount;
	private String boardName;
	private LocalDateTime postCreatedAt;
}
