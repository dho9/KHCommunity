package com.kh.app.member.entity;

import java.sql.Date;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Student {

	private String studentId;
	private int curriculumId;
	private LocalDate studentEnrollDated;
	private StudentApproveCheck approveCheck;
	private LocalDate approveRequestDate;
	private LocalDate approveCompleteDate;
	private StudentType studentType;
	
}
