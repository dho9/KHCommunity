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
public class Employee {
	private String employeeId;
	private String jobCode;
	private LocalDate employeeEnrollDate;
}
