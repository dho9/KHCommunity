package com.kh.app.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.admin.service.AdminService;
import com.kh.app.member.entity.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/adminMain.do")
	public void adminMain() {}
	
	@GetMapping("/adminStudentList.do")
	public void adminStudentList() {}
	
	@GetMapping("/employeeList.do")
	public void employeeList(Model model){
		List<Member> members = adminService.findAllEmployee();
		log.debug("members = {}", members);
		
	}
}
