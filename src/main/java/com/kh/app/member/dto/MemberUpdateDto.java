package com.kh.app.member.dto;

import java.time.LocalDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.app.member.entity.Member;

import lombok.Data;

@Data
public class MemberUpdateDto {
	
	@NotBlank(message="비밀번호는 필수입니다.")
	@Pattern(regexp = "\\w{4,}", message="비밀번호는 영문자/숫자 4글자 이상이어야 합니다.")
	private String memberPwd;
	
	@NotBlank(message = "번호는 필수입니다.")
	private String memberPhone;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate birthday;
	
	
	public Member toMember() {
		return Member.builder()
				.memberPwd(memberPwd)
				.memberPhone(memberPhone)
				.birthday(birthday)
				.build();
	}
}
