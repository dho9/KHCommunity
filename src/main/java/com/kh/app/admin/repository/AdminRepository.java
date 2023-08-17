package com.kh.app.admin.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface AdminRepository {
	
	@Select("select count(*) from student where substr(to_char(student_enroll_dated), 1, 9) = to_date(sysdate, 'yy/MM/dd')")
	int todayNewStudentCount();

	@Select("select count(*) from student where approve_check = 'n'")
	int approvementStudentCount();

	@Select("select count(*) from vacation where vacation_approve_check = '2'")
	int approvementStudentVacationCount();

	@Select("select count(*) from employee where substr(to_char(employee_enroll_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')")
	int todayNewEmployee();

	@Select("select count(*) from teacher where substr(to_char(teacher_enroll_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')")
	int todayNewTeacher();
	
	@Select("select count(*) from post where substr(to_char(post_created_at), 1, 9) = to_date(sysdate, 'yy/MM/dd')")
	int todayNewPostCount();

	@Select("select count(*) from report where report_action is null")
	int todayNewReportCount();



}
