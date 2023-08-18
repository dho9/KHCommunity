package com.kh.app.member.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AdminStudentApproveDto {

	public String studentId;
	public LocalDate approveRequestDate;
	public String curriculumName;
	
}
