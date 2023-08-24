package com.kh.app.member.entity;

import com.kh.app.member.entity.StudentAttachment.StudentAttachmentBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VacationAttachment {
	private int vacationAttachId;
	private int vacationId;
	private String vacationOriginalFilename;
	private String vacationRenamedFilename;

}
