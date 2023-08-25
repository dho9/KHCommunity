package com.kh.app.member.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class StudentMypageInfoDto {
	private String studentId;
	private String curriculumName;
	private String memberName;
	private String classId;
	private int curriculumId;
	private LocalDate curriculumEndAt;
	private String teacherId;
}
