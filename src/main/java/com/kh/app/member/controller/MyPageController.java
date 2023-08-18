package com.kh.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/member")
public class MyPageController {
	
	
	@GetMapping("/myPage.do")
	public void myPage(Model model) {
		
	}

}
