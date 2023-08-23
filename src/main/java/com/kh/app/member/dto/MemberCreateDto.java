package com.kh.app.member.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberCreateDto {
	
	@NotBlank(message="아이디는 필수입니다.")
	private String memberId;
	
	@NotBlank(message="비밀번호는 필수입니다.")
	@Pattern(regexp = "\\w{4,}", message="비밀번호는 영문자/숫자 4글자 이상이어야 합니다.")
	private String memberPwd;
	
	@NotBlank(message="이름은 필수입니다.")
	private String memberName;
	
	@NotBlank(message = "번호는 필수입니다.")
	@NumberFormat(pattern ="010-1234-1234" )
	private String memberPhone;
	
	
	private String email;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate birthday;


}
