package com.kh.app.schedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.member.entity.MemberDetails;
import com.kh.app.schedule.dto.CalendarInsertDto;
import com.kh.app.schedule.entity.Calendar;
import com.kh.app.schedule.service.CalenServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Validated
@RequestMapping("/calendar/calendar.do")
public class CalendarController {
	
	@Autowired(required = false)
	private CalenServiceImpl service;

	@GetMapping(params="method=list")
	public String list() {
		return "/schedule/fullcalendar";
	}
	
	@GetMapping(params = "method=data")
	@ResponseBody
	public ArrayList<Calendar> data(Model model, @AuthenticationPrincipal MemberDetails member) {
		String memberId= member.getMemberId();
		ArrayList<Calendar> calList = service.calenList(memberId);
		model.addAttribute("list", service.calenList(memberId));
		return calList;
	}
	
	@PostMapping(params = "method=data")
	public String dataSet(@RequestParam String eventTitle,
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam String backgroundColor,
			@RequestParam String memberId,
			Model model) {
		
		CalendarInsertDto calendarInsertDto = CalendarInsertDto.builder()
				.title(eventTitle).start(start).end(end).backgroundColor(backgroundColor).memberId(memberId).build();
				
		int result = service.insertEvent(calendarInsertDto);	
		model.addAttribute("list", service.calenList(memberId));
		return "redirect:/calendar/calendar.do?method=list";
	}
	
	@GetMapping(params = "method=delete")
	@ResponseBody
	public String Delete(@RequestParam int groupId,
			Model model) {
		
		int eventId = groupId;
		int result = service.deleteEvent(eventId);
		
		return "뭐..........";
	}
 }