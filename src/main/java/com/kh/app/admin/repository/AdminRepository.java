package com.kh.app.admin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.board.dto.BoardChartDto;
import com.kh.app.member.dto.AdminStudentApproveDto;
import com.kh.app.vacation.dto.AdminVacationApproveDto;


@Mapper
public interface AdminRepository {
	
	@Select("select count(*) from student where substr(to_char(student_enroll_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')")
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

	@Select("SELECT b.board_name as boardName, COUNT(p.post_id) AS postCount\r\n"
			+ "FROM post p\r\n"
			+ "JOIN board b ON p.board_id = b.board_id\r\n"
			+ "GROUP BY b.board_name\r\n"
			+ "ORDER BY postCount DESC, board_name\r\n"
			+ "OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY")
	List<BoardChartDto> findBoardNameAndPostCount();

	@Select("select count(*) from post where substr(to_char(post_created_at), 1, 9) = to_date(sysdate-3, 'yy/MM/dd')")
	int threeDaysAgoPostCount();

	@Select("select count(*) from post where substr(to_char(post_created_at), 1, 9) = to_date(sysdate-2, 'yy/MM/dd')")
	int twoDaysAgoPostCount();

	@Select("select count(*) from post where substr(to_char(post_created_at), 1, 9) = to_date(sysdate-1, 'yy/MM/dd')")
	int yesterdayPostCount();

	@Select("select s.student_id, approve_request_date, (select curriculum_name from curriculum c where c.curriculum_id = s.curriculum_id) curriculum_name from (select rownum, student_id, curriculum_id, approve_check, approve_request_date from student) s where approve_check = 'n' and (rownum between 1 and 3)")
	List<AdminStudentApproveDto> studentApproveListThree();

	@Select("SELECT\r\n"
			+ "    v.vacation_id,\r\n"
			+ "    v.student_id,\r\n"
			+ "    m.member_name,\r\n"
			+ "    c.curriculum_name,\r\n"
			+ "    c.class_id,\r\n"
			+ "    v.vacation_send_date,\r\n"
			+ "    v.vacation_start_date,\r\n"
			+ "    v.vacation_end_date\r\n"
			+ "FROM\r\n"
			+ "    vacation v\r\n"
			+ "JOIN\r\n"
			+ "    student s ON v.student_id = s.student_id\r\n"
			+ "JOIN\r\n"
			+ "    curriculum c ON s.curriculum_id = c.curriculum_id\r\n"
			+ "JOIN\r\n"
			+ "    member m ON s.student_id = m.member_id\r\n"
			+ "WHERE\r\n"
			+ "    v.vacation_approve_check = '2'")
	List<AdminVacationApproveDto> vacationApproveListThree();

}
