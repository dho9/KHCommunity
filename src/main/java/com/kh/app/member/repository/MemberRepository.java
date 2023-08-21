package com.kh.app.member.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;

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

	

}