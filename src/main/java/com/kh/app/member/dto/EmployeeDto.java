package com.kh.app.member.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDto {
	
	private String memberId;
	private String memberName;
	private String auth;
	private String jobCode;
	private Date employeeEnrollDate; 
	
}
