package com.kh.app.member.dto;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TeacherCreateDto {
	private String teacherId;
	private LocalDate teacherEnrollDate;
}
