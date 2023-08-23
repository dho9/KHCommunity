package com.kh.app.curriculum.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AdminCurriculumDetailDto {

	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private LocalDate birthday;
}
