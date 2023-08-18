package com.kh.app.board.dto;

import java.time.LocalDateTime;

import com.kh.app.board.entity.Post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardSearchDto extends Post {
	private String boardName;
	private String content;
	private int commentCount;
	
	@Override
	public String getMemberId() {
		return super.getMemberId();
	}
	
	@Override
	public LocalDateTime getPostCreatedAt() {
		return super.getPostCreatedAt();
	}
	
	@Override
	public int getPostLike() {
		return super.getPostLike();
	}
}
