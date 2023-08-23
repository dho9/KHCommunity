package com.kh.app.curriculum.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CurriculumListDto {

	private String subject;
	private String curriculumName;
	private int curriculumId;
	private String classId;
	private String memberName;
	private String teacherId;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
	
}

