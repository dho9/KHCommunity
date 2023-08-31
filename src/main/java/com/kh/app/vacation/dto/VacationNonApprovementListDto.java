package com.kh.app.vacation.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class VacationNonApprovementListDto {

	private int vacationId;
	private LocalDate vacationSendDate;
	private LocalDate vacationStartDate;
	private LocalDate vacationEndDate;
	private String memberName;
	private LocalDate birthday;
	private LocalDate curriculumStartAt;
	private LocalDate curriculumEndAt;
	private String curriculumName;
	private String classId;
	private String teacherId;
	private String teacherName;
	private String studentId;
	
}
