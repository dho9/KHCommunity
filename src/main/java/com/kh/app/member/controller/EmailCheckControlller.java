package com.kh.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Validated
@RequestMapping("/email")
public class EmailCheckControlller {
	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
	
		log.debug("email = {}", email);
		
		return "";
	}

}
