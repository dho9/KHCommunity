package com.kh.app.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.admin.service.AdminService;
import com.kh.app.member.entity.Member;
import com.kh.app.report.dto.AdminReportListDto;
import com.kh.app.board.dto.BoardChartDto;
import com.kh.app.member.dto.AdminStudentApproveDto;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.vacation.dto.AdminVacationApproveDto;

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
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = objectMapper.writeValueAsString(boardChartDtos);
		model.addAttribute("boardChartData", jsonData);
		BoardChartDto boardChartOne = null;
		BoardChartDto boardChartTwo = null;
		BoardChartDto boardChartThree = null;
		BoardChartDto boardChartFour = null;
		BoardChartDto boardChartFive = null;
		
		if (boardChartDtos.size() > 0) {
		    boardChartOne = boardChartDtos.get(0);
		}

		if (boardChartDtos.size() > 1) {
		    boardChartTwo = boardChartDtos.get(1);
		}

		if (boardChartDtos.size() > 2) {
		    boardChartThree = boardChartDtos.get(2);
		}

		if (boardChartDtos.size() > 3) {
		    boardChartFour = boardChartDtos.get(3);
		}

		if (boardChartDtos.size() > 4) {
		    boardChartFive = boardChartDtos.get(4);
		}
		
		model.addAttribute("boardChartOne", boardChartOne);
		model.addAttribute("boardChartTwo", boardChartTwo);
		model.addAttribute("boardChartThree", boardChartThree);
		model.addAttribute("boardChartFour", boardChartFour);
		model.addAttribute("boardChartFive", boardChartFive);
		
		// 3일전 게시글 수
		int threeDaysAgoPostCount = adminService.threeDaysAgoPostCount();
		
		// 2일전 게시글 수
		int twoDaysAgoPostCount = adminService.twoDaysAgoPostCount();
		
		// 1일전 게시글 수
		int yesterdayPostCount = adminService.yesterdayPostCount();
		
		model.addAttribute("threeDaysAgoPostCount", threeDaysAgoPostCount);
		model.addAttribute("twoDaysAgoPostCount", twoDaysAgoPostCount);
		model.addAttribute("yesterdayPostCount", yesterdayPostCount);
		
		// 수강생 미승인 내역 List
		List<AdminStudentApproveDto> studentApproveList = adminService.studentApproveListThree();
		model.addAttribute("studentApproveList", studentApproveList);
		
		// 휴가 미승인 내역 List
		List<AdminVacationApproveDto> vacationApproveList = adminService.vacationApproveListThree();
		model.addAttribute("vacationApproveList", vacationApproveList);
		
		// 신고현황 List
		List<AdminReportListDto> reports = adminService.reportListSix();
		log.debug("reports = {}", reports);
		model.addAttribute("reports", reports);
	}
	
	// 수강생 목록 조회 - 유성근
	@GetMapping("/adminStudentList.do")
	public void adminStudentList(Model model) {
		List<AdminStudentListDto> students = adminService.findAllStudents();
		model.addAttribute("students", students);
	}
	
	// 직원 목록 조회 - 이태현
	@GetMapping("/employeeList.do")
	public void employeeList(Model model){
		List<Member> members = adminService.findAllEmployee();
		model.addAttribute("members", members);
	}
	
	// 직원 Id로 검색 - 이태현
	@GetMapping("/findById.do")
	@ResponseBody
	public Member findById(@RequestParam String id) {
	    Member member = adminService.findById(id);
	    log.debug("member = {}", member);
	    return member;
	}
}
