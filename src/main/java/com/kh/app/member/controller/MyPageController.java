package com.kh.app.member.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.member.dto.StudentMypageInfoDto;
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
	public void myPage(Model model, @AuthenticationPrincipal MemberDetails principal) throws Exception {
		// 시작
		StudentMypageInfoDto studentInfo = memberService.findByMemberInfo(principal.getMemberId());
		model.addAttribute("studentInfo", studentInfo);
		log.debug("studentInfo = {}" , studentInfo);
		// 식권정보 끝

		// 식권정보 시작
		List<TicketBuyDto> studentTicketInfo = memberService.findByTicketInfo(principal.getMemberId());
		model.addAttribute("studentTicketInfo", studentTicketInfo);
		// 식권정보 끝

		// Dday 시작
		if (studentInfo.getCurriculumId() != 0) {
			Curriculum curriculumDday = memberService.findByDdayInfo(studentInfo.getCurriculumId());
			model.addAttribute("curriculumDday", curriculumDday);

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			LocalDate endDateFrm = studentInfo.getCurriculumEndAt();

			String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())); // 오늘날짜

			Date today = new Date(dateFormat.parse(todayFm).getTime());
			Date endDate = Date.from(endDateFrm.atStartOfDay(ZoneId.systemDefault()).toInstant());

			long calculate = endDate.getTime() - today.getTime();

			int Ddays = (int) (calculate / (24 * 60 * 60 * 1000));
			model.addAttribute("Ddays",Ddays); 
		}
		// Dday 끝 }
	}

}
