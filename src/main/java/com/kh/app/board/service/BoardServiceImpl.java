package com.kh.app.board.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CommentReportDto;
import com.kh.app.board.dto.JobKorea;
import com.kh.app.board.dto.NoticeBoardDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.dto.PostReportDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Comment;
import com.kh.app.board.entity.CommentLike;
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
	
	public List<BoardListDto> freeBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.freeBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountFreeBoard() {
		return boardRepository.totalCountFreeBoard();
	}

	@Override
	public List<BoardListDto> marketBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.marketBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountMarketBoard() {
		return boardRepository.totalCountMarketBoard();
	}
	
	@Override
	public List<BoardListDto> todayFoodBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.todayFoodBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountTodayFoodBoard() {
		return boardRepository.totalCountTodayFoodBoard();
	}
	
	@Override
	public List<BoardListDto> sharingInformationBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.sharingInformationBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountSharingInformationBoard() {
		return boardRepository.totalCountSharingInformationBoard();
	}
	
	@Override
	public List<BoardListDto> askCodeBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.askCodeBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountAskCodeBoard() {
		return boardRepository.totalCountAskCodeBoard();
	}
	
	@Override
	public List<BoardListDto> studyBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.studyBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountStudyBoard() {
		return boardRepository.totalCountStudyBoard();
	}
	
	@Override
	public List<BoardListDto> graduateBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.graduateBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountGraduateBoard() {
		return boardRepository.totalCountGraduateBoard();
	}
	
	@Override
	public List<BoardListDto> preStudentBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.preStudentBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountPreStudentBoard() {
		return boardRepository.totalCountPreStudentBoard();
	}
	
	@Override
	public List<BoardListDto> employeeBoardFindAll(Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.employeeBoardFindAll(rowBounds);
	}
	
	@Override
	public int totalCountEmployeeBoard() {
		return boardRepository.totalCountEmployeeBoard();
	}

	@Override
	public Favorite findFavoriteByMemberId(int boardId, String memberId) {
		return boardRepository.findFavoriteByMemberId(boardId, memberId);
	}

	public BoardListDto findById(int id) {
		return boardRepository.findById(id);
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
	public PostAttachment findAttachById(int id) {
		return boardRepository.findAttachById(id);
	}


	@Override
	public List<BoardListDto> myClassBoardFindAll(Map<String, Object> params, int boardId) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.myClassBoardFindAll(rowBounds, boardId);
	}
	
	@Override
	public int totalCountMyClassBoard(int boardId) {
		return boardRepository.totalCountMyClassBoard(boardId);
	}

	@Override
	public List<Comment> findByCommentByPostId(int postId) {
		// TODO Auto-generated method stub
		return boardRepository.findByCommentByPostId(postId);
	}

	@Override
	public CommentLike findCommentLikeByMemberId(int commentId, String memberId) {
		return boardRepository.findCommentLikeByMemberId(commentId,memberId);
	}
	@Override
	public int deleteCommentLikeByMemberId(int commentId, String memberId) {
		// TODO Auto-generated method stub
		return boardRepository.deleteCommentLikeByMemberId(commentId,memberId);
	}
	@Override
	public int insertCommentLikeByMemberId(int commentId, String memberId) {
		// TODO Auto-generated method stub
		return boardRepository.insertCommentLikeByMemberId(commentId,memberId);
	}
	@Override
	public CommentLike findCommentLikeCount(int commentId) {
		// TODO Auto-generated method stub
		return boardRepository.findCommentLikeCount(commentId);
	}
	
	@Override
	public List<BoardListDto> myClassBoardFindByTag(String tag, Map<String, Object> params, int boardId) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.myClassBoardFindByTag(tag, rowBounds, boardId);
	}
	
	@Override
	public List<CommentLike> commentLikeCheckById(int postId, String memberId) {
		// TODO Auto-generated method stub
		return boardRepository.CommentLikeCheckById(postId,memberId);
	}
	@Override
	public int createComment(Comment comment) {
		// TODO Auto-generated method stub
		return boardRepository.createComment(comment);
	}
	@Override
	public int deleteBoard(int deletePostId) {
		return boardRepository.deleteBoard(deletePostId);
	}
	
	public List<NoticeBoardDto> findThreeNotice() {
		// TODO Auto-generated method stub
		return boardRepository.findThreeNotice();
	}

	@Override
	public List<BoardListDto> myClassBoardFindAll() {
		return boardRepository.myClassBoardFindAll();
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePost(BoardCreateDto board) {
		int result = 0;
		result = boardRepository.updatePost(board);
		
		List<PostAttachment> attachments = board.getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(PostAttachment attach : attachments) {
				attach.setPostId(board.getPostId());
				result = boardRepository.deletePostAttach(attach);
				result = boardRepository.insertPostAttach(attach);
			}
		}
		
		
		return result;
	}
	
	@Override
	public int updatePostContent(BoardCreateDto board) {
		return boardRepository.updatePostContent(board);
	}
	
	@Override
	public List<BoardListDto> AllBoardFindMyarticle(String memberId, Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.AllBoardFindMyarticle(memberId, rowBounds);
	}
	
	@Override
	public int totalCountMyarticle(String memberId) {
		// TODO Auto-generated method stub
		return boardRepository.totalCountMyarticle(memberId);
	}
	@Override
	public List<BoardListDto> AllBoardFindMycommentarticle(String memberId, Map<String, Object> params) {
		int limit = (int) params.get("limit");
		int page = (int) params.get("page");
		int offset = (page - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return boardRepository.AllBoardFindMycommentarticle(memberId,rowBounds);
	}
	@Override
	public int totalCountMycommentarticle(String memberId) {
		// TODO Auto-generated method stub
		return boardRepository.totalCountMycommentarticle(memberId);
	}
	@Override
	public List<CommentLike> commentLikeCheck(int postId) {
		// TODO Auto-generated method stub
		return boardRepository.commentLikeCheck(postId);
	}
	
	@Override
	public int insertPostReport(PostReportDto postReport) {
		return boardRepository.insertPostReport(postReport);
	}
	
	@Override
	public int insertCommentReport(CommentReportDto commentReport) {
		return boardRepository.insertCommentReport(commentReport);
	}
	
	@Override
	public List<PopularBoardDto> findThreePostByBoardId(int boardId) {
		return boardRepository.findThreePostByBoardId(boardId);
	}
	
	@Override
	public List<BoardListDto> jobSearchBoardFindAll() {
		return boardRepository.jobSearchBoardFindAll();
	}
	
	@Override
	public int totalCountMyClassBoardByTag(String tag, int boardId) {
		return boardRepository.totalCountMyClassBoardByTag(tag, boardId);
	}
	
	@Override
	public int deleteComment(int commentId) {
		// TODO Auto-generated method stub
		return boardRepository.deleteComment(commentId);
	}
	@Override
	public int checkRef(int commentId) {
		// TODO Auto-generated method stub
		return boardRepository.checkRef(commentId);
	}
	
	@Override
	public int deleteCommentId(int commentId) {
		// TODO Auto-generated method stub
		return boardRepository.deleteCommentId(commentId);
	}
	
	private static String BASE_URL = "https://www.jobkorea.co.kr";
	private static String URL = "https://www.jobkorea.co.kr/Search/?stext=%EA%B0%9C%EB%B0%9C%EC%9E%90";
	@Override
	public List<JobKorea> getJobKoreaDatas(int page, int limit) throws IOException {
		List<JobKorea> jobKoreaList = new ArrayList<>();
		
		Document document = Jsoup.connect(URL + "&page=" + page).get();
	    Elements contents = document.select(".post");
	    
	    int startIndex = (page - 1) * limit;
	    int endIndex = Math.min(startIndex + limit, contents.size());

	    for (int i = startIndex; i < endIndex; i++) {
	        Element content = contents.get(i);
	        
	        String href = content.select(".post-list-corp .name").attr("href");
	        String fullUrl = BASE_URL + href;
	        
	        JobKorea jobKorea = JobKorea.builder()
	                            .company(content.select(".post-list-corp .name").text())
	                            .title(content.select(".post-list-info .title").text())
	                            .option(content.select(".post-list-info .option").text())
	                            .etc(content.select(".post-list-info .etc").text())
	                            .url(fullUrl)
	                            .build();
	        
	        jobKoreaList.add(jobKorea);
	    }
	    
	    return jobKoreaList;
	}
	
}

