package com.kh.app.member.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AdminEmployeeListDto {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private LocalDate birthday;
	private String employeeId;
	private String jobCode;
	private LocalDate employeeEnrollDate;
}
