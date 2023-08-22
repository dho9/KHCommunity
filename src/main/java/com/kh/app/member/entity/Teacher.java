package com.kh.app.member.entity;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Teacher {
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private LocalDate birthday;
	private String subject;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
	private LocalDate teacherEnrollDate;
}
