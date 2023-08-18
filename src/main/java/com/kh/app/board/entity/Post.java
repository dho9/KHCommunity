package com.kh.app.board.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {
	private int postId;
	private int boardId;
	private String memberId;
	private String title;
	private LocalDateTime postCreatedAt;
	private CommentCheck commentCheck;
	private int postLike;
	private AttachCheck attachCheck;
	private StatusCheck statusCheck;
	private String tag;
}
