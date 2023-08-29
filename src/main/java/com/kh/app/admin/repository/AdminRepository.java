package com.kh.app.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.app.member.entity.Authority;
import com.kh.app.member.entity.Employee;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.Teacher;
import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.report.dto.AdminReportListDto;
import com.kh.app.report.entity.Report;
import com.kh.app.board.dto.BoardChartDto;
import com.kh.app.curriculum.dto.AdminCurriculumDetailDto;
import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.MyClassBoardListDto;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.chat.dto.AdminChatListDto;
import com.kh.app.chat.entity.ChatMessage;
import com.kh.app.curriculum.dto.CurriculumListDto;
import com.kh.app.curriculum.dto.CurriculumRegDto;
import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.khclass.entity.KhClass;
import com.kh.app.member.dto.AdminEmployeeListDto;
import com.kh.app.member.dto.AdminStudentApproveDto;
import com.kh.app.member.dto.EmployeeCreateDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.TeacherCreateDto;
import com.kh.app.member.dto.TeacherListDto;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.vacation.dto.AdminVacationApproveDto;
import com.kh.app.vacation.dto.VacationNonApprovementListDto;


@Mapper
public interface AdminRepository {
	
	@Select("select count(*) from student where substr(to_char(student_enroll_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')")
	int todayNewStudentCount();

	@Select("select count(*) from student where approve_check = 'i'")
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

	@Select("select s.student_id, approve_request_date, (select curriculum_name from curriculum c where c.curriculum_id = s.curriculum_id) curriculum_name from (select rownum, student_id, curriculum_id, approve_check, approve_request_date from student) s where approve_check = 'i' and (rownum between 1 and 3)")
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

	List<AdminEmployeeListDto> findAllEmployee(Map<String, Object> filters, RowBounds rowBounds);

	@Select("SELECT m.* FROM member m INNER JOIN authority a ON m.member_id = a.member_id WHERE a.auth = 'ADMIN' AND m.member_id = #{id}")
	Member findById(String id);

	@Insert("insert into employee values (#{id}, #{dept}, sysdate)")
	int insertEmployee(EmployeeCreateDto employee);

	@Insert("insert into member values (#{memberId}, #{memberPwd}, #{memberName}, #{memberPhone}, #{email}, #{birthday})")
	int insertMember(MemberCreateDto member);
	
	@Insert("insert into authority values (#{memberId}, #{auth})")
	int insertAuth(Authority auth);
	
	@Select("select * from (select rownum, report_id, post_id, comment_id, message_id, reporter_id, report_content, attacker_id, report_send_date, report_check from report)\r\n"
			+ "where  report_check = 'n' and (rownum between 1 and 6)")
	List<AdminReportListDto> reportListSix();

	
	List<AdminStudentListDto> findAllStudents(Map<String, Object> filters, RowBounds rowBounds);


	@Update("update student set student_Type = #{studentType} where student_id = #{studentId}")
	int updateAdminStudent(AdminStudentListDto student);


	@Delete("delete from member where member_id = #{studentId}")
	int deleteAdminStudent(AdminStudentListDto student);

	int totalCountStudents(Map<String, Object> filters);

	@Update("update employee set job_code = #{jobCode} where employee_id = #{employeeId}")
	int updateAdminEmployee(AdminEmployeeListDto employee);

	@Delete("delete from employee where employee_id = #{employeeId}")
	int deleteAdminEmployee(AdminEmployeeListDto employee);

	@Delete("delete from member where member_id = #{employeeId}")
	int deleteAdminMember(AdminEmployeeListDto employee);

	List<TeacherListDto> findAllTeacher(Map<String, Object> filters, RowBounds rowBounds);

	@Delete("delete from member where member_id = #{memberId}")
	int deleteAdminTeacher(String memberId);

	int totalCountEmployees(Map<String, Object> filters);

	int totalCountTeachers(Map<String, Object> filters);
	
	@Delete("delete from authority where member_id = #{memberId}")
	int deleteAdminAuthority(String memberId);

	@Insert("insert into teacher values (#{teacherId}, sysdate)")
	int insertTeacher(TeacherCreateDto teacher);
	@Insert("insert into message_box values (seq_message_id.NEXTVAL, #{sendId}, #{receiveId}, #{messageContent}, default, default, 'n')")
	int sendMessageToStudent(MessageBox message);

