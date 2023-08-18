package com.kh.app.board.service;

import java.util.List;

import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.PostDetails;
import com.kh.app.board.entity.BoardSearchDetails;

public interface BoardService {

	List<BoardSearchDetails> findAllByKeyword(String keyword);

	List<BoardSearchDetails> findAllByMemberId(String memberId);
	
	List<BoardListDto> freeBoardFindAll();

	List<BoardListDto> preStudentBoardFindAll();

	List<BoardListDto> graduateBoardFindAll();

	BoardListDto findById(int id);

	List<BoardListDto> employeeBoardFindAll();

}
