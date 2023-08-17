package com.kh.app.admin.service;

import java.util.List;

import com.kh.app.board.dto.BoardChartDto;

public interface AdminService {

	int todayNewStudentCount();

	int todayNewEmployee();
	
	int todayNewTeacher();
	
	int approvementStudentCount();

	int approvementStudentVacationCount();

	int todayNewPostCount();

	int todayNewReportCount();

	List<BoardChartDto> findBoardNameAndPostCount();


}
