package com.kh.app.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.app.common.HelloSpringUtils;
import com.kh.app.common.KhCoummunityUtils;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.MemberLoginDto;
import com.kh.app.member.dto.MemberUpdateDto;
import com.kh.app.member.dto.StudentDto;
import com.kh.app.member.entity.Employee;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.StudentVacation;
import com.kh.app.member.entity.StudentVacationAttachment;
import com.kh.app.member.service.MemberService;
import com.nimbusds.openid.connect.sdk.assurance.evidences.attachment.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Validated
@RequestMapping("/member")
public class MemberSecurityController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/memberCreate.do")
	public void memberCreate() {
	}

	@GetMapping("/memberCreate2.do")
	public void memberCreate2(@RequestParam String fullEmail, Model model) {
		model.addAttribute("email", fullEmail);
	}

	@PostMapping("/memberCreate2.do")
	public String create(@Valid MemberCreateDto member, BindingResult bindingResult, RedirectAttributes redirectAttr) {
		if (bindingResult.hasErrors()) {
			ObjectError error = bindingResult.getAllErrors().get(0);
			redirectAttr.addFlashAttribute("msg", error.getDefaultMessage());
			return "redirect:/member/memberCreate.do";
		}

		String rawPassword = member.getMemberPwd();
		String encodedPassword = passwordEncoder.encode(rawPassword);
		member.setMemberPwd(encodedPassword);
		
		int result = memberService.insertMember(member);
		redirectAttr.addFlashAttribute("msg", "회원가입을 축하드립니다.");
		return "redirect:/";
	}

	@GetMapping("/memberLogin.do")
	public void memberLogin() {
		
	}

	@GetMapping("/memberDetail.do")
	public void memberDetail(Authentication authentication, @AuthenticationPrincipal MemberDetails member) {
		MemberDetails principal = (MemberDetails) authentication.getPrincipal();
		Object credentials = authentication.getCredentials();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

	}

	@GetMapping("/checkIdDuplicate.do")
	@ResponseBody
	public ResponseEntity<?> checkIdDuplicate(@RequestParam String memberId) {
		boolean available = false;
		try {
			UserDetails memberDetails = memberService.loadUserByUsername(memberId);
		} catch (UsernameNotFoundException e) {
			available = true;
		}

		return ResponseEntity.status(HttpStatus.OK).body(Map.of("available", available, "memberId", memberId));
	}

	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email, Model model) {
		
		log.info("email = {}", email);
		model.addAttribute("email", email);
		return memberService.joinEmail(email);
	}

	
	@GetMapping("/memberUpdate.do")
	public void memberUpdate() {}
	
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(
			@AuthenticationPrincipal MemberDetails principal,
			@Valid MemberUpdateDto _member, 
			BindingResult bindingResult, 
			RedirectAttributes redirectAttr) {
		Member member = _member.toMember();
		String memberId = principal.getMemberId();
		member.setMemberId(memberId);
		
		String rawPassword = member.getMemberPwd();
		String encodedPassword = passwordEncoder.encode(rawPassword);
		member.setMemberPwd(encodedPassword);
		
		// 1. db수정요청
		int result = memberService.updateMember(member);
		
		// 2. security의 authentication 갱신
		UserDetails memberDetails = memberService.loadUserByUsername(memberId);
		Authentication newAuthentication = 
			new UsernamePasswordAuthenticationToken(
				memberDetails,
				memberDetails.getPassword(),
				memberDetails.getAuthorities()
			);
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		
		return "redirect:/member/myPage.do";
	}
	


	@GetMapping("/certificate.do")
	@ResponseBody
	public ResponseEntity<?> studnetCertificate(@RequestParam String memberId) {

		Student student = memberService.findStudentById(memberId);

		System.out.println(student);
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("student", student, "memberId", memberId));
	}

