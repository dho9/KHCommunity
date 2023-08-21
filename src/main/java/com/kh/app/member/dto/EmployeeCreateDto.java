package com.kh.app.member.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EmployeeCreateDto {
	@NotBlank(message="아이디는 필수입니다.")
	private String id;
	private String dept;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate employeeEnrollDate;

}
