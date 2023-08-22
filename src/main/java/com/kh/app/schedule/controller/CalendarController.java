package com.kh.app.schedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.schedule.dto.CalendarInsertDto;
import com.kh.app.schedule.entity.Calendar;
import com.kh.app.schedule.service.CalenService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Validated
@RequestMapping("/calendar/calendar.do")
public class CalendarController {
	
	@Autowired(required = false)
	private CalenService service;

	@GetMapping(params="method=list")
	public String list() {
		return "/schedule/fullcalendar";
	}
	
	@GetMapping(params = "method=data")
	@ResponseBody
	public ArrayList<Calendar> data(Model d) {
		ArrayList<Calendar> calList = service.calenList();
		log.debug("이게 뭐야 대체.... = {}", calList);
		d.addAttribute("list", service.calenList());
		return calList;
	}
	
	@PostMapping(params = "method=data")
//	@ResponseBody
	public String dataSet(@RequestParam String title,
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam String backgroundColor,
			@RequestParam String memberId,
			Model model) {
		
		log.debug("이게 대체....start = {}", start);
		log.debug("이게 뭐야 대체....title = {}", title);
		log.debug("이게 뭐야 대체....end = {}", end);
		log.debug("이게 뭐야 대체....backgroundColor = {}", backgroundColor);
		log.debug("이게 뭐야 대체....carId = {}", memberId);
		CalendarInsertDto calendarInsertDto = CalendarInsertDto.builder()
				.title(title).start(start).end(end).backgroundColor(backgroundColor).memberId(memberId).build();
				
		ArrayList<Calendar> calList = service.calenList();
		log.debug("이게 뭐야 대체....22222222 = {}", calendarInsertDto);
		model.addAttribute("list", service.calenList());
		return "redirect:/calendar/calendar.do?method=list";
	}
 }