package com.kh.app.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

import com.kh.app.common.KhCoummunityUtils;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
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

		log.debug("member = {}", member);

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
		log.debug("authentication = {}", authentication);
		MemberDetails principal = (MemberDetails) authentication.getPrincipal();
		Object credentials = authentication.getCredentials();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		log.debug("principal = {}", principal);
		log.debug("credentials = {}", credentials);
		log.debug("authorities = {}", authorities);

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

		log.debug("email = {}", email);
		model.addAttribute("email", email);

		return memberService.joinEmail(email);
	}

	@GetMapping("/certificate.do")
	@ResponseBody
	public ResponseEntity<?> studnetCertificate(@RequestParam String memberId) {

		Student student = memberService.findStudentById(memberId);

		log.debug("student ={}", student);
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("student", student, "memberId", memberId));
	}

	@PostMapping("/certification.do")
	public String certification(@AuthenticationPrincipal MemberDetails member,
			@RequestParam(value = "upFile", required = true) MultipartFile upFiles)
			throws IllegalStateException, IOException {

		// 1. 파일저장
		StudentAttachment attach = null;

		if (!upFiles.isEmpty()) {
			String originalFilename = upFiles.getOriginalFilename();
			String renamedFilename = KhCoummunityUtils.getRenamedFilename(originalFilename); // 20230807_14255555

			File destFile = new File(renamedFilename);

			upFiles.transferTo(destFile);

			attach = StudentAttachment.builder().studentOriginalFilename(originalFilename)
					.studentRenamedFilename(renamedFilename).memberId(member.getMemberId()).build();

		}
		
		log.debug("attach = {}", attach);

		int result = memberService.insertStudentAttach(attach);

		return "redirect:/member/myPage.do";
	}

}
