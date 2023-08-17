package com.kh.app.member.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;

@Mapper
public interface MemberRepository {

	@Insert("insert into member values(#{memberId},#{memberPwd},#{memberName},#{memberPhone},#{email, jdbcType=VARCHAR},#{birthday, jdbcType=DATE})")
	int insertMember(MemberCreateDto member);
	
	@Insert("insert into authority values(#{memberId}, 'STUDENT')")
	int insertAuthority(MemberCreateDto member);

	@Insert("insert into authority values(#{memberId}, null, default, 'n', 'c')")
	int insertStudent(MemberCreateDto member);
	
	@Select("select * from member where member_id = #{memberId}")
	Member findMemberById(String memberId);

	MemberDetails loadUserByUsername(String username);

	

}