package com.kh.app.member.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.member.dto.EmployeeInfoDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.dto.StudentVacationApproveDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.StudentVacation;
import com.kh.app.member.entity.StudentVacationAttachment;
import com.kh.app.ticket.dto.TicketBuyDto;


public interface MemberService extends UserDetailsService{
	
	int insertMember(MemberCreateDto member);

	Member findMemberById(String memberId);

	String joinEmail(String email);


	int updateMember(Member member);

	Student findStudentById(String memberId);

	int insertStudentAttach(StudentAttachment attach);

	int deleteMember(String memberId);

	StudentMypageInfoDto findByMemberInfo(String memberId);

	List<TicketBuyDto> findByTicketInfo(String memberId);

	Curriculum findByDdayInfo(int curriculumId);


	int insertVacation(StudentVacation vacation);

	List<EmployeeInfoDto> findByEmployeeInfo(String memberId);

	List<StudentVacationApproveDto> findAllVacationApproveList(String memberId);


	



}
