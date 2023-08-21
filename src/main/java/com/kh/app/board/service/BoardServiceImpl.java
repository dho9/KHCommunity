package com.kh.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostLike;
import com.kh.app.board.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Override
	public List<BoardSearchDto> findAllByKeyword(String keyword) {
		return boardRepository.findAllByKeyword(keyword);
	}
	
	@Override
	public List<BoardSearchDto> findAllByMemberId(String memberId) {
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
	public Favorite findFavoriteByMemberId(int boardId, String memberId) {
		return boardRepository.findFavoriteByMemberId(boardId, memberId);
	}
	
	public BoardListDto findById(int id) {
		return boardRepository.findById(id);
	}
	
	@Override
	public List<BoardListDto> employeeBoardFindAll() {
		return boardRepository.employeeBoardFindAll();
	}

	@Override
	public int deleteFavoriteByMemberId(int boardId, String memberId) {
		return boardRepository.deleteFavoriteByMemberId(boardId, memberId);
	}
	
	@Override
	public int insertFavoriteByMemberId(int boardId, String memberId) {
		return boardRepository.insertFavoriteByMemberId(boardId, memberId);
	}
	
	@Override
	public PostLike findPostLikeByMemberId(int postId, String memberId) {
		return boardRepository.findPostLikeByMemberId(postId, memberId);
	}
	
	@Override
	public int deletePostLikeByMemberId(int postId, String memberId) {
		return boardRepository.deletePostLikeByMemberId(postId, memberId);
	}
	
	@Override
	public int insertPostLikeByMemberId(int postId, String memberId) {
		return boardRepository.insertPostLikeByMemberId(postId, memberId);
	}
	
	@Override
	public PostLike findPostLikeCount(int postId) {
		return boardRepository.findPostLikeCount(postId);
	}
	@Override
	public int insertBoard(BoardCreateDto board) {
		return boardRepository.insertBoard(board);
	}
	
	@Override
	public int insertPostContent(BoardCreateDto board) {
		return boardRepository.insertPostContent(board);
	}
	
	@Override
	public Board findBoardName(int boardId) {
		return boardRepository.findBoardName(boardId);
	}
}
