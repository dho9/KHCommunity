package com.kh.app.member.dto;

import java.time.LocalDate;

import com.kh.app.member.entity.StudentVacationAttachment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StudentVacationApproveDto {
	private int vacationId;
	private String studentId;
	public LocalDate vacationStartDate;
	public LocalDate vacationEndDate;
	public LocalDate vacationSendDate;
	private String teacherId;
	private String vacationRenamedFilename;
	private int vacationApproveCheck;
	private String memberName;

}
