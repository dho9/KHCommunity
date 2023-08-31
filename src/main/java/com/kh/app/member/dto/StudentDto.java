package com.kh.app.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentDto {
	private int boardId;
	private int curriculumId;
	private String studentType;
}
