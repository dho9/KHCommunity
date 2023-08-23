package com.kh.app.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentLike {
	private int commentId;
	private String memberId;
	private int commentLikeCount;
}
