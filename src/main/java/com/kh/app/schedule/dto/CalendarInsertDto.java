package com.kh.app.schedule.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CalendarInsertDto {
	private String title;
	private String writer;
	private String start;
	private String end;
	private String backgroundColor;
	private String memberId;
	private int groupid;
}
