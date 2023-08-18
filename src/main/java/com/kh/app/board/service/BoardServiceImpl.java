package com.kh.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.PostDetails;
import com.kh.app.board.entity.BoardSearchDetails;
import com.kh.app.board.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Override
	public List<BoardSearchDetails> findAllByKeyword(String keyword) {
		return boardRepository.findAllByKeyword(keyword);
	}
	
	@Override
	public List<BoardSearchDetails> findAllByMemberId(String memberId) {
		return boardRepository.findAllByMemberId(memberId);
	}
	
	public List<BoardListDto> freeBoardFindAll() {
		return boardRepository.freeBoardFindAll();
	}
	
	@Override
	public List<BoardListDto> preStudentBoardFindAll() {
		return boardRepository.preStudentBoardFindAll();
	}
	
	@Override
	public List<BoardListDto> graduateBoardFindAll() {
		return boardRepository.graduateBoardFindAll();
	}
	
	@Override
	public BoardListDto findById(int id) {
		return boardRepository.findById(id);
	}
	
	@Override
	public List<BoardListDto> employeeBoardFindAll() {
		return boardRepository.employeeBoardFindAll();
	}

}
