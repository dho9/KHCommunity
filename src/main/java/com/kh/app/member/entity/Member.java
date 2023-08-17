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
public class Member {
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberPhone;
	private LocalDate birthday;
	private String email;
}
