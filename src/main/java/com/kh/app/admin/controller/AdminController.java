package com.kh.app.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.admin.service.AdminService;
import com.kh.app.member.entity.Member;
import com.kh.app.board.dto.BoardChartDto;

import lombok.extern.slf4j.Slf4j;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 메인화면 출력: 오늘의 이슈, 게시판 현황, 게시글 통계, 미승인 내역, 신고현황 - 유성근
	@GetMapping("/adminMain.do")
	public void adminMain(Model model) throws JsonProcessingException {
		// 오늘 날짜
		String today = new SimpleDateFormat("yy/MM/dd").format(new Date());
		
		// 신규 수강생 수
		int todayNewStudentCount = adminService.todayNewStudentCount();
		model.addAttribute("todayNewStudentCount", todayNewStudentCount);
		
		// 신규 직원 수
		int todayNewEmployee = adminService.todayNewEmployee();
		
		// 신규 강사 수
		int todayNewTeacher = adminService.todayNewTeacher();
		
		int todayTotalEmployee = todayNewEmployee + todayNewTeacher;
		model.addAttribute("todayTotalEmployee", todayTotalEmployee);
		
		// 승인해야할 수강생 수
		int approvementStudentCount = adminService.approvementStudentCount();
		model.addAttribute("approvementStudentCount", approvementStudentCount);
		
		// 승인해야할 휴가 수
		int approvementStudentVacationCount = adminService.approvementStudentVacationCount();
		model.addAttribute("approvementStudentVacationCount", approvementStudentVacationCount);
		
		// 신규 게시글 수
		int todayNewPostCount = adminService.todayNewPostCount();
		model.addAttribute("todayNewPostCount", todayNewPostCount);
		
		// 신고내역 수
		int todayNewReportCount = adminService.todayNewReportCount();
		model.addAttribute("todayNewReportCount", todayNewReportCount);
		
		// 게시판 현황 - 게시판 이름, 게시글 수 조회
		List<BoardChartDto> boardChartDtos = adminService.findBoardNameAndPostCount();
		log.debug("boardChartDtos = {}", boardChartDtos);
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = objectMapper.writeValueAsString(boardChartDtos);
		model.addAttribute("boardChartData", jsonData);
		BoardChartDto boardChartOne = null;
		BoardChartDto boardChartTwo = null;
		BoardChartDto boardChartThree = null;
		BoardChartDto boardChartFour = null;
		BoardChartDto boardChartFive = null;
		for(int i = 0; i<boardChartDtos.size(); i++) {
			boardChartOne = boardChartDtos.get(0);
			boardChartTwo = boardChartDtos.get(1);
			boardChartThree = boardChartDtos.get(2);
			boardChartFour = boardChartDtos.get(3);
			boardChartFive = boardChartDtos.get(4);
		}
		model.addAttribute("boardChartOne", boardChartOne);
		model.addAttribute("boardChartTwo", boardChartTwo);
		model.addAttribute("boardChartThree", boardChartThree);
		model.addAttribute("boardChartFour", boardChartFour);
		model.addAttribute("boardChartFive", boardChartFive);
		
	}
	
	// 수강생 목록 조회 - 유성근
	@GetMapping("/adminStudentList.do")
	public void adminStudentList() {}
	
	@GetMapping("/employeeList.do")
	public void employeeList(Model model){
		List<Member> members = adminService.findAllEmployee();
		log.debug("members = {}", members);
		
	}
}
