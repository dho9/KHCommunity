package com.kh.app.board.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CommentReportDto;
import com.kh.app.board.dto.CreateCommentDto;
import com.kh.app.board.dto.JobKorea;
import com.kh.app.board.dto.NoticeBoardDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.dto.PostReportDto;
import com.kh.app.board.dto.StudyList;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Comment;
import com.kh.app.board.entity.CommentLike;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.board.entity.PostLike;
import com.kh.app.board.entity.Study;
import com.kh.app.board.service.BoardService;
import com.kh.app.common.HelloSpringUtils;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.service.MemberService;

import lombok.Builder;
import lombok.extern.slf4j.Slf4j;

/**
 * @author o0o_m
 *
 */
@Controller
@Slf4j
@RequestMapping("/board")
@Transactional
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private ResourceLoader resourceLoader;
	
	@Value("${spring.servlet.multipart.location}")
	private String multipartLocation;
	
	@GetMapping("/freeBoardList.do")
	public String freeBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		List<BoardListDto> freeBoardLists = boardService.freeBoardFindAll(params);
		
	    int totalCount = boardService.totalCountFreeBoard();

	    // totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);

	    model.addAttribute("freeBoardLists", freeBoardLists);
	    model.addAttribute("totalPages", totalPages);
	    
		return "/board/freeBoardList";
	}
	
	@GetMapping("/marketBoardList.do")
	public String marketBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		List<BoardListDto> marketBoardLists = boardService.marketBoardFindAll(params);
		
		int totalCount = boardService.totalCountMarketBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);

		model.addAttribute("marketBoardLists", marketBoardLists);

		return "/board/marketBoardList";
	}

	@GetMapping("/todayFoodBoardList.do")
	public String todayFoodBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		List<BoardListDto> todayFoodBoardList = boardService.todayFoodBoardFindAll(params);
		
		int totalCount = boardService.totalCountTodayFoodBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);
        
        model.addAttribute("todayFoodBoardList", todayFoodBoardList);
        
        return "/board/todayFoodBoardList";
	}

	@GetMapping("/sharingInformationBoardList.do")
	public String sharingInformationBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		
		List<BoardListDto> sharingInformationBoardList = boardService.sharingInformationBoardFindAll(params);
		int totalCount = boardService.totalCountSharingInformationBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);

		model.addAttribute("sharingInformationBoardList", sharingInformationBoardList);

		return "/board/sharingInformationBoardList";
	}

	@GetMapping("/askCodeBoardList.do")
	public String askCodeBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		List<BoardListDto> askCodeBoardList = boardService.askCodeBoardFindAll(params);
		
		int totalCount = boardService.totalCountAskCodeBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);


		model.addAttribute("askCodeBoardList", askCodeBoardList);

		return "/board/askCodeBoardList";
	}

