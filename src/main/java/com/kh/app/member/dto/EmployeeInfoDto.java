package com.kh.app.member.dto;

import java.time.LocalDate;

import com.kh.app.member.entity.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder

public class EmployeeInfoDto {
	private String memberId;
	private String memberName;
	private String classId;
	private String subject;
	private String curriculumName;
	private String auth;
	private String jobCode;
	private String employeeId;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
	
}
