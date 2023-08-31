package com.kh.app.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.kh.app.chat.dto.AdminChatListDto;
import com.kh.app.chat.entity.ChatMessage;
import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.member.dto.EmployeeDto;
import com.kh.app.member.controller.StudentDto;
import com.kh.app.member.dto.EmployeeInfoDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.StudentListDto;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.dto.StudentVacationApproveDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.StudentVacation;
import com.kh.app.notification.entity.Notification;
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

	List<TicketBuyDto> findByTicketInfo(String memberId, Map<String, Object> params);

	Curriculum findByDdayInfo(int curriculumId);


	int insertVacation(StudentVacation vacation);

	List<EmployeeInfoDto> findByEmployeeInfo(String memberId);


	List<StudentVacationApproveDto> findAllVacationApproveList(String memberId);


	EmployeeDto findEmployeeById(String memberId);

	StudentDto findStudentType(String memberId);

	int updateVacationApprove(String vacationId, String approveResult);

	List<StudentListDto> findStudentByTeacher(String memberId);

	int getTotalCountOfChatList(String memberId);

	List<AdminChatListDto> findAllChat(Map<String, Object> params, String memberId);

	List<ChatMessage> getChatMessagesByChatId(int chatId);

	List<Notification> getNotificationsById(String memberId);

	int updateAlarmReadCheck(int alarmId);

	int totalCountTicket(String memberId);


}
