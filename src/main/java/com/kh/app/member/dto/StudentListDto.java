package com.kh.app.member.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StudentListDto {

	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private int curriculumId;
	private String subject;
	private String curriculumName;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;

}
