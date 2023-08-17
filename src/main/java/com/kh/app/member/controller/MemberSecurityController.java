package com.kh.app.member.controller;



import java.util.Collection;
import java.util.Map;

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
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.MemberDetails;

import com.kh.app.member.service.MemberService;

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
	public void memberCreate() {}
	
	
	@PostMapping("/memberCreate.do")
	public String create(
			@Valid MemberCreateDto member,
			BindingResult bindingResult, 
			RedirectAttributes redirectAttr) {
		log.debug("member = {}", member);
		
		if(bindingResult.hasErrors()) {
			ObjectError error = bindingResult.getAllErrors().get(0);
			redirectAttr.addFlashAttribute("msg", error.getDefaultMessage());
			return "redirect:/member/memberCreate.do";
		} 
		
		String rawPassword = member.getPassword();
		String encodedPassword = passwordEncoder.encode(rawPassword);
		member.setPassword(encodedPassword);
		
		int result = memberService.insertMember(member);
		redirectAttr.addFlashAttribute("msg", "회원가입을 축하드립니다.");
		return "redirect:/";
	}
	
	@GetMapping("/memberLogin.do")
	public void memberLogin() {}
	
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
	public ResponseEntity<?> checkIdDuplicate(@RequestParam String memberId){
		boolean available = false;
		try {
			UserDetails memberDetails = memberService.loadUserByUsername(memberId);		
		} catch(UsernameNotFoundException e) {
			available = true;
		}
		
		return  ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("available", available, "memberId", memberId));
	}

	
}

