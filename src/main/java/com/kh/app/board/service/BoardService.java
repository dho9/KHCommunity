package com.kh.app.board.service;

import java.util.List;

import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.entity.BoardSearchDetails;

public interface BoardService {

	List<BoardSearchDetails> findAllByKeyword(String keyword);

	List<BoardListDto> freeBoardFindAll();

	List<BoardListDto> preStudentBoardFindAll();

	List<BoardListDto> graduateBoardFindAll();

}