	@Select("select * from curriculum order by curriculum_end_at")
	List<Curriculum> findAllCurriculum();

	@Select("SELECT s.student_id, m.member_name, s.student_type, s.approve_check, s.approve_request_date, (select student_renamed_filename from student_attachment a where a.member_id = s.student_id) as studentRenamedFilename FROM student s JOIN member m ON s.student_id = m.member_id where approve_check='i'")
	List<AdminStudentApproveDto> adminStudentApprovementList(RowBounds rowBounds);

	@Select("SELECT count(*) FROM student s JOIN member m ON s.student_id = m.member_id where approve_check='i'")
	int totalCountNonApprovementStudents();

	@Update("update student set curriculum_id = #{curriculumId}, approve_check = 'y', approve_complete_date = sysdate where student_id = #{studentId}")
	int approvementStudent(AdminStudentListDto student);

	@Update("update student set approve_check = 'n' where student_id = #{studentId} ")
	int adminStudentApprovementNo(AdminStudentListDto student);

	List<CurriculumListDto> adminCourseList(Map<String, Object> filters, RowBounds rowBounds);

	int totalCountCurriculum(Map<String, Object> filters);

	@Select("select * from member m join student s on m.member_id = s.student_id join curriculum c on s.curriculum_id = c.curriculum_id where c.class_id = #{classId} and c.curriculum_id = #{curriculumId}")
	List<AdminCurriculumDetailDto> findStudentsByClassId(String classId, int curriculumId);

	@Select("select member_id, member_name from member m join teacher t on m.member_id = t.teacher_id")
	List<Teacher> findAllTeachers();

	@Select("select * from class")
	List<KhClass> findAllClass();

