package com.kh.app.member.dto;

import java.time.LocalDate;

import com.kh.app.member.entity.StudentType;

import lombok.Data;

@Data
public class AdminStudentListDto {

	private String studentId;
	private String memberName;
	private String memberPhone;
	private LocalDate birthday;
	private String memberEmail;
	public String curriculumName;
	public String classId;
	public StudentType studentType;
	public LocalDate curriculumEndAt;
	
}
