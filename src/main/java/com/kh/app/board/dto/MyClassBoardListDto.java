package com.kh.app.board.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MyClassBoardListDto {
	private String boardId;
	private String curriculumId;
	private String curriculumId1;
	private String classId;
	private String teacherId;
	private String subject;
	private String curriculumName;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
}
