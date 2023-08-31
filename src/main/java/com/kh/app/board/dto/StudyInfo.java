package com.kh.app.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyInfo {
	private int studyId;
	private String memberId;
	private String introduce;
	private LocalDateTime studyApplicationAt;
	private boolean applcationCheck;
	
	
}
