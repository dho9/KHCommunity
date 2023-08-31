package com.kh.app.board.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CommentReportDto;
import com.kh.app.board.dto.CreateCommentDto;
import com.kh.app.board.dto.JobKorea;
import com.kh.app.board.dto.NoticeBoardDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.dto.PostReportDto;
import com.kh.app.board.dto.StudyInfo;
import com.kh.app.board.dto.StudyList;
import com.kh.app.board.dto.StudyListDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Comment;
import com.kh.app.board.entity.CommentLike;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.board.entity.PostLike;
import com.kh.app.board.entity.Study;

public interface BoardService {

	List<BoardSearchDto> findAllByKeyword(String keyword);

	List<BoardSearchDto> findAllByMemberId(String memberId);
	
	List<BoardListDto> freeBoardFindAll(Map<String, Object> params);
	
	List<BoardListDto> marketBoardFindAll(Map<String, Object> params);
	
	List<BoardListDto> todayFoodBoardFindAll(Map<String, Object> params);

	List<BoardListDto> sharingInformationBoardFindAll(Map<String, Object> params);
	
	List<BoardListDto> askCodeBoardFindAll(Map<String, Object> params);
	
	List<BoardListDto> studyBoardFindAll(Map<String, Object> params);

	List<BoardListDto> graduateBoardFindAll(Map<String, Object> params);

	List<BoardListDto> preStudentBoardFindAll(Map<String, Object> params);
	
	List<BoardListDto> employeeBoardFindAll(Map<String, Object> params);

	Favorite findFavoriteByMemberId(int boardId, String memberId);

	int deleteFavoriteByMemberId(int boardId, String memberId);

	int insertFavoriteByMemberId(int boardId, String memberId);
	
	BoardListDto findById(int id);

	PostLike findPostLikeByMemberId(int postId, String memberId);

	int deletePostLikeByMemberId(int postId, String memberId);

	int insertPostLikeByMemberId(int postId, String memberId);

	PostLike findPostLikeCount(int postId);

	int insertBoard(BoardCreateDto board);

	int insertPostContent(BoardCreateDto board);

	Board findBoardName(int boardId);

	List<PopularBoardDto> findByPopularPost();

	
	int insertBoardNofiles(BoardCreateDto board);

	PostAttachment findAttachById(int id);

	List<BoardListDto> noticeBoardFindAll();
	
	List<BoardListDto> myClassBoardFindAll(Map<String, Object> params, int boardId);
	
	int totalCountMyClassBoard(int boardId);
	
	List<BoardListDto> myClassBoardFindAll();

	List<Comment> findByCommentByPostId(int postId);

	CommentLike findCommentLikeByMemberId(int postId, String memberId);

	int deleteCommentLikeByMemberId(int commentId, String memberId);

	int insertCommentLikeByMemberId(int commentId, String memberId);

	CommentLike findCommentLikeCount(int commentId);

	List<BoardListDto> myClassBoardFindByTag(String tag, Map<String, Object> params, int boardId);
	
	List<CommentLike> commentLikeCheckById(int postId, String memberId);

	int deleteBoard(int deletePostId);
	
	int createComment(Comment comment);
	
	List<NoticeBoardDto> findThreeNotice();

	int updatePost(BoardCreateDto board);

	int updatePostContent(BoardCreateDto board);
	
	List<BoardListDto> AllBoardFindMyarticle(String memberId, Map<String, Object> params);

	int totalCountMyarticle(String memberId);

	List<BoardListDto> AllBoardFindMycommentarticle(String memberId, Map<String, Object> params);

	int totalCountMycommentarticle(String memberId);

	List<CommentLike> commentLikeCheck(int postId);

	int insertPostReport(PostReportDto postReport);

	List<PopularBoardDto> findThreePostByBoardId(int boardId);

	int totalCountMyClassBoardByTag(String tag, int boardId);
	
	int deleteComment(int commentId);

	int checkRef(int commentId);

	int deleteCommentId(int commentId);

	List<JobKorea> getJobKoreaDatas(int page, int limit) throws IOException;

	int insertCommentReport(CommentReportDto commentReport);

	int totalCountFreeBoard();

	int totalCountMarketBoard();

	int totalCountTodayFoodBoard();

	int totalCountSharingInformationBoard();

	int totalCountAskCodeBoard();

	int totalCountStudyBoard();

	int totalCountGraduateBoard();

	int totalCountPreStudentBoard();

	int totalCountEmployeeBoard();

	List<StudyList> findAllStudy();

	int createStudy(Study study);

	int findBoarderId(Study study);

	int createBoard(Study study);

	int findByPostId();

	int updatePostId(int postId, int boardId);

	StudyListDto studyFindById(int id);

	int insertStudy(int studyId, String appliId, String appliContent);

	int checkStudy(int studyId, String appliId);

	List<StudyList> findStudyList(String memberId);
	

	List<BoardListDto> findAllByBoardId(int id);
	int findStudyId(int findId);

	int insertStudyInfo(String memberId, int findStudyId);

	List<StudyInfo> finAllStudyAppli(int findStudyId);

	Study myStudyFindById(int id);

	int updateStudyInfo(String memberId, int studyId);

	int deleteStudyInfo(String memberId, int studyId);

	int updateStudyCount(int studyId);


}
