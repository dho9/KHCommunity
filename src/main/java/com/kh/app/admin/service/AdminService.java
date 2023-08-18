package com.kh.app.admin.service;

import java.util.List;

import com.kh.app.member.entity.Member;
import com.kh.app.board.dto.BoardChartDto;
import com.kh.app.member.dto.AdminStudentApproveDto;
import com.kh.app.vacation.dto.AdminVacationApproveDto;

public interface AdminService {

	List<Member> findAllEmployee();
	
	int todayNewStudentCount();

	int todayNewEmployee();
	
	int todayNewTeacher();
	
	int approvementStudentCount();

	int approvementStudentVacationCount();

	int todayNewPostCount();

	int todayNewReportCount();

	List<BoardChartDto> findBoardNameAndPostCount();
	
	Member findById(String id);

	int threeDaysAgoPostCount();

	int twoDaysAgoPostCount();

	int yesterdayPostCount();

	List<AdminStudentApproveDto> studentApproveListThree();

	List<AdminVacationApproveDto> vacationApproveListThree();


}
