package com.kh.app.board.service;

import java.util.List;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CreateCommentDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Comment;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.board.entity.PostLike;

public interface BoardService {

	List<BoardSearchDto> findAllByKeyword(String keyword);

	List<BoardSearchDto> findAllByMemberId(String memberId);
	
	List<BoardListDto> freeBoardFindAll();

	List<BoardListDto> preStudentBoardFindAll();

	List<BoardListDto> graduateBoardFindAll();

	Favorite findFavoriteByMemberId(int boardId, String memberId);

	int deleteFavoriteByMemberId(int boardId, String memberId);

	int insertFavoriteByMemberId(int boardId, String memberId);
	
	BoardListDto findById(int id);

	List<BoardListDto> employeeBoardFindAll();

	PostLike findPostLikeByMemberId(int postId, String memberId);

	int deletePostLikeByMemberId(int postId, String memberId);

	int insertPostLikeByMemberId(int postId, String memberId);

	PostLike findPostLikeCount(int postId);

	int insertBoard(BoardCreateDto board);

	int insertPostContent(BoardCreateDto board);

	Board findBoardName(int boardId);

	List<PopularBoardDto> findByPopularPost();

	int createComment(CreateCommentDto comment, String memberId);
	int insertBoardNofiles(BoardCreateDto board);

	PostAttachment findAttachById(int id);

	List<BoardListDto> sharingInformationBoardFindAll();

	List<BoardListDto> myClassBoardFindAll();

	List<Comment> findByCommentByPostId(int postId);

}
