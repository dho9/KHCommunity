package com.kh.app.board.dto;


import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardListDto {
	private int postId; 
	private String memberId; 
	private String title;
	private String content;
	private LocalDateTime postCreatedAt;
	private int postLike;
	private int commentCount;
	private int boardId;
	private List<String> tag;
	private String anonymousCheck; 
	private String memberName; 
}

