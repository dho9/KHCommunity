package com.kh.app.board.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardId;
	private String boardName;
	private String boardCategory;
	private String boardLink;
}
