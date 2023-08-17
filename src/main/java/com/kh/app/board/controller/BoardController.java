package com.kh.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@GetMapping("/freeBoardList.do")
	public void freeBoardList() {
		
	}
	
	@GetMapping("/marketBoardList.do")
	public void marketBoardList() {
		
	}
	
	@GetMapping("/todayFoodBoardList.do")
	public void todayFoodBoardList() {
		
	}
	
	@GetMapping("/sharingInformationBoardList.do")
	public void sharingInformationBoardList() {
		
	}
	
	@GetMapping("/askCodeBoardList.do")
	public void askCodeBoardList() {
		
	}
	
	@GetMapping("/studyBoardList.do")
	public void studyBoardList() {
		
	}
	
	@GetMapping("/graduateBoardList.do")
	public void graduateBoardList() {
		
	}
	
	@GetMapping("/preStudentBoardList.do")
	public void preStudentBoardList() {
		
	}
	
	@GetMapping("/employeeBoardList.do")
	public void employeeBoardList() {
		
	}
	
	@GetMapping("/notificationBoardList.do")
	public void notificationBoardList() {
		
	}
	
	@GetMapping("/myClassBoardList.do")
	public void myClassBoardList() {
		
	}
	
	@GetMapping("/jobSearchBoardList.do")
	public void jobSearchBoardList() {
		
	}
	
	@GetMapping("/promotionBoardList.do")
	public void promotionBoardList() {
		
	}

	
	
}
