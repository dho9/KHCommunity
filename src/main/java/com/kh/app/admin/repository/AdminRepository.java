package com.kh.app.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	List<AdminEmployeeListDto> findAllEmployee(Map<String, Object> filters);

	@Select("SELECT m.* FROM member m INNER JOIN authority a ON m.member_id = a.member_id WHERE a.auth = 'ADMIN' AND m.member_id = #{id}")
	Member findById(String id);

	@Insert("insert into employee values (#{id}, #{dept}, #{employeeEnrollDate}")
	int insertEmployee(EmployeeCreateDto employee);

	@Insert("insert into member values (#{memberId}, #{memberPwd}, #{memberName}, #{memberPhone}, #{email}, #{birthday})")
	int insertMember(MemberCreateDto member);
	
	@Select("select * from (select rownum, report_id, post_id, comment_id, message_id, reporter_id, report_content, attaker_id, report_send_date, report_check from report)\r\n"
			+ "where  report_check = 'n' and (rownum between 1 and 6)")
	List<AdminReportListDto> reportListSix();

	
	List<AdminStudentListDto> findAllStudents(Map<String, Object> filters);

	@Update("update student set student_Type = #{studentType} where student_id = #{studentId}")
	int updateAdminStudent(AdminStudentListDto student);

	@Update("update employee set job_code = #{jobCode} where employee_id = #{employeeId}")
	int updateAdminEmployee(AdminEmployeeListDto employee);

	@Delete("delete from employee where employee_id = #{employeeId}")
	int deleteAdminEmployee(AdminEmployeeListDto employee);

	@Delete("delete from member where member_id = #{employeeId}")
	int deleteAdminMember(AdminEmployeeListDto employee);

}
