package com.kh.app.messageBox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.member.controller.MemberSecurityController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Validated
@RequestMapping("/message")
public class messageController {
	
	@GetMapping("/messageSend.do")
	public void messageSend() {
	}

}
