package com.kh.app.board.entity;

import lombok.Data;
import lombok.ToString;

@Data
public class BoardSearchDetails extends Post {
	private String boardName;
	private String content;
}
