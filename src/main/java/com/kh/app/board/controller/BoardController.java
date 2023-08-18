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

import com.kh.app.board.dto.BoardListDto;
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
	public String freeBoardList(Model model) {
		List<BoardListDto> freeBoardLists = boardService.freeBoardFindAll();
        log.debug("freeBoardLists = {}", freeBoardLists);
        
        model.addAttribute("freeBoardLists", freeBoardLists);
        
        return "/board/freeBoardList";
		
		
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
	
	@GetMapping("/preStudentBoardList.do")
	public String preStudentBoardList(Model model) {
		List<BoardListDto> preStudentBoardList = boardService.preStudentBoardFindAll();
        log.debug("preStudentBoardList = {}", preStudentBoardList);
        
        model.addAttribute("preStudentBoardList", preStudentBoardList);
        
        return "/board/preStudentBoardList";
	}
	
	@GetMapping("/graduateBoardList.do")
	public String graduateBoardList(Model model) {
		List<BoardListDto> graduateBoardList = boardService.graduateBoardFindAll();
        log.debug("graduateBoardList = {}", graduateBoardList);
        
        model.addAttribute("graduateBoardList", graduateBoardList);
        
        return "/board/graduateBoardList";
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
