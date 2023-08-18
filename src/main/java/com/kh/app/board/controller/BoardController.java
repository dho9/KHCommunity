package com.kh.app.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.board.entity.BoardSearchDetails;
import com.kh.app.board.service.BoardService;
import com.kh.app.member.entity.MemberDetails;

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
	
	/**
	 * index.jsp에서 제목 + 게시글 검색
	 * @param keyword
	 * @param model
	 * @return
	 */
	@GetMapping("/boardSearch.do")
    public String boardSearch(@RequestParam String keyword, Model model) {
        List<BoardSearchDetails> boards = boardService.findAllByKeyword(keyword);
        log.debug("boards = {}", boards);
        model.addAttribute("boards = {}", boards);
        model.addAttribute("keyword = {}", keyword);
        return "/board/boardListByKeyword";
    }
	
	@GetMapping("/myBoards.do")
	public ResponseEntity<?> myBoards(@AuthenticationPrincipal MemberDetails principal) {
//		String memberId = principal.getMemberId();
		List<BoardSearchDetails> boards = boardService.findAllByMemberId("gmlwls");
		log.debug("boards = {}", boards);
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("boards", boards));
	}

}
