package com.kh.app.admin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.member.entity.Member;
import com.kh.app.board.dto.BoardChartDto;


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

	@Select("SELECT b.board_name as boardName, COUNT(p.post_id) AS postCount\r\n"
			+ "FROM post p\r\n"
			+ "JOIN board b ON p.board_id = b.board_id\r\n"
			+ "GROUP BY b.board_name\r\n"
			+ "ORDER BY postCount DESC, board_name\r\n"
			+ "OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY")
	List<BoardChartDto> findBoardNameAndPostCount();



	@Select("select * from member where member_role = 'e'")
	List<Member> findAllEmployee();

	@Select("select * from member where member_id = #{id}")
	Member findById(String id);

}