	@Insert("insert into curriculum (curriculum_id, class_id, teacher_id, subject, curriculum_name, curriculum_start_at, curriculum_end_at) values (seq_curriculum_id.nextval, #{classId}, #{teacherId}, #{subject}, #{curriculumName}, #{startDate}, #{endDate})")
	int addCurriculum(CurriculumRegDto curriculum);	
	
	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check, tag) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, sysdate, 'n', 'y', 'y', #{tags, typeHandler=stringListTypeHandler})")
	@SelectKey(
			before = false, 
			keyProperty = "postId", 
			resultType = int.class,
			statement = "select seq_post_id.currval from dual")
	int insertBoard(BoardCreateDto board);

	@Insert("insert into post_content (post_id, board_id, content) values(#{postId}, #{boardId}, #{content})")
	int insertPostContent(BoardCreateDto board);

	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check, tag) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, sysdate, 'n', 'n', 'y', #{tags, typeHandler=stringListTypeHandler})")
	@SelectKey(
			before = false, 
			keyProperty = "postId", 
			resultType = int.class,
			statement = "select seq_post_id.currval from dual")
	int insertBoardNofiles(BoardCreateDto board);

	@Insert("insert into post_attachment values(seq_post_attach_id.nextval, #{postId}, #{boardId}, #{postOriginalFilename}, #{postRenamedFilename})")
	int insertPostAttach(PostAttachment attach);

	@Delete("delete from store where store_id = #{storeId}")
	int deleteStore(int storeId);

	@Select("select count(*) from vacation where vacation_approve_check = '2'")
	int getTotalCountOfNonApprovementStudent();

	@Select("SELECT\r\n"
			+ "    v.vacation_id AS vacationId,\r\n"
			+ "    m.member_name AS memberName,\r\n"
			+ "    v.vacation_send_date,\r\n"
			+ "    v.vacation_start_date,\r\n"
			+ "    v.vacation_end_date,\r\n"
			+ "    m.birthday,\r\n"
			+ "    c.curriculum_start_at AS curriculumStartAt,\r\n"
			+ "    c.curriculum_end_at AS curriculumEndAt,\r\n"
			+ "    c.curriculum_name AS curriculumName,\r\n"
			+ "    c.class_id AS classId,\r\n"
			+ "    v.teacher_id,\r\n"
			+ "    t.member_name AS teacherName\r\n"
			+ "FROM\r\n"
			+ "    student s\r\n"
			+ "LEFT JOIN\r\n"
			+ "    member m ON s.student_id = m.member_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    curriculum c ON s.curriculum_id = c.curriculum_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    vacation v ON s.student_id = v.student_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    member t ON v.teacher_id = t.member_id\r\n"
			+ "WHERE\r\n"
			+ "    v.vacation_approve_check = '2'")
	List<VacationNonApprovementListDto> findAllNonApprovementStudent();

	@Update("update curriculum set class_id = #{classId}, teacher_id = #{teacherId}, subject = #{subject}, curriculum_name = #{curriculumName}, curriculum_start_at = #{startDate}, curriculum_end_at = #{endDate} where curriculum_id = #{curriculumId}")
	int updateCurriculum(CurriculumRegDto curriculum);

	@Insert("insert into store values (seq_store_id.nextval, #{storeName}, #{postNumber}, #{address}, '음식점')")
	int insertStore(String storeName, String postNumber, String address);

	@Select("select * from report order by report_send_date")
	List<Report> findAllReports(RowBounds rowBounds);

	@Select("select count(*) from report")
	int countAllReports();

	List<Report> findReportsByFilter(String reportType, RowBounds rowBounds);

	int countReportsByFilter(String reportType);
	
	@Select("select\r\n"
			+ "    t.chat_id,\r\n"
			+ "    t.student_id,\r\n"
			+ "    m.member_name student_name,\r\n"
			+ "    r.chat_type,\r\n"
			+ "    r.chat_date,\r\n"
			+ "    c.curriculum_name,\r\n"
			+ "    c.class_id,\r\n"
			+ "    s.student_type\r\n"
			+ "from \r\n"
			+ "    talker t \r\n"
			+ "        join chat_room r\r\n"
			+ "            on t.chat_id = r.chat_id\r\n"
			+ "        join student s\r\n"
			+ "            on t.student_id = s.student_id\r\n"
			+ "        join curriculum c\r\n"
			+ "            on s.curriculum_id = c.curriculum_id\r\n"
			+ "        join member m\r\n"
			+ "            on s.student_id = m.member_id\r\n"
			+ "order by \r\n"
			+ "		r.chat_id")
	List<AdminChatListDto> findAllChat(RowBounds rowBounds);

	//List<AdminChatListDto> findAllChat(RowBounds rowBounds);

	@Select("select count(*) from chat_room")
	int getTotalCountOfChatList();

	@Select("select * from chat_message where chat_id = #{chatId} order by chat_no")
	List<ChatMessage> getChatMessagesByChatId(int chatId);

	@Insert("INSERT INTO ticket (ticket_id, store_id, price)\r\n"
			+ "VALUES (\r\n"
			+ "   seq_ticket_id.NEXTVAL,\r\n"
			+ "   (SELECT store_id FROM store WHERE store_name = #{storeName}),\r\n"
			+ "   5900\r\n"
			+ ")")
	int insertTicket(String storeName);

	@Delete("delete from report where report_Id = #{reportId}")
	int deleteReport(String reportId);

	@Insert("insert into message_box values(seq_message_id.nextval, #{admin}, #{attackerId}, #{messageContent}, default, default, 'n')")
	int sendReportToStudent(String attackerId, String admin, String messageContent);

	@Delete("delete from post where board_Id = #{boardId}")
	int deleteMyClassBoard(String boardId);

	@Select("SELECT *\r\n"
			+ "FROM myclass\r\n"
			+ "JOIN curriculum ON myclass.curriculum_id = curriculum.curriculum_id")
	List<MyClassBoardListDto> findAllMyClassBoard();

	@Select("SELECT c.curriculum_id, c.class_id, c.teacher_id, c.subject, c.curriculum_name, c.curriculum_start_at, c.curriculum_end_at\r\n"
			+ "FROM curriculum c\r\n"
			+ "LEFT JOIN myclass mc ON c.curriculum_id = mc.curriculum_id\r\n"
			+ "WHERE c.curriculum_start_at >= TRUNC(SYSDATE)\r\n"
			+ "    AND mc.curriculum_id IS NULL")
	List<Curriculum> findRecentCurriculum();

	@Update("update myclass set curriculum_id = #{selectedCurriculumId} where board_id = #{boardId}")
	int updateMyClass(String boardId, String selectedCurriculumId);

	
}
