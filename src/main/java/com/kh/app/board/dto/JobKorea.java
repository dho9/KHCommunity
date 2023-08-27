package com.kh.app.board.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
@ToString
public class JobKorea {
	private String company;
	private String title;
	private String option;
	private String etc;
	private String url;
}
