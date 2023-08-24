package com.kh.app.vacation.entity;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Vacation {

	private int vacationId;
	private String studentId;
	private String teacherId;
	private String employeeId;
	private LocalDate vacationSendDate;
	private VacationApproveCheck vacationApproveCheck;
	private LocalDate vacationStartDate;
	private LocalDate vacationEndDate;
	
}
