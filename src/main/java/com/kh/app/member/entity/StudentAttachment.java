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
public class StudentAttachment {
	
	private int studentAttachId;
	private String memberId;
	private String studentOriginalFilename;
	private String studentRenamedFilename;

}