//	@GetMapping("/studyBoardList.do")
//	public String studyBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
//		int limit = 6;
//		Map<String, Object> params = Map.of(
//				"page", page,
//				"limit", limit
//		);
//		List<BoardListDto> studyBoardList = boardService.studyBoardFindAll(params);
//		
//		int totalCount = boardService.totalCountStudyBoard();
//		
//		// totalPages 계산
//	    int totalPages = (int) Math.ceil((double) totalCount / limit);
//	    model.addAttribute("totalPages", totalPages);
//
//        
//        model.addAttribute("studyBoardList", studyBoardList);
//        
//        return "/board/studyBoardList";
//	}

	@GetMapping("/graduateBoardList.do")
	public String graduateBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		List<BoardListDto> graduateBoardList = boardService.graduateBoardFindAll(params);
		
		int totalCount = boardService.totalCountGraduateBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);

		model.addAttribute("graduateBoardList", graduateBoardList);

		return "/board/graduateBoardList";
	}
	
	@GetMapping("/preStudentBoardList.do")
	public String preStudentBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		List<BoardListDto> preStudentBoardList = boardService.preStudentBoardFindAll(params);
		
		int totalCount = boardService.totalCountPreStudentBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);

		model.addAttribute("preStudentBoardList", preStudentBoardList);

		return "/board/preStudentBoardList";
	}


	@GetMapping("/employeeBoardList.do")
	public String employeeBoardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int limit = 6;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		List<BoardListDto> employeeBoardList = boardService.employeeBoardFindAll(params);
		
		int totalCount = boardService.totalCountEmployeeBoard();
		
		// totalPages 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    model.addAttribute("totalPages", totalPages);


		model.addAttribute("employeeBoardList", employeeBoardList);

		return "/board/employeeBoardList";
	}

	@GetMapping("/noticeBoardList.do")
	public String noticeBoardList(Model model) {
		List<BoardListDto> noticeBoardLists = boardService.noticeBoardFindAll();

		model.addAttribute("noticeBoardLists", noticeBoardLists);

		return "/board/noticeBoardList";
	}


	/**
	 * index.jsp에서 제목 + 게시글 검색
	 * @param keyword
	 * @param model
	 * @return
	 */
	@GetMapping("/boardSearch.do")
	public String boardSearch(@RequestParam String keyword, Model model) {
		List<BoardSearchDto> boards = boardService.findAllByKeyword(keyword);
		//log.debug("boards = {}", boards);
		//log.debug("keyword = {}", keyword);
		model.addAttribute("boards", boards);
		model.addAttribute("keyword", keyword);
		System.out.println(boards);
		return "/board/boardListByKeyword";
	}

	/**
	 * 내 즐겨찾기
	 * @param principal
	 * @return
	 */
	@GetMapping("/myBoards.do")
	public ResponseEntity<?> myBoards(@AuthenticationPrincipal MemberDetails principal) {
			
			String memberId = principal.getMemberId();
			List<BoardSearchDto> boards = boardService.findAllByMemberId(memberId);
			//log.debug("boards = {}", boards);
			return ResponseEntity
					.status(HttpStatus.OK)
					.body(Map.of("boards", boards));
		
	}

	/**
	 * 즐겨찾기 했는지 안했는지
	 * @param principal
	 * @param _boardId
	 * @return
	 */
	@GetMapping("/favorite.do")
	public ResponseEntity<?> isFavorite(@AuthenticationPrincipal MemberDetails principal, @RequestParam String _boardId) {
		String memberId = principal.getMemberId();
		int boardId = Integer.parseInt(_boardId);

		Favorite favorite = boardService.findFavoriteByMemberId(boardId, memberId);
		//log.debug("favorite = {}", favorite);

		boolean available = true;
		if(favorite == null)
			available = false;
		//log.debug("availalbe = {}", available);

		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("available", available));
	}

	/**
	 * 즐겨찾기 기능
	 * @param principal
	 * @param _boardId
	 * @return
	 */
	@PostMapping("/favorite.do")
	public ResponseEntity<?> favorite(@AuthenticationPrincipal MemberDetails principal, @RequestParam String _boardId) {
		String memberId = principal.getMemberId();
		int boardId = Integer.parseInt(_boardId);

		Favorite favorite = boardService.findFavoriteByMemberId(boardId, memberId);
		//log.debug("favorite = {}", favorite);

		boolean available = true;
		if(favorite == null)
			available = false;
		//log.debug("availalbe = {}", available);

		int result = 0;
		if(available) {
			result = boardService.deleteFavoriteByMemberId(boardId, memberId);
		}
		else {
			result = boardService.insertFavoriteByMemberId(boardId, memberId);
		}

		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("available", available));
	}

	/**
	 * 게시글조회
	 * @param id
	 * @param model
	 */
	@GetMapping("/boardDetail.do")
	public void boardDetail(@RequestParam int id, Model model) {
		BoardListDto postDetail = boardService.findById(id);
		//log.debug("postDetail = {}", postDetail);

		Board board = boardService.findBoardName(postDetail.getBoardId());
		log.debug("boardddddddddddd={}",board);
		//log.debug("boardddddddddddd={}",postDetail);
		PostAttachment postAttach = boardService.findAttachById(id);
		model.addAttribute("postDetail", postDetail);
		model.addAttribute("board",board );
//		System.out.println(board);
		model.addAttribute("postAttach",postAttach);
	}


	/**
	 * 해당 게시물에 공감(좋아요) 했는지 안했는지
	 * @param principal
	 * @param _postId
	 * @return
	 */
	@GetMapping("/postLike.do")
	public ResponseEntity<?> isPostLike(@AuthenticationPrincipal MemberDetails principal, @RequestParam String _postId) {
		String memberId = principal.getMemberId();
		int postId = Integer.parseInt(_postId);

		PostLike postLike = boardService.findPostLikeByMemberId(postId, memberId);
		//log.debug("postLike = {}", postLike);

		boolean available = true;
		if(postLike == null)
			available = false;
		//log.debug("availalbe = {}", available);

		PostLike likeCount = boardService.findPostLikeCount(postId);
		//log.debug("likeCount = {}", likeCount);

		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("available", available, "likeCount", likeCount));
	}

	/**
	 * 해당 게시물에 좋아요(공감) 기능
	 * @param principal
	 * @param _postId
	 * @return
	 */
	@PostMapping("/postLike.do")
	public ResponseEntity<?> postLike(@AuthenticationPrincipal MemberDetails principal, @RequestParam String _postId) {
		String memberId = principal.getMemberId();
		int postId = Integer.parseInt(_postId);

		PostLike postLike = boardService.findPostLikeByMemberId(postId, memberId);
		//log.debug("postLike = {}", postLike);

		boolean available = true;
		if(postLike == null)
			available = false;
		//log.debug("availalbe = {}", available);

		int result = 0;
		if(available) {
			result = boardService.deletePostLikeByMemberId(postId, memberId);
		}
		else {
			result = boardService.insertPostLikeByMemberId(postId, memberId);
		}

		PostLike likeCount = boardService.findPostLikeCount(postId);
		//log.debug("postLikeCount = {}", likeCount);

		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("available", available, "likeCount", likeCount));
	}

	/**
	 * 글작성
	 * @return
	 */
	@PostMapping("/createPost.do")
	public String boardCreate(
			@RequestParam String title,
			@RequestParam String text,
			@RequestParam int boardId,
			@RequestParam(required = false) String grade,
			@RequestParam(required = false) boolean anonymousCheck,
			@RequestParam(required = false) String[] _tags,
			@AuthenticationPrincipal MemberDetails member,
			@RequestParam(value = "file", required = false) List<MultipartFile> files) throws IllegalStateException, IOException{
		log.info("!!!!!!!!!!!!!!!!!!!!!!!!!", boardId);
		//log.debug("loginMember = {}", member);
		List<String> tags = _tags != null ? Arrays.asList(_tags) : null; 

		// 1. 파일저장
		int result = 0;
		List<PostAttachment> attachments = new ArrayList<>(); 
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				String renamedFilename = HelloSpringUtils.getRenameFilename(originalFilename); // 20230807_142828888_123.jpg
				File destFile = new File(renamedFilename); // 부모디렉토리 생략가능. spring.servlet.multipart.location 값을 사용
				file.transferTo(destFile);	

				PostAttachment attach = 
						PostAttachment.builder()
						.postOriginalFilename(originalFilename)
						.postRenamedFilename(renamedFilename)
						.boardId(boardId)
						.build();

				attachments.add(attach);
			}
		}
			
			BoardCreateDto board = null;
			
			if(grade == null || grade.equals("")) {
				board = BoardCreateDto.builder()
						.title(title)
						.content(text)
						.boardId(boardId)
						.memberId(member.getMemberId())
						.tags(tags)
						.attachments(attachments)
						.anonymousCheck(anonymousCheck)
						.build();
				
			} else {
				String realGrade = " [평점 : " + grade + "]";
				board = BoardCreateDto.builder()
						.title(title + realGrade)
						.content(text)
						.boardId(boardId)
						.memberId(member.getMemberId())
						.tags(tags)
						.attachments(attachments)
						.anonymousCheck(anonymousCheck)
						.build();
			}
		
		if(board.getAttachments().isEmpty() || board.getAttachments() == null) {
			result = boardService.insertBoardNofiles(board);
		}else {
			result = boardService.insertBoard(board);
		}
		result = boardService.insertPostContent(board);
		
		return "redirect:/board/boardDetail.do?id=" + board.getPostId();

	}
	
	/**
	 * 글 수정
	 * @param title
	 * @param text
	 * @param boardId
	 * @param grade
	 * @param anonymousCheck
	 * @param _tags
	 * @param member
	 * @param files
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping("/updatePost.do")
	public String updatePost(
			@RequestParam String title,
			@RequestParam String text,
			@RequestParam int boardId,
			@RequestParam int postId,
			@RequestParam(required = false) String grade,
			@RequestParam(required = false) boolean anonymousCheck,
			@RequestParam(required = false) String[] _tags,
			@AuthenticationPrincipal MemberDetails member,
			@RequestParam(value = "file", required = false) List<MultipartFile> files) throws IllegalStateException, IOException {
		
		List<String> tags = _tags != null ? Arrays.asList(_tags) : null; 
		BoardCreateDto board = null;
		int result = 0;
		
		List<PostAttachment> attachments = new ArrayList<>(); 
		if(files != null) {
			
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					String originalFilename = file.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenameFilename(originalFilename); // 20230807_142828888_123.jpg
					File destFile = new File(renamedFilename); // 부모디렉토리 생략가능. spring.servlet.multipart.location 값을 사용
					file.transferTo(destFile);	
					
					PostAttachment attach = 
							PostAttachment.builder()
							.postOriginalFilename(originalFilename)
							.postRenamedFilename(renamedFilename)
							.boardId(boardId)
							.postId(postId)
							.build();
					
					attachments.add(attach);
				}
			}
		}
		
		if(grade == null || grade.equals("")) {
			board = BoardCreateDto.builder()
					.postId(postId)
					.title(title)
					.content(text)
					.boardId(boardId)
					.memberId(member.getMemberId())
					.tags(tags)
					.attachments(attachments) 
					.anonymousCheck(anonymousCheck)
					.build();
			
		} else {
			String realGrade = " [평점 : " + grade + "]";
			board = BoardCreateDto.builder()
					.postId(postId)
					.title(title + realGrade)
					.content(text)
					.boardId(boardId)
					.memberId(member.getMemberId())
					.tags(tags)
					.attachments(attachments)
					.anonymousCheck(anonymousCheck)
					.build();
		}
		result = boardService.updatePost(board);
		result = boardService.updatePostContent(board);
		
		return "redirect:/board/boardDetail.do?id=" + board.getPostId();
	}
	


	@GetMapping("/popularPost.do")
	@ResponseBody
	public List<PopularBoardDto> popularPost() {
		List<PopularBoardDto> post = boardService.findByPopularPost();
		log.debug("post = {}",post);
		//	    model.addAttribute("post", post);
		return post;
	}

	@GetMapping("/noticeBoard.do")
	@ResponseBody
	public List<NoticeBoardDto> noticeBoard() {
		List<NoticeBoardDto> post = boardService.findThreeNotice();
		log.debug("post = {}", post);
		return post;
	}
	
	@PostMapping("/createComment.do")
	public ResponseEntity<?> createComment(
	        @Valid CreateCommentDto _comment, BindingResult bindingResult, @AuthenticationPrincipal MemberDetails member) {
	    log.debug("commentttttttttttt={}", _comment);
	    
	    if (bindingResult.hasErrors()) { // 유효성 검사 에러가 있는 경우
	        return ResponseEntity
	                .status(HttpStatus.BAD_REQUEST)
	                .body("댓글 또는 대댓글 내용이 유효하지 않습니다.");
	    }
	    
	    if (member != null && _comment.getCommentRef() != null && !_comment.getCommentRef().isEmpty()) {
	        // 대댓글용
	        int ref = Integer.parseInt(_comment.getCommentRef()); 
	        Comment comment = Comment.builder()
	                .postId(_comment.getPostId())
	                .boardId(_comment.getBoardId())
	                .memberId(member.getMemberId())
	                .commentContent(_comment.getCommentContent())
	                .commentLevel(2)
	                .commentRef(ref)
	                .anonymousCheck(_comment.isAnonymousCheck()).build();
	        int result = boardService.createComment(comment);
	        return ResponseEntity
	                .status(HttpStatus.OK).body(null);
	    } else if (member != null && (_comment.getCommentRef() == null || _comment.getCommentRef().isEmpty())) {
	        // 댓글용
	        Comment comment = Comment.builder()
	                .postId(_comment.getPostId())
	                .boardId(_comment.getBoardId())
	                .memberId(member.getMemberId())
	                .commentContent(_comment.getCommentContent())
	                .commentLevel(1)
	                .commentRef(0)
	                .anonymousCheck(_comment.isAnonymousCheck()).build();
	        int result = boardService.createComment(comment);
	        return ResponseEntity
	                .status(HttpStatus.OK).body(null);
	    } else {
	        return ResponseEntity
	                .status(HttpStatus.OK).body("댓글 작성에 실패했습니다.");
	    }
	}




	@PostMapping("/loadComment.do")
	@ResponseBody
	public List<Comment> commentList(@RequestParam int postId, @AuthenticationPrincipal MemberDetails principal, Model model){
		log.debug("idddddddddddd = {}",postId);
		//		//log.debug("idddddddddddd = {}",postId);
		List<Comment> comments = boardService.findByCommentByPostId(postId);
		model.addAttribute("memberId", principal.getMemberId());

		return comments;

	}

	@GetMapping("/myClassBoardList.do")
	public String myClassBoardList(
			@AuthenticationPrincipal MemberDetails principal,
			@Valid StudentMypageInfoDto studentInfo,
			Model model
			) {
		studentInfo = memberService.findByMemberInfo(principal.getMemberId());
//        log.info("studentInfo = {}", studentInfo);
		model.addAttribute("studentInfo", studentInfo);
		model.addAttribute("authority", principal.getAuthorities());
        
        return "/board/myClassBoardList";
	}

	@PostMapping("/myClassBoardList.do")
	@ResponseBody
	public ResponseEntity<?> myClassBoardList(@RequestParam(defaultValue = "1") int page, @RequestParam String tag, @RequestParam int boardId) {
		// 페이징
		int limit = 8;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		// 게시글 전체 수
		int totalCount = boardService.totalCountMyClassBoardByTag(tag, boardId);
		
		// totalPage 계산
		int totalPages = (int) Math.ceil((double) totalCount / limit);
		List<BoardListDto> myClassBoardList = boardService.myClassBoardFindByTag(tag, params, boardId);
		log.info("myClassBoardList ={}", myClassBoardList);
		log.info("totalPages = {}", totalPages);
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("board", myClassBoardList, "currentPage", page, "totalPages", totalPages));
	}

	@GetMapping("/myClassBoardFindAll.do")
	public ResponseEntity<?> myClassBoardFindAll(@RequestParam(defaultValue = "1") int page, @RequestParam int boardId) {
		// 페이징
		int limit = 8;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		// 게시글 전체 수
		int totalCount = boardService.totalCountMyClassBoard(boardId);
		
		// totalPage 계산
		int totalPages = (int) Math.ceil((double) totalCount / limit);
		List<BoardListDto> myClassBoardList = boardService.myClassBoardFindAll(params, boardId);
		
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("board", myClassBoardList, "currentPage", page, "totalPages", totalPages));
	}


	@GetMapping("/commentLike.do")
	@ResponseBody
	public ResponseEntity<?> isCommentLike(@AuthenticationPrincipal MemberDetails principal, @RequestParam String _postId) {
		String memberId = principal.getMemberId();
		int postId = Integer.parseInt(_postId);
		List<CommentLike> commentLike = boardService.commentLikeCheckById(postId, memberId);
		
		List<Comment> commentLikeCheck = boardService.findByCommentByPostId(postId);
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("commentLike", commentLike,"commentLikeCheck",commentLikeCheck));
	}

	@PostMapping("/commentLike.do")
	public ResponseEntity<?> commentLike(@AuthenticationPrincipal MemberDetails principal, @RequestParam int commentId) {
		String memberId = principal.getMemberId();

		CommentLike commentLike = boardService.findCommentLikeByMemberId(commentId, memberId);
		log.debug("commentLike = {}", commentLike);

		boolean available = true;
		if(commentLike == null)
			available = false;

		int result = 0;
		if(available) {
			result = boardService.deleteCommentLikeByMemberId(commentId, memberId);
			log.debug("availalbe = {}", available);
		}
		else {
			result = boardService.insertCommentLikeByMemberId(commentId, memberId);
			log.debug("availalbe = {}", available);
		}

		CommentLike likeCount = boardService.findCommentLikeCount(commentId);
		log.debug("likeCount = {}", likeCount);

		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("available", available, "likeCount", likeCount));
	}
	
	@PostMapping("/boardDelete.do")
	public String boardDelete (
			@RequestParam int deletePostId,
			@RequestParam String postBoardLink
			) {
		int result = boardService.deleteBoard(deletePostId); 
		log.debug("보드링크={}",postBoardLink);
		log.debug("포스트아이디={}",deletePostId);
		return "redirect:/board/" + postBoardLink + ".do";
	}
	
	@GetMapping("/myClassBoardDetail.do")
	public void myClassBoardDetail(
			@RequestParam int id,
			@AuthenticationPrincipal MemberDetails principal,
			@Valid StudentMypageInfoDto studentInfo,
			Model model) {
		BoardListDto postDetail = boardService.findById(id);
//		log.info("postDetail = {}", postDetail);
		PostAttachment postAttach = boardService.findAttachById(id);
//		log.info("postAttach = {}", postAttach);
		List<Comment> comments = boardService.findByCommentByPostId(id);
//		log.info("comments = {}", comments);
		studentInfo = memberService.findByMemberInfo(principal.getMemberId());
//	    log.info("studentInfo = {}", studentInfo);
		
		model.addAttribute("studentInfo", studentInfo);
		model.addAttribute("postDetail", postDetail);
		model.addAttribute("postAttach", postAttach);
		model.addAttribute("comments", comments);
		
	
	}
	
	@GetMapping("/fileDownload.do")
	@ResponseBody
	public Resource fileDownload(@RequestParam int id, HttpServletResponse response) throws FileNotFoundException {
		PostAttachment attach = boardService.findAttachById(id);
//		log.debug("attach = {}, ", attach);
//		log.debug("multipartLocation = {}", multipartLocation);
		
		File downFile = new File(multipartLocation, attach.getPostRenamedFilename());
		
		if(!downFile.exists())
			throw new FileNotFoundException(attach.getPostRenamedFilename());
		String location = "file:" + downFile;
		Resource resource = resourceLoader.getResource(location);
		
		response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
		String filename = URLEncoder.encode(attach.getPostOriginalFilename());
		response.addHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename);
		return resource;
	}
	
	@GetMapping("myarticle.do")
	public String myarticle(@AuthenticationPrincipal MemberDetails principal, Model model,@RequestParam(defaultValue = "1") int page) {
//		log.debug("myarticleList={}",myarticleList);
		   int limit = 6;
			Map<String, Object> params = Map.of(
					"page", page,
					"limit", limit
			);
			List<BoardListDto> myarticleList = boardService.AllBoardFindMyarticle(principal.getMemberId(),params);
			
		    int totalCount = boardService.totalCountMyarticle(principal.getMemberId());

		    // total학생 계산
		    int totalPages = (int) Math.ceil((double) totalCount / limit);
		    model.addAttribute("totalPages", totalPages);
			
			model.addAttribute("myarticle",myarticleList);
			
		return "/board/myarticle";
	}
	
	@GetMapping("mycommentarticle.do")
	public String mycommentarticle(@AuthenticationPrincipal MemberDetails principal, Model model,@RequestParam(defaultValue = "1") int page) {
//		log.debug("myarticleList={}",myarticleList);
		   int limit = 6;
			Map<String, Object> params = Map.of(
					"page", page,
					"limit", limit
			);
			List<BoardListDto> mycommentarticle = boardService.AllBoardFindMycommentarticle(principal.getMemberId(),params);
			log.debug("sdsdsdsdsdsdsd={}",mycommentarticle);
		    int totalCount = boardService.totalCountMycommentarticle(principal.getMemberId());
		    log.debug("토탈카운트에요.={}",totalCount);
		    int totalPages = (int) Math.ceil((double) totalCount / limit);
		    model.addAttribute("totalPages", totalPages);
			model.addAttribute("comment",mycommentarticle);
			
		return "/board/mycommentarticle";
	}
	
	@PostMapping("/createMyClassBoardComment.do")
	public String createMyClassBoardComment(CreateCommentDto _comment, @AuthenticationPrincipal MemberDetails member, Model model) {
		log.debug("_comment = {}", _comment);
		if(member != null &&_comment.getCommentRef()==""){ //댓글용
			Comment comment = Comment.builder()  
					.postId(_comment.getPostId())
					.boardId(_comment.getBoardId())
					.memberId(member.getMemberId())
					.commentContent(_comment.getCommentContent())
					.commentLevel(1)
					.commentRef(0)
					.anonymousCheck(_comment.isAnonymousCheck()).build();
			int result = boardService.createComment(comment);
		}
		
		if(member != null &&_comment.getCommentRef()!="" ) {//대댓글용
			int ref = Integer.parseInt(_comment.getCommentRef()); 
			Comment comment = Comment.builder()  
					.postId(_comment.getPostId())
					.boardId(_comment.getBoardId())
					.memberId(member.getMemberId())
					.commentContent(_comment.getCommentContent())
					.commentLevel(2)
					.commentRef(ref)
					.anonymousCheck(_comment.isAnonymousCheck()).build();
			int result = boardService.createComment(comment);
		}
		
		List<Comment> comments = boardService.findByCommentByPostId(_comment.getPostId());
		model.addAttribute("comments", comments);
		
		return "redirect:/board/myClassBoardDetail.do?id=" + _comment.getPostId();
	}
	
	@PostMapping("postReport.do")
	public String postReport(
			@RequestParam(required = false) int reportPostId,
			@RequestParam(required = false, defaultValue = "0") int reportCommentId,
			@RequestParam String reporterId,
			@RequestParam String attackerId,
			@RequestParam String reportType,
			@RequestParam String reportContent
			) {
		int result = 0;
		System.out.println("reportPostId = " + reportPostId);
		System.out.println("reportCommentId = " + reportCommentId);
		System.out.println("reporterId = " + reporterId);
		System.out.println("attackerId = " + attackerId);
		System.out.println("reportType = " + reportType);
		System.out.println("reportContent = " + reportContent);
		
		
		if(reportCommentId != 0) {
			CommentReportDto commentReport = CommentReportDto.builder()
					.commentId(reportCommentId)
					.reporterId(reporterId)
					.attackerId(attackerId)
					.reportType(reportType)
					.reportContent(reportContent)
					.build();
			result = boardService.insertCommentReport(commentReport);
		}else {
			PostReportDto postReport = PostReportDto.builder()
					.postId(reportPostId)
					.reporterId(reporterId)
					.attackerId(attackerId)
					.reportType(reportType)
					.reportContent(reportContent)
					.build();
			result = boardService.insertPostReport(postReport);
		}
		
		
		return "redirect:/board/boardDetail.do?id="+ reportPostId;
	}
	
	 @GetMapping("/jobSearchBoardList.do") 
	 public String jobSearchBoardList(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws IOException { 
	    int limit = 8;
		List<JobKorea> jobKoreaList = boardService.getJobKoreaDatas(page, limit);
		
		// 전체 게시글 수를 가져오는 로직을 구현해야 합니다.
	    int totalCount = 10;
	    
	    // totalPage 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
	    log.info("jobKoreaList={}", jobKoreaList);
	    Gson gson = new Gson();
	    String jobKoreaListAsJson = gson.toJson(jobKoreaList);
	    model.addAttribute("jobKoreaListAsJson", jobKoreaListAsJson);
		model.addAttribute("jobKoreaList", jobKoreaList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
	  
		return "/board/jobSearchBoardList"; 
	  }
	
	@GetMapping("/threePostByBoardId.do")
	@ResponseBody
	public List<PopularBoardDto> threePostByBoardId(@RequestParam int boardId) {
		List<PopularBoardDto> post = boardService.findThreePostByBoardId(boardId);
		log.debug("post = {}", post);
		return post;
	}
	
	@GetMapping("/deleteComment.do")
	@ResponseBody
	public String deleteComment(@RequestParam int commentId) {
		
		int ckRef = boardService.checkRef(commentId);
		if(ckRef>0) {
			
			int result = boardService.deleteComment(commentId);
		}else {
			int result = boardService.deleteCommentId(commentId);
		}
	
		return "삭제성공";
		
	}
	
	@PostMapping("/createMyClass.do")
	public String createMyClass(
			@RequestParam String title,
			@RequestParam String text,
			@RequestParam int boardId,
			@RequestParam(required = false) String[] _tags,
			@AuthenticationPrincipal MemberDetails member,
			@RequestParam(value = "file", required = false) List<MultipartFile> files) throws IllegalStateException, IOException{
//		log.info("loginMember = {}", member);
		List<String> tags = _tags != null ? Arrays.asList(_tags) : null;
		
		// 1. 파일저장
		int result = 0;
		List<PostAttachment> attachments = new ArrayList<>(); 
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				String renamedFilename = HelloSpringUtils.getRenameFilename(originalFilename); // 20230807_142828888_123.jpg
				File destFile = new File(renamedFilename); // 부모디렉토리 생략가능. spring.servlet.multipart.location 값을 사용
				file.transferTo(destFile);	

				PostAttachment attach = 
						PostAttachment.builder()
						.postOriginalFilename(originalFilename)
						.postRenamedFilename(renamedFilename)
						.boardId(boardId)
						.build();

				attachments.add(attach);
			}
		}
			
		BoardCreateDto board = BoardCreateDto.builder()
								.title(title)
								.content(text)
								.boardId(boardId)
								.memberId(member.getMemberId())
								.attachments(attachments)
								.tags(tags)
								.build();
		log.info("board = {}", board);
		if(board.getAttachments().isEmpty() || board.getAttachments() == null) {
			result = boardService.insertBoardNofiles(board);
		}else {
			result = boardService.insertBoard(board);
		}
		result = boardService.insertPostContent(board);
		
		return "redirect:/board/myClassBoardDetail.do?id=" + board.getPostId();
	}
	
	@PostMapping("/deleteMyClassPost.do") 
	public String deleteMyClassPost (
			@RequestParam int deletePostId,
			@RequestParam String postBoardLink,
			@RequestParam int boardId
			) {
		int result = boardService.deleteBoard(deletePostId); 
//		log.info("보드링크={}",postBoardLink);
//		log.info("포스트아이디={}",deletePostId);
		return "redirect:/board/" + postBoardLink + ".do?boardId=" + boardId;
	}
	
	@PostMapping("/updateMyClassPost.do")
	public String updateMyClassPost(
			@RequestParam String title,
			@RequestParam String text,
			@RequestParam int boardId,
			@RequestParam int postId,
			@RequestParam(required = false) String _tags,
			@AuthenticationPrincipal MemberDetails member,
			@RequestParam(value = "file", required = false) List<MultipartFile> files) throws IllegalStateException, IOException {
		
		List<String> tags = _tags != null ? Arrays.asList(_tags.replace("[", "").replace("]", "").split(",")) : null; 
		
		BoardCreateDto board = null;
		int result = 0;
		
		List<PostAttachment> attachments = new ArrayList<>(); 
		if(files != null) {
			
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					String originalFilename = file.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenameFilename(originalFilename); // 20230807_142828888_123.jpg
					File destFile = new File(renamedFilename); // 부모디렉토리 생략가능. spring.servlet.multipart.location 값을 사용
					file.transferTo(destFile);	
					
					PostAttachment attach = 
							PostAttachment.builder()
							.postOriginalFilename(originalFilename)
							.postRenamedFilename(renamedFilename)
							.boardId(boardId)
							.postId(postId)
							.build();
					
					attachments.add(attach);
				}
			}
		}
			board = BoardCreateDto.builder()
					.postId(postId)
					.title(title)
					.content(text)
					.boardId(boardId)
					.memberId(member.getMemberId())
					.tags(tags)
					.attachments(attachments) 
					.build();
			
		result = boardService.updatePost(board);
		result = boardService.updatePostContent(board);
		
		return "redirect:/board/myClassBoardDetail.do?id=" + board.getPostId();
	}
	
	@GetMapping("/jobSearch.do")
    public ResponseEntity<?> jobKorea(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws IOException {
        log.info("page!!!!!!!! = {},", page);
        int limit = 5;
        List<JobKorea> jobKoreaList = boardService.getJobKoreaDatas(page, limit);
        
        List<JobKorea> realList = new ArrayList<JobKorea>();
		for (JobKorea _jobKorea : jobKoreaList) {
//				System.out.println(_jobKorea.getTitle().contains(filter));
//				System.out.println(_jobKorea.getEtc().contains(filter));
//				System.out.println(_jobKorea.getOption().contains(filter));
				if (!_jobKorea.getTitle().equals("")) {
					log.info("_jobKorea = {}",_jobKorea);
					realList.add(_jobKorea);
			}
		}
        // 전체 게시글 수를 가져오는 로직을 구현해야 합니다.
        int totalCount = 500;

        // totalPage 계산
        int totalPages = (int) Math.ceil((double) totalCount / limit);

        log.info("jobKoreaList={}", realList);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(Map.of("jobKoreaList", realList, "currentPage", page, "totalPages", totalPages));
    }
	
	@GetMapping("/jobSearchByFilter.do")
	@ResponseBody
	public ResponseEntity<?> jobSearchByFilter(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(value = "filterList[]") String[] filterList, Model model) throws IOException {
//		log.info("filterList!!!!!!!! = {},", Arrays.toString(filterList));
		
		int limit = 5;
		
		// 전체 게시글 수를 가져오는 로직을 구현해야 합니다.
        int totalCount = 100;

        // totalPage 계산
        int totalPages = (int) Math.ceil((double) totalCount / limit);
        List<JobKorea> exList = new ArrayList<JobKorea>(); 
        for(int i=1; i<20; i++) {
        	
        	List<JobKorea> jobKoreaList = boardService.getJobKoreaDatas(i, limit);
        	exList.addAll(jobKoreaList);
        }
        
		List<JobKorea> jobKoreaFilterList = new ArrayList<JobKorea>();
		for (JobKorea _jobKorea : exList) {
			for (String filter : filterList) {
//				System.out.println(_jobKorea.getTitle().contains(filter));
//				System.out.println(_jobKorea.getEtc().contains(filter));
//				System.out.println(_jobKorea.getOption().contains(filter));
				if (!_jobKorea.getTitle().equals("") && ( _jobKorea.getTitle().contains(filter) || _jobKorea.getEtc().contains(filter) || _jobKorea.getOption().contains(filter))) {
					log.info("_jobKorea = {}",_jobKorea);
					jobKoreaFilterList.add(_jobKorea);
					break;
				}
			}
		}
		List<JobKorea> realList = getJobKoreaDatas(jobKoreaFilterList, page, limit);
		int endPage = (int) Math.ceil((double) jobKoreaFilterList.size()/limit);
	    log.info("jobKoreaList={}", jobKoreaFilterList);
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("jobKoreaList", realList, "currentPage", page, "totalPages", totalPages, "endPage", endPage));
		
	}

	private List<JobKorea> getJobKoreaDatas(List<JobKorea> jobKoreaFilterList, int page, int limit) {
		int startIndex = (page - 1) * limit;
		int endIndex = Math.min(startIndex + limit, jobKoreaFilterList.size());
				
		return jobKoreaFilterList.subList(startIndex, endIndex);
	}
	
	
	@GetMapping("/studyBoardList.do")
	public String studyList(Model model) {
		List<StudyList> studyList = boardService.findAllStudy();
		model.addAttribute("studyBoardList", studyList);
//		List<StudyList> studyLists = boardService.findTagId(studyList); 
		System.out.println(studyList);
		 return "/board/studyBoardList";
	}
	

	
	
	@GetMapping("/studyDetail.do")
	public void studyDetail(@RequestParam int id, Model model) {
		BoardListDto postDetail = boardService.findById(id);
		System.out.println(id);
		//log.debug("postDetail = {}", postDetail);
		System.out.println(postDetail);
		Board board = boardService.findBoardName(postDetail.getBoardId());
		log.debug("boardddddddddddd={}",board);
		//log.debug("boardddddddddddd={}",postDetail);
		PostAttachment postAttach = boardService.findAttachById(id);
		model.addAttribute("postDetail", postDetail);
		model.addAttribute("board",board );
//		System.out.println(board);
		model.addAttribute("postAttach",postAttach);
	}
	
	@PostMapping("/createStudyPost.do")
	public String createStudyPost(
			@RequestParam String title,
			@RequestParam String text,
			@RequestParam int boardId,
			@RequestParam int count,
			@RequestParam(required = false) String[] _tags,
			@AuthenticationPrincipal MemberDetails member) throws IllegalStateException, IOException{
		int result=0;
		List<String> tags = _tags != null ? Arrays.asList(_tags) : null;
		//전용게시판 생성 
		Study study= Study.builder().memberCount(count).studyName(title).memberId(member.getMemberId()).build();
		result = boardService.createStudy(study);

		//전용게시판 board 테이블에 생성해주기.(impl)
		int findId = boardService.findBoarderId(study);
		System.out.println("asdsadsad"+findId);
		study.setBoardId(findId);
		result = boardService.createBoard(study);
		
		// 스터디 original 게시판에 게시글 등록
		BoardCreateDto board = BoardCreateDto.builder()
				.boardId(boardId)
				.title(title)
				.content(text)
				.memberId(member.getMemberId())
				.tags(tags)
				.build();
		result = boardService.insertBoard(board);
		System.out.println(board);
		int postId = boardService.findByPostId();
		System.out.println(postId+"ASdsadsadsad");
		study= Study.builder().postId(postId).build();
		
		result = boardService.updatePostId(postId,findId);
		
		result = boardService.insertPostContent(board);
		return "redirect:/board/studyDetail.do?id=" + board.getPostId();

	}
	
}


    
