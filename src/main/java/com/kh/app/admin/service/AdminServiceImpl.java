package com.kh.app.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.admin.repository.AdminRepository;
import com.kh.app.member.entity.Member;
import com.kh.app.board.dto.BoardChartDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepository;
	
	@Override
	public List<Member> findAllEmployee() {
		return adminRepository.findAllEmployee();
	}
	public int todayNewStudentCount() {	
		return adminRepository.todayNewStudentCount();
	}
	
	
	@Override
	public int approvementStudentCount() {
		return adminRepository.approvementStudentCount();
	}
	
	@Override
	public int approvementStudentVacationCount() {
		return adminRepository.approvementStudentVacationCount();
	}
	
	@Override
	public int todayNewEmployee() {
		return adminRepository.todayNewEmployee();
	}
	
	@Override
	public int todayNewTeacher() {
		return adminRepository.todayNewTeacher();
	}
	
	@Override
	public int todayNewPostCount() {
		return adminRepository.todayNewPostCount();
	}
	
	@Override
	public int todayNewReportCount() {
		return adminRepository.todayNewReportCount();
	}
	
	@Override
	public List<BoardChartDto> findBoardNameAndPostCount() {
		return adminRepository.findBoardNameAndPostCount();
	}
	
	@Override
	public Member findById(String id) {
		return adminRepository.findById(id);
	}
}
