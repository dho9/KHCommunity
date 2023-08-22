package com.kh.app.curriculum.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CurriculumListDto {

	private String subject;
	private String curriculumName;
	private String classId;
	private String memberName;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
	
}
