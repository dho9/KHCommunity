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
	private String employeeId;
	private String memberName;
	private String subject;
	private String curriculumName;
	private String auth;
	private String jobCode;
	private Integer classId;
}
