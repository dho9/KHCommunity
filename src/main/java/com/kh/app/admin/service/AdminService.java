package com.kh.app.admin.service;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import com.kh.app.member.entity.Employee;
import com.kh.app.member.entity.Member;
import com.kh.app.report.dto.AdminReportListDto;
import com.kh.app.board.dto.BoardChartDto;
import com.kh.app.member.dto.AdminEmployeeListDto;
import com.kh.app.member.dto.AdminStudentApproveDto;
import com.kh.app.member.dto.EmployeeCreateDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.vacation.dto.AdminVacationApproveDto;

public interface AdminService {

	List<AdminEmployeeListDto> findAllEmployee(Map<String, Object> filters);
	
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

	int insertEmployee(EmployeeCreateDto employee);

	int insertMember(MemberCreateDto member);
	List<AdminReportListDto> reportListSix();

	List<AdminStudentListDto> findAllStudents(Map<String, Object> filters);

	int updateAdminStudent(AdminStudentListDto student);

	int updateAdminEmployee(AdminEmployeeListDto employee);

	int deleteAdminEmployee(AdminEmployeeListDto employee);

	int deleteAdminMember(AdminEmployeeListDto employee);


}
