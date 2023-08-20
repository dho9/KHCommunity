package com.kh.app.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostLike {
	private int postId;
	private String memberId;
	private int postLikeCount;
}
