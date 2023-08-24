package com.kh.app.member.dto;

import java.time.LocalDate;

import com.kh.app.member.entity.StudentApproveCheck;
import com.kh.app.member.entity.StudentType;

import lombok.Data;

@Data
public class AdminStudentApproveDto {

	private String studentId;
	private String memberName;
	private StudentApproveCheck approveCheck;
	private LocalDate approveRequestDate;
	private StudentType studentType;
	private String curriculumName;
	private String studentRenamedFilename;
	
}
