package com.kh.app.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.board.entity.BoardDetails;
import com.kh.app.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;

//@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardList.do")
	public void boardList(@RequestParam(defaultValue = "1") int page, Model model) {
		int limit = 10;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		List<BoardDetails> boards = boardService.findAll(params);
		log.debug("boards = {}", boards);
		model.addAttribute("boards", boards);
		
	}
}