//	@PostMapping("/certification.do")
//	public String certification(@AuthenticationPrincipal MemberDetails member,
//			@RequestParam(value = "upFile", required = true) MultipartFile upFiles)
//			throws IllegalStateException, IOException {
//
//		// 1. 파일저장
//		StudentAttachment attach = null;
//
//		if (!upFiles.isEmpty()) {
//			String originalFilename = upFiles.getOriginalFilename();
//			String renamedFilename = KhCoummunityUtils.getRenamedFilename(originalFilename); // 20230807_14255555
//
//			File destFile = new File(renamedFilename);
//
//			upFiles.transferTo(destFile);
//
//			attach = StudentAttachment.builder().studentOriginalFilename(originalFilename)
//					.studentRenamedFilename(renamedFilename).memberId(member.getMemberId()).build();
//
//		}
//		
//		log.debug("attach = {}", attach);
//
//		int result = memberService.insertStudentAttach(attach);
//
//		return "redirect:/member/myPage.do";
//	}
	
	@PostMapping("/certification.do")
	public String certification(@AuthenticationPrincipal MemberDetails member,
	                            @RequestParam(value = "upFile", required = true) MultipartFile upFiles,
	                             HttpServletRequest request)
	                            throws IllegalStateException, IOException {

	    // 1. 새로운 저장 경로 지정
	    ServletContext servletContext =  request.getServletContext();
	    String resourcesPath = "/resources/images/approveUpload/";
		String approveUploadPath = servletContext.getRealPath(resourcesPath);

	    // 2. 파일 저장
	    StudentAttachment attach = null;

	    if (!upFiles.isEmpty()) {
	        String originalFilename = upFiles.getOriginalFilename();
	        String renamedFilename = KhCoummunityUtils.getRenamedFilename(originalFilename);

	        File destFile = new File(approveUploadPath + renamedFilename);  // 경로 수정

	        upFiles.transferTo(destFile);

	        attach = StudentAttachment.builder()
	                .studentOriginalFilename(originalFilename)
	                .studentRenamedFilename(renamedFilename)
	                .memberId(member.getMemberId())
	                .build();
	    }

	    int result = memberService.insertStudentAttach(attach);

	    return "redirect:/member/myPage.do";
	}
	
	
	@PostMapping("/memberDelete.do")
	public String memberDelete(
			@AuthenticationPrincipal MemberDetails principal,
			@Valid MemberLoginDto _member,
			BindingResult bindingResult, 
			RedirectAttributes redirectAttr) {
	
	
		String memberId = _member.getMemberId();
		
		// 1. db수정요청
		int result = memberService.deleteMember(memberId);
		
	    if (result > 0) {
	    	redirectAttr.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
	        return "redirect:/";
	    } 
	        else {
	        redirectAttr.addFlashAttribute("message", "회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
	        return "redirect:/member/myPage.do";
	    }
	
	}
	
//	
//	@GetMapping("/messageDelete.do")
//	@ResponseBody
//	public ResponseEntity<?> messageDelete(@RequestParam String messageId) {
//
////		int result= memberService.messageDelete(messageId);
//		log.debug("★★messageDelete = {}", messageId);
//		return ResponseEntity.status(HttpStatus.OK).body(Map.of("messageId", messageId));
//	}
//	

	
	@GetMapping("/vacationSubmit.do")
	@ResponseBody
	public ResponseEntity<?> studnetVacationSubmit(@RequestParam String memberId) {

		Student student = memberService.findStudentById(memberId);
		log.debug("student={}", student);
	
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("student", student, "memberId", memberId));
	}

	@PostMapping("/vacationSubmit.do")
	public String vacationSubmit(@AuthenticationPrincipal MemberDetails member, 
								@AuthenticationPrincipal Employee employee,
								@Valid StudentVacation _vacation, 
	                            @RequestParam(value = "upFile", required = true) List<MultipartFile> upFiles,
	                            @RequestParam(value = "teacherId", required = false) String teacherId,
	                            @RequestParam(value = "employeeId", required = false) String employeeId,
	                             HttpServletRequest request)
	                            throws IllegalStateException, IOException {
		
		
	
	    // 1. 새로운 저장 경로 지정
	    ServletContext servletContext =  request.getServletContext();
	    String resourcesPath = "/resources/images/vacationSubmitUpload/";
		String approveUploadPath = servletContext.getRealPath(resourcesPath);

	    // 2. 파일 저장
		List<StudentVacationAttachment> attachments = new ArrayList<>();
		for(MultipartFile upFile : upFiles) {					
			if(!upFiles.isEmpty()) {
				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = KhCoummunityUtils.getRenamedFilename(originalFilename); // 20230807_142828888_123.jpg
				File destFile = new File(approveUploadPath + renamedFilename); // 부모디렉토리 생략가능. spring.servlet.multipart.location 값을 사용
				upFile.transferTo(destFile); // 실제파일 저장
				
				StudentVacationAttachment attach = 
					StudentVacationAttachment.builder()
						.vacationOriginalFilename(originalFilename)
						.vacationRenamedFilename(renamedFilename)
						.build();
				
				attachments.add(attach);
			}
		}
		
		
		
		
		StudentVacation vacation = StudentVacation.builder()
				.vacationId(_vacation.getVacationId())
				.studentId(member.getMemberId())
				.vacationStartDate(_vacation.getVacationStartDate())
				.vacationEndDate(_vacation.getVacationEndDate())
				.teacherId(_vacation.getTeacherId())
		//		.employeeId(employee.getEmployeeId())
				.vacationSendDate(_vacation.getVacationSendDate())
				.vacationApproveCheck("1")
				.attachments(attachments)
				.build();
		
		int result = memberService.insertVacation(vacation);

	    return "redirect:/member/myPage.do";
	}
	
	@GetMapping("/findStudentType.do")
	@ResponseBody
	public ResponseEntity<?> findStudentType(@RequestParam String memberId) {
		StudentDto student = memberService.findStudentType(memberId);
//		log.info("student={}", student);
	
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("student", student));
	} 
	
	@GetMapping("/findTeacher.do")
	@ResponseBody
	public ResponseEntity<?> findTeacher(@RequestParam String memberId) {
		StudentDto teacher = memberService.findTeacher(memberId);
//		log.info("teacher={}", teacher);
		
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("teacher", teacher));
	} 

}

	

