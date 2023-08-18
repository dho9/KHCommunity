package com.kh.app.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.admin.repository.AdminRepository;
import com.kh.app.member.entity.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepository;
	
	@Override
	public List<Member> findAllEmployee() {
		return adminRepository.findAllEmployee();
	}
}
