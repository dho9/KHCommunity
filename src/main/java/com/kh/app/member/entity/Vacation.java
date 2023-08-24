package com.kh.app.member.entity;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Vacation {
	private int vacationId;
	private String studentId;
	private String vacationStartDate;
	private String vacationEndDate;
	private String teacherId;
	private String employeeId;
	private String vacationSendDate;
	private String vacationApproveCheck;
	private List<VacationAttachment> attachments;
	
}
