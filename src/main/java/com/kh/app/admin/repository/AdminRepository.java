package com.kh.app.admin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.member.entity.Member;

@Mapper
public interface AdminRepository {

	@Select("select * from member where member_role = 'e'")
	List<Member> findAllEmployee();

}
