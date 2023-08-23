package com.kh.app.member.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.service.MemberService;
import com.kh.app.ticket.dto.TicketBuyDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Validated
@Controller
@RequestMapping("/member")
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/myPage.do")
	public void myPage(
			@Valid AdminStudentListDto studentInfo, 
			Model model, 
			@AuthenticationPrincipal MemberDetails principal) {
		  // 인증된 회원 정보를 사용하여 repository에 저장된 정보를 가져옴
		studentInfo = memberService.findByMemberInfo(principal.getMemberId());
        // 가져온 정보를 뷰에 전달하기 위해 Model 객체에 저장
        model.addAttribute("studentInfo", studentInfo);
        
        
        List<TicketBuyDto> studentTicketInfo = memberService.findByTicketInfo(principal.getMemberId());
        model.addAttribute("studentTicketInfo", studentTicketInfo);
	}
	
	
}
