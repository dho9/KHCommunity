package com.kh.app.member.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;


public interface MemberService extends UserDetailsService{
	int insertMember(MemberCreateDto member);

	Member findMemberById(String memberId);

	String joinEmail(String email);


	int updateMember(Member member);

	Student findStudentById(String memberId);

	int insertStudentAttach(StudentAttachment attach);



}
