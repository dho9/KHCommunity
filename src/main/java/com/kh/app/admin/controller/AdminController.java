package com.kh.app.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.app.admin.service.AdminService;
import com.kh.app.member.entity.Authority;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.Teacher;
import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.notification.service.NotificationService;
import com.kh.app.report.dto.AdminReportListDto;
import com.kh.app.report.entity.Report;
import com.kh.app.board.dto.BoardChartDto;
import com.kh.app.curriculum.dto.AdminCurriculumDetailDto;
import com.kh.app.curriculum.dto.CurriculumListDto;
import com.kh.app.curriculum.dto.CurriculumRegDto;
import com.kh.app.store.entity.Store;
import com.kh.app.store.service.StoreService;
import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.MyClassBoardListDto;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.chat.dto.AdminChatListDto;
import com.kh.app.chat.entity.ChatMessage;
import com.kh.app.common.HelloSpringUtils;
import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.khclass.entity.KhClass;
import com.kh.app.member.dto.AdminEmployeeListDto;
import com.kh.app.member.dto.AdminStudentApproveDto;
import com.kh.app.member.dto.EmployeeCreateDto;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.TeacherCreateDto;
import com.kh.app.member.dto.TeacherListDto;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.vacation.dto.AdminVacationApproveDto;
import com.kh.app.vacation.dto.VacationNonApprovementListDto;

