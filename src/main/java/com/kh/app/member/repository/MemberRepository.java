package com.kh.app.member.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.app.chat.dto.AdminChatListDto;
import com.kh.app.chat.entity.ChatMessage;
import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.member.dto.EmployeeDto;
import com.kh.app.member.dto.EmployeeInfoDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.StudentDto;
import com.kh.app.member.dto.StudentListDto;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.dto.StudentVacationApproveDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.StudentVacation;
import com.kh.app.member.entity.StudentVacationAttachment;
import com.kh.app.notification.entity.Notification;
import com.kh.app.ticket.dto.TicketBuyDto;

@Mapper
public interface MemberRepository {

	@Insert("insert into member values(#{memberId},#{memberPwd},#{memberName},#{memberPhone},#{email, jdbcType=VARCHAR},#{birthday, jdbcType=DATE})")
	int insertMember(MemberCreateDto member);

	@Insert("insert into authority values(#{memberId}, 'STUDENT')")
	int insertAuthority(MemberCreateDto member);

	@Insert("insert into student values(#{memberId}, null, default, 'n', null, null,  'c')")
	int insertStudent(MemberCreateDto member);

	@Select("select * from member where member_id = #{memberId}")
	Member findMemberById(String memberId);

	MemberDetails loadUserByUsername(String username);

	@Update("update member set member_pwd=#{memberPwd}, birthday=#{birthday, jdbcType=DATE}, member_phone=#{memberPhone} where member_id=#{memberId}")
	int updateMember(Member member);

	@Select("select * from student where student_id = #{memberId}")
	Student findStudentById(String memberId);

	@Insert("insert into student_attachment values(seq_student_attach_id.nextval, #{memberId}, #{studentOriginalFilename}, #{studentRenamedFilename})")
	int insertStudentAttach(StudentAttachment attach);

	@Update("update student set approve_request_date = current_date, approve_check = 'i' where student_id = #{memberId}")
	int updateApproveRequestDate(StudentAttachment attach);

	@Delete("delete from member where member_id=#{memberId}")
	int deleteMember(String memberId);

	StudentMypageInfoDto findByMemberInfo(String memberId);

	@Select("select * from store s left outer join ticket_order t on s.store_id = t.store_id where member_id = #{memberId}")
	List<TicketBuyDto> findByTicketInfo(String memberId,RowBounds rowBounds);

	@Select("select * from curriculum where curriculum_id= #{curriculumId}")
	Curriculum findByDdayInfo(int curriculumId);

	int insertVacationAttach(MemberDetails member, StudentVacationAttachment attach);

	int insertVacationById(MemberDetails member);

	List<StudentVacationApproveDto> findAllVacationApproveList(String memberId);
	 
	@Insert("insert into vacation "
			+ "values(seq_vacation_id.nextval, #{studentId}, "
			+ "#{vacationStartDate, jdbcType=DATE}, #{vacationEndDate, jdbcType=DATE}, "
			+ "#{teacherId}, '', current_date, '1' )")
	@SelectKey(before = false, 
			   keyProperty = "vacationId", 
			   resultType = int.class, 
			   statement = "select seq_vacation_id.currval from dual")
	int insertVacation(StudentVacation vacation);

	@Insert("insert into vacation_attachment "
			+ "values(seq_vacation_attach_id.nextval, #{vacationId}, "
			+ "#{vacationOriginalFilename}, #{vacationRenamedFilename})")
	int insertAttachment(StudentVacationAttachment attach);

	List<EmployeeInfoDto> findByEmployeeInfo(String memberId);

	EmployeeDto findEmployeeById(String memberId);

	@Select("select * from student s left join myclass m on s.curriculum_id = m.curriculum_id where student_id = #{memberId}")
	StudentDto findStudentType(String memberId);

	@Update("update vacation set vacation_approve_check = #{approveResult} where vacation_id=#{vacationId}")
	int updateVacationApprove(String vacationId, String approveResult);

	@Select("SELECT m.member_name, m.member_phone, m.member_email,  c.curriculum_id, c.subject, c.curriculum_name, c.curriculum_start_at,  c.curriculum_end_at FROM student s LEFT JOIN member m ON s.student_id = m.member_id LEFT JOIN curriculum c ON s.curriculum_id = c.curriculum_id where  c.teacher_id=#{memberId}")
	List<StudentListDto> findStudentByTeacher(String memberId);

	@Select("select count(*) from talker WHERE student_id =#{memberId} ")
	int getTotalCountOfChatList(String memberId);

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
			+ "where \r\n"
			+ "		t.student_id = #{memberId}"
			+ "order by \r\n"
			+ "		r.chat_id")
	List<AdminChatListDto> findAllChat(RowBounds rowBounds, String memberId);

	@Select("select * from chat_message where chat_id = #{chatId} order by chat_no")
	List<ChatMessage> getChatMessagesByChatId(int chatId);

	@Select("SELECT * FROM (SELECT * FROM alarm WHERE received_id = #{memberId} ORDER BY alarm_id DESC) WHERE ROWNUM <= 6")
	List<Notification> getNotificationsById(String memberId);

	@Update("update alarm set read_check = 'y' where alarm_id = #{alarmId}")
	int updateAlarmReadCheck(int alarmId);


	@Select("select count(*) from store s left outer join ticket_order t on s.store_id = t.store_id where member_id = #{memberId}")
	int totalCountTicket(String memberId);

	@Select("SELECT \r\n"
			+ "     mc.board_id\r\n"
			+ " FROM\r\n"
			+ "      member m \r\n"
			+ " LEFT OUTER JOIN curriculum c ON c.teacher_id = m.member_id\r\n"
			+ " RIGHT OUTER JOIN authority a ON m.member_id = a.member_id \r\n"
			+ " LEFT OUTER JOIN employee e ON employee_id = m.member_id\r\n"
			+ " LEFT OUTER JOIN myclass mc ON mc.curriculum_id = c.curriculum_id\r\n"
			+ " WHERE	\r\n"
			+ "     m.member_id = 'rudqls'\r\n"
			+ "     and current_date between c.curriculum_start_at and c.curriculum_end_at")
	StudentDto findTeacher(String memberId);


}