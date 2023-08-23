package com.kh.app.member.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class TeacherListDto {
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private LocalDate birthday;
	private LocalDate teacherEnrollDate;
	private String subject;
}
