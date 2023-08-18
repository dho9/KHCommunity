package com.kh.app.vacation.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AdminVacationApproveDto {

	public String studentId;
	public String curriculumName;
	public String memberName;
	public String classId;
	public LocalDate vacationSendDate;
	public LocalDate vacationStartDate;
	public LocalDate vacationEndDate;
	
}