import lombok.extern.slf4j.Slf4j;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private NotificationService notificationService;
	
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
		model.addAttribute("reports", reports);
	}
	
	// 수강생 목록 조회 - 유성근
	@GetMapping("/adminStudentList.do")
	public void adminStudentList(Model model,
	                             @RequestParam(value = "searchType", required = false) String searchType,
	                             @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
	                             @RequestParam(value = "student_type", required = false) String[] _studentTypes, 
								 @RequestParam(defaultValue = "1") int page) {

	    List<String> studentTypes = null;

	    if (_studentTypes != null) {
	        studentTypes = Arrays.asList(_studentTypes);
	    }

	    // 검색 필터
	    Map<String, Object> filters = new HashMap<>();
	    filters.put("searchType", searchType);
	    filters.put("searchKeyword", searchKeyword);
	    filters.put("studentTypes", studentTypes);

	    // 페이징
	    int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
	    List<AdminStudentListDto> students = adminService.findAllStudents(filters, params);
	    model.addAttribute("students", students);
	    
	    model.addAttribute("currentPage", page);
	    
	    // 전체 학생 수를 가져온다.
	    int totalCount = adminService.totalCountStudents(filters);

	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);
	    
	  
	}
	
	// 직원 목록 조회 - 이태현
	@GetMapping("/employeeList.do")
	public void employeeList(Model model,
				            @RequestParam(value = "searchType", required = false) String searchType,
				            @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                            @RequestParam(value = "job_Code", required = false) String[] _job_Codes,
                            @RequestParam(defaultValue = "1") int page){
		List<String> job_Codes = null;

	    if (_job_Codes != null) {
	    	job_Codes = Arrays.asList(_job_Codes);
	    }
	    
		Map<String, Object> filters = new HashMap<>();
	    filters.put("searchType", searchType);
	    filters.put("searchKeyword", searchKeyword);
	    filters.put("job_Codes", job_Codes);
		

	    // 페이징
	    int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		List<AdminEmployeeListDto> employees = adminService.findAllEmployee(filters, params);
		model.addAttribute("employees", employees);
		model.addAttribute("currentPage", page);
		
		// 전체 학생 수를 가져온다.
	    int totalCount = adminService.totalCountEmployees(filters);

	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);
	}
	
	@GetMapping("/insertMember.do")
	public void insertMember() {}
	
	@RequestMapping("insertMember.do")
    public String insertMember(
        @RequestParam String id,
        @RequestParam String pw,
        @RequestParam String name,
        @RequestParam String birthday, // 생년월일을 String으로 받음
        @RequestParam String email,
        @RequestParam String phone,
        @RequestParam String dept) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
        LocalDate localDateBirthday = LocalDate.parse(birthday, formatter); // LocalDate 형식으로 변환
        
        String encodedPassword = passwordEncoder.encode(pw);
		// member 등록
		MemberCreateDto _member = 
				MemberCreateDto.builder()
				.memberId(id)
				.memberPwd(encodedPassword)
				.memberName(name)
				.memberPhone(phone)
				.email(email)
				.birthday(localDateBirthday)
				.build();
		// employee 등록
		EmployeeCreateDto _employee = 
				EmployeeCreateDto.builder()
				.id(id)
				.dept(dept)
				.build();
		// auth : ADMIN 추가
		Authority auth = new Authority(id, "ADMIN");
		// member테이블 insert
		int result1 = adminService.insertMember(_member);
		// employee테이블 insert
		int result2 = adminService.insertEmployee(_employee);
		// authority테이블 insert
		int result3 = adminService.insertAuth(auth);
        return "redirect:/admin/employeeList.do";
    }
	
	@GetMapping("/insertTeacher.do")
	public void insertTeacher() {}
	
	@RequestMapping("insertTeacher.do")
	public String insertTeacher(
			@RequestParam String id,
	        @RequestParam String pw,
	        @RequestParam String name,
	        @RequestParam String birthday, // 생년월일을 String으로 받음
	        @RequestParam String email,
	        @RequestParam String phone,
	        @RequestParam String subject) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
        LocalDate localDateBirthday = LocalDate.parse(birthday, formatter); // LocalDate 형식으로 변환
        
        String encodedPassword = passwordEncoder.encode(pw);
		// member 등록
		MemberCreateDto _member = 
				MemberCreateDto.builder()
				.memberId(id)
				.memberPwd(encodedPassword)
				.memberName(name)
				.memberPhone(phone)
				.email(email)
				.birthday(localDateBirthday)
				.build();
		// teacher 등록
		TeacherCreateDto _teacher = 
				TeacherCreateDto.builder()
				.teacherId(id)
				.build();
		// auth : ADMIN 추가
		Authority auth = new Authority(id, "TEACHER");
		// member테이블 insert
		int result1 = adminService.insertMember(_member);
		// teacher테이블 insert
		int result2 = adminService.insertTeacher(_teacher);
		// authority테이블 insert
		int result3 = adminService.insertAuth(auth);
        return "redirect:/admin/teacherList.do";
	}
	// 수강생 정보 수정 - 유성근
	@PostMapping("/adminStudentUpdate.do")
	public String adminStudentUpdate(@Valid AdminStudentListDto student) {

	    int result = adminService.updateAdminStudent(student);

	    return "redirect:/admin/adminStudentList.do";
	}
	
	// 수강생 삭제 - 유성근
	@PostMapping("/adminStudentDelete.do")
	public String adminStudentDelete(@Valid AdminStudentListDto student) {
		int result = adminService.deleteAdminStudent(student);
		return "redirect:/admin/adminStudentList.do";
	}
	
	// 수강생에게 쪽지 보내기 - 유성근
	@PostMapping("/adminSendMessage.do")
	public String adminStudentSendMessage(@Valid MessageBox message) {
		message.setSendId("admin");
		int result = adminService.sendMessageToStudent(message);
		
		// 알림
		int alarmId = notificationService.notifyMsgSendFromAdmin(message);
		
		return "redirect:/admin/adminStudentList.do";
	}

	// 피신고자에게 주의조치 보내고 report테이블에서 해당 행 삭제
	@PostMapping("/sendReport.do")
	public String sendReport(@RequestParam String sendReporterId, @RequestParam String reportId, @RequestParam String attackerId, @Valid MessageBox message, @RequestParam String messageContent) {
		String admin = "admin";
		// message_box에 주의조치 메세지전송
		int result = adminService.sendReportToStudent(attackerId, admin, messageContent);
		// 해당 신고내역 report에서 삭제
		int result1 = adminService.deleteReport(reportId);
		
		// 알림
		result = notificationService.notifyReportAlarmToReporterId(sendReporterId, messageContent);
		
		result = notificationService.notifyReportAlarmToAttackerId(attackerId, messageContent);
		
		return "redirect:/admin/reportList.do";
	}
	
	// 수강생 승인 목록 조회 - 유성근
	@GetMapping("/adminStudentApprovementList.do")
	public void adminStudentApprovementList(Model model, @RequestParam(defaultValue = "1") int page) {
		
		// 페이징
	    int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		model.addAttribute("currentPage", page);
		
		List<AdminStudentApproveDto> students = adminService.adminStudentApprovementList(params);
		log.debug("students = {}", students);
		model.addAttribute("students", students);
		
		// 전체 학생 수를 가져온다.
	    int totalCount = adminService.totalCountNonApprovementStudents();

	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);
	    
	    // 커리큘럼 등록 위한 불러오기
	    List<Curriculum> curriculums = adminService.findAllCurriculum();
	    model.addAttribute("curriculums", curriculums);
	}
	
	// 수강생 승인(업데이트)
	@PostMapping("/adminStudentApprovementOk.do")
	public String adminStudentApprovementOk(@Valid AdminStudentListDto student, @RequestParam(value = "khCurriculum", required = false) Integer curriculumId) {
		
		// curriculumId가 null이 아닌 경우에만 student 객체에 설정
	    if (curriculumId != null) {
	        student.setCurriculumId(curriculumId);
	    }
		
	    int result = adminService.approvementStudent(student);
	    
	    // 실시간 알림
	    result = notificationService.notifyStudentApproveCheckOk(student);
	    
		return "redirect:/admin/adminStudentApprovementList.do";
	}
	
	// 수강생 반려(업데이트)
	@PostMapping("adminStudentApprovementNo.do")
	public String adminStudentApprovementNo(@Valid AdminStudentListDto student) {
		
		int result = adminService.adminStudentApprovementNo(student);
		
		// 실시간 알림
	    result = notificationService.notifyStudentApproveCheckNo(student);
		
		return "redirect:/admin/adminStudentApprovementList.do";
	}

	// 직원 정보 수정
	@PostMapping("/adminEmployeeUpdate.do")
	public String adminEmployeeUpdate(@Valid AdminEmployeeListDto employee) {
		int result = adminService.updateAdminEmployee(employee);
		
		return "redirect:/admin/employeeList.do";
	}
	
	// 직원 삭제
	@PostMapping("/adminEmployeeDelete.do")
	public String adminEmployeeDelete(@Valid AdminEmployeeListDto employee) {
		
		int result = adminService.deleteAdminMember(employee);
		
		return "redirect:/admin/employeeList.do";
	}
	
	@GetMapping("/reportList.do")
	public void reportList(Model model,
			@RequestParam(value = "reportType", required = false) String _reportType, 
			@RequestParam(defaultValue = "1") int page) {
		// 페이징
		int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		if (_reportType != null) {
			String reportType = _reportType;
			// checkbox 선택했을때, 해당 신고내역 불러오기
			
			List<Report> reports = adminService.findReportsByFilter(reportType, params);
			int totalCount = adminService.countReportsByFilter(reportType);
			int totalPages = (int) Math.ceil((double) totalCount / limit);
			model.addAttribute("reports", reports);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", totalPages);
		}else {
			// 아무것도 선택안됐을때, 모든 신고내역 불러오기
			List<Report> reports = adminService.findAllReports(params);
			int totalCount = adminService.countAllReports();
			int totalPages = (int) Math.ceil((double) totalCount / limit);
			model.addAttribute("reports", reports);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", totalPages);
		}
		
	}
	
	@GetMapping("/teacherList.do")
	public void teacherList(Model model,
	            @RequestParam(value = "searchType", required = false) String searchType,
	            @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
	            @RequestParam(value = "subject", required = false) String[] _subjects,
                @RequestParam(defaultValue = "1") int page){
		List<String> subjects = null;
		
		if (_subjects != null) {
			subjects = Arrays.asList(_subjects);
		}
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("searchType", searchType);
		filters.put("searchKeyword", searchKeyword);
		filters.put("subjects", subjects);
		
		// 페이징
	    int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		List<TeacherListDto> teachers = adminService.findAllTeacher(filters, params);
		model.addAttribute("currentPage", page);
		model.addAttribute("teachers", teachers);
		// 전체 학생 수를 가져온다.
	    int totalCount = adminService.totalCountTeachers(filters);

	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);
		
	}
	
	@PostMapping("/adminTeacherDelete.do")
	public String adminTeacherDelete(@Valid Teacher teacher) {
		String memberId = teacher.getMemberId();
		// member테이블에서 삭제
		int result1 = adminService.deleteAdminTeacher(memberId);
		int result2 = adminService.deleteAdminAuthority(memberId);
		return "redirect:/admin/teacherList.do";
	}

	// 과정 조회
	@GetMapping("/adminCourseList.do")
    @ResponseBody
    public Object adminCourseList(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(value = "searchType", required = false) String searchType,
            @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
            @RequestParam(value = "subjects", required = false) String[] _subjects,
            @RequestParam(value = "classId", required = false) String classId,
            @RequestParam(value = "curriculumId", required = false) Integer curriculumId,
            Model model
    ) {
        List<String> subjects = null;

        if (_subjects != null) {
            subjects = Arrays.asList(_subjects);
        }

        Map<String, Object> filters = new HashMap<>();
        filters.put("searchType", searchType);
        filters.put("searchKeyword", searchKeyword);
        filters.put("subjects", subjects);

        int limit = 10;
        Map<String, Object> params = Map.of(
                "page", page,
                "limit", limit
        );

        int totalCount = adminService.totalCountCurriculum(filters);
        int totalPages = (int) Math.ceil((double) totalCount / limit);

        List<CurriculumListDto> curriculumList = adminService.adminCourseList(filters, params);
        
        log.debug("curriculumId = {}", curriculumId);
        
        if (classId != null && curriculumId != 0) {
            List<AdminCurriculumDetailDto> classStudents = adminService.findStudentsByClassId(classId, curriculumId);
            return classStudents;
        }

        // 강사 불러오기
        List<Teacher> teachers = adminService.findAllTeachers();
        
        // 반 불러오기
        List<KhClass> khClasses = adminService.findAllClass();
        
        
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("curriculumList", curriculumList);
        model.addAttribute("teachers", teachers);
        model.addAttribute("khClasses", khClasses);
        
        return model;
    }

	@GetMapping("/writeNotice.do")
	public void writeNotice() {}

	@PostMapping("/writeNotice.do")
	public String writeNotice(
			@RequestParam String title,
			@RequestParam String text,
			@RequestParam(name="boardId") int boardId,
			@RequestParam(value = "file", required = false) List<MultipartFile> files) throws IllegalStateException, IOException {
		
		// 1. 파일저장
		List<PostAttachment> attachments = new ArrayList<>(); 
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				String renamedFilename = HelloSpringUtils.getRenameFilename(originalFilename); // 20230807_142828888_123.jpg
				File destFile = new File(renamedFilename); // 부모디렉토리 생략가능. spring.servlet.multipart.location 값을 사용
				file.transferTo(destFile);	
				PostAttachment attach = 
						PostAttachment.builder()
						.postOriginalFilename(originalFilename)
						.postRenamedFilename(renamedFilename)
						.boardId(boardId)
						.build();
				attachments.add(attach);
			}
		}
		String memberId = "admin";
		BoardCreateDto board = BoardCreateDto.builder()
				.title(title)
				.content(text)
				.boardId(boardId)
				.memberId(memberId)
				.attachments(attachments)
				.build();
		
		int result = 0;
		if(board.getAttachments().isEmpty() || board.getAttachments() == null) {
			result = adminService.insertBoardNofiles(board);
		}else {
			result = adminService.insertBoard(board);
		}
		result = adminService.insertPostContent(board);
		
		return "redirect:/admin/writeNotice.do";
	}
	
	// 과정 등록
	@PostMapping("/adminAddCourse.do")
	public String adminAddCourse(@Valid CurriculumRegDto curriculum) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        curriculum.setStartDate(LocalDate.parse(curriculum.getStartDateAsString(), formatter));
        curriculum.setEndDate(LocalDate.parse(curriculum.getEndDateAsString(), formatter));
        
        int result = adminService.addCurriculum(curriculum);
        
		return "redirect:/admin/adminCourseList.do";
	}
	
	// 과정 수정
	@PostMapping("/adminUpdateCourse.do")
	public String adminUpdateCourse(@Valid CurriculumRegDto curriculum) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        curriculum.setStartDate(LocalDate.parse(curriculum.getStartDateAsString(), formatter));
        curriculum.setEndDate(LocalDate.parse(curriculum.getEndDateAsString(), formatter));
        
        int result = adminService.updateCurriculum(curriculum);
        
		return "redirect:/admin/adminCourseList.do";
	}

	@GetMapping("/adminStoreList.do")
	public void adminStoreList(Model model) {
		List<Store> store = storeService.findAll();
		model.addAttribute("stores", store);
	}
	
	@PostMapping("/adminDeleteStore.do")
	public String adminDeleteStore(@Valid int storeId){
		
		int result = adminService.deleteStore(storeId);
		
		return "redirect:/admin/adminStoreList.do";
	}
	
	// 우리반 게시판관리 목록조회
	@GetMapping("/myClassBoardList.do")
	public void myClassBoardList(Model model) {
		List<MyClassBoardListDto> boardLists = adminService.findAllMyClassBoard();
		model.addAttribute("boardLists", boardLists);
		
		List<Curriculum> curriculums = adminService.findRecentCurriculum();
		model.addAttribute("curriculums", curriculums);
	}
	
	@PostMapping("/deleteMyClassBoard.do")
	public String deleteMyClassBoard(@RequestParam String boardId, @RequestParam String selectedCurriculumId) {
		// 우리반게시판 게시글 전체삭제
		int result = adminService.deleteMyClassBoard(boardId);
		// 우리반게시판 커리큘럼 수정
		int result1 = adminService.updateMyClass(boardId, selectedCurriculumId);
		
		return "redirect:/admin/myClassBoardList.do";
	}
	
	// 수강생 휴가 승인 페이지
	@GetMapping("/adminVacationApprovementList.do")
	public void adminVacationApprovementList(@RequestParam(defaultValue = "1") int page, Model model) {
		// 페이징
	    int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
	    model.addAttribute("currentPage", page);
	    
	    // 전체 학생 수를 가져온다.
	    int totalNonApprovementStudentCount = adminService.getTotalCountOfNonApprovementStudent();

	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalNonApprovementStudentCount / limit);
	    model.addAttribute("totalPages", totalPages);
	    
	    // 휴가 미승인 리스트
	    List<VacationNonApprovementListDto> students = adminService.findAllNonApprovementStudent();
	    model.addAttribute("students", students);
	}
	
	// 휴가 승인
	@PostMapping("/adminVacationOk.do")
	public String adminVacationOk(
				@RequestParam(value = "studentId", required = false) String studentId,
				@RequestParam(value = "vacationId", required = false) int vacationId,
				@RequestParam(value = "vacationStartDate", required = false) String vacationStartDate,
				@RequestParam(value = "vacationEndDate", required = false) String vacationEndDate
			){
		
		System.out.println(vacationStartDate + ", " + vacationEndDate);
		
		// db 수정
		int result = adminService.updateVacationOkById(vacationId);
		
		// 실시간 알림
		result = notificationService.notifyVacationCheckOk(studentId, vacationStartDate, vacationEndDate);
		
		return "redirect:/admin/adminVacationApprovementList.do";
	}
	
	// 휴가 반려
	@PostMapping("/adminVacationNo.do")
	public String adminVacationNo(
				@RequestParam(value = "studentId", required = false) String studentId,
				@RequestParam(value = "vacationId", required = false) int vacationId,
				@RequestParam(value = "vacationStartDate", required = false) String vacationStartDate,
				@RequestParam(value = "vacationEndDate", required = false) String vacationEndDate
			){
			
		//db 수정
		int result = adminService.updateVacationByNoId(vacationId);
			
		// 실시간 알림
		result = notificationService.notifyVacationCheckNo(studentId, vacationStartDate, vacationEndDate);
			
		return "redirect:/admin/adminVacationApprovementList.do";
	}

	@PostMapping("/insertStore.do")
    public String insertStore(@ModelAttribute("store") Store store,
    		@RequestParam(value = "file", required = false) MultipartFile file,
    		HttpServletRequest request) throws IllegalStateException, IOException {
		log.debug("file = {}", file);
		String storeName = store.getStoreName();
		String postNumber = store.getPostNumber();
		String address = store.getAddress();
		int id = store.getStoreId();
		log.debug("id = {}", id);
		 // 1. 새로운 저장 경로 지정
	    ServletContext servletContext =  request.getServletContext();
	    String resourcesPath = "/resources/images/store/";
		String approveUploadPath = servletContext.getRealPath(resourcesPath);

	    // 2. 파일 저장
	    StudentAttachment attach = null;

	    if (file != null && !file.isEmpty()) {
	        String originalFilename = file.getOriginalFilename();
	        String renamedFilename = storeName+".jpg";

	        File destFile = new File(approveUploadPath + File.separator + renamedFilename);

	        file.transferTo(destFile);
	    }
	    
	    // store테이블 insert
	    int result = adminService.insertStore(storeName, postNumber, address);
	    
	    // ticket테이블 insert
	    int result1 = adminService.insertTicket(storeName);
        return "redirect:/admin/adminStoreList.do"; // 예시 리다이렉트 URL
    }
	
	// 채팅목록 조회
	@GetMapping("/adminChatList.do")
	public void adminChatList(@RequestParam(defaultValue = "1") int page, Model model) {
		// 페이징
	    int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
	    model.addAttribute("currentPage", page);
	    
	    // 전체 채팅 방 수를 가져온다.
	    int totalChatListCount = adminService.getTotalCountOfChatList();
	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalChatListCount / limit);
	    model.addAttribute("totalPages", totalPages);
	    
	    List<AdminChatListDto> adminChatList = adminService.findAllChat(params);
	    
	    model.addAttribute("adminChatList", adminChatList);
	    
	}	
	@GetMapping("/chatView.do")
	@ResponseBody
	public ResponseEntity<List<ChatMessage>> chatView(@RequestParam(value="chatId", required=false) int chatId) {
	    List<ChatMessage> chatMsgs = adminService.getChatMessagesByChatId(chatId);
	    return ResponseEntity.ok(chatMsgs);
	}
 }
