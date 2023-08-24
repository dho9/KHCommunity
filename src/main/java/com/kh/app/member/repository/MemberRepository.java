package com.kh.app.member.repository;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.Vacation;
import com.kh.app.member.entity.VacationAttachment;
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

	@Update("update student set approve_request_date = sysdate, approve_check = 'i' where student_id = #{memberId}")
	int updateApproveRequestDate(StudentAttachment attach);
	
	@Delete("delete from member where member_id=#{memberId}")
	int deleteMember(String memberId);

//	@Select("select c.curriculum_name , mt.member_name, c.class_id from member m left outer join student s on m.member_id = s.student_id left outer join curriculum c on s.curriculum_id = c.curriculum_id left outer join member mt on c.teacher_id = mt.member_id where m.member_id = #{memberId}")
	StudentMypageInfoDto findByMemberInfo(String memberId);

	@Select("select * from store s left outer join ticket_order t on s.store_id = t.store_id where member_id = #{memberId}")
	List<TicketBuyDto> findByTicketInfo(String memberId);

	@Select("select * from curriculum where curriculum_id= #{curriculumId}")
	Curriculum findByDdayInfo(int curriculumId);

	//@Insert("insert into vacation_attachment values(seq_vacation_attach_id.nextval,  seq_vacation_id.nextval, #{vacationOriginalFilename}, #{vacationRenamedFilename})")
	int insertVacationAttach(MemberDetails member, VacationAttachment attach);

//	@Insert("insert into vacation values( seq_vacation_id.nextval, #{member.studentId}, #{member.vacationStartDate, jdbcType=DATE}, #{member.vacationEndDate, jdbcType=DATE}, #{member.teacherId}, #{member.employeeId}, #{member.vacationSendDate}, '1' )")
	int insertVacationById(MemberDetails member);
	
	@Insert("insert into vacation values(seq_vacation_id.nextval, #{studentId}, #{vacationStartDate, jdbcType=DATE}, #{vacationEndDate, jdbcType=DATE}, #{teacherId}, #{employeeId, jdbcType=VARCHAR}, sysdate, '1' )")
	@SelectKey(
			before = false, 
			keyProperty = "vacationId" , 
			resultType = int.class,
			statement = "select seq_vacation_id.currval from dual")
	int insertVacation(Vacation vacation);
	
	  @Insert("insert into vacation_attachment values(seq_vacation_attach_id.nextval,  seq_vacation_id.nextval, #{vacationOriginalFilename}, #{vacationRenamedFilename})"
	  ) int insertAttachment(VacationAttachment attach);
	 
	

	
}