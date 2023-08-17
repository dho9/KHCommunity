package com.kh.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.board.entity.BoardSearchDetails;
import com.kh.app.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;

//@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardSearch.do")
	public String boardSearch(@RequestParam String keyword, Model model) {
		List<BoardSearchDetails> boards = boardService.findAllByKeyword(keyword);
		log.debug("boards = {}", boards);
		model.addAttribute("boards", boards);
		return "redirect:/board/boardListByKeyword.do";
	}
}
