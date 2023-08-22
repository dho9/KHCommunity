package com.kh.app.board.dto;

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
	private int postLike;
	private int commentCount;
	private String boardName;
}
