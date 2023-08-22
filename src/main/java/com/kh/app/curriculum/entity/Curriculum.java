package com.kh.app.curriculum.entity;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Curriculum {

	private String curriculumId;
	private String classId;
	private String teacherId;
	private String subject;
	private String curriculumName;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
	
}
