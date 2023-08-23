package com.kh.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CreateCommentDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostAttachment;
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
	public List<BoardListDto> noticeBoardFindAll() {
		return boardRepository.noticeBoardFindAll();
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
	public int insertBoardNofiles(BoardCreateDto board) {
		return boardRepository.insertBoardNofiles(board);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(BoardCreateDto board) {
		int result = 0;
		
		result = boardRepository.insertBoard(board);
		
		List<PostAttachment> attachments = board.getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(PostAttachment attach : attachments) {
				attach.setPostId(board.getPostId());
				result = boardRepository.insertPostAttach(attach);
			}
		}
		
		return result;
	}
	
	@Override
	public int insertPostContent(BoardCreateDto board) {
		return boardRepository.insertPostContent(board);
	}
	
	@Override
	public Board findBoardName(int boardId) {
		return boardRepository.findBoardName(boardId);
	}
	@Override
	public List<PopularBoardDto> findByPopularPost() {
		return boardRepository.findByPopularPost();
	}
	
	@Override
	public int createComment(CreateCommentDto comment, String memberId) {
		// TODO Auto-generated method stub
		return boardRepository.createComment(comment,memberId);
	}
	
	@Override
	public PostAttachment findAttachById(int id) {
		return boardRepository.findAttachById(id);
	}

	@Override
	public List<BoardListDto> sharingInformationBoardFindAll() {
		return boardRepository.sharingInformationBoardFindAll();
	}
	
	
}

