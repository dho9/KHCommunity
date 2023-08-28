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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CreateCommentDto;
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
import com.kh.app.board.service.BoardService;
import com.kh.app.common.HelloSpringUtils;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.service.MemberService;

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
	public String freeBoardList(Model model) {
		List<BoardListDto> freeBoardLists = boardService.freeBoardFindAll();
		//log.debug("freeBoardLists = {}", freeBoardLists);

		model.addAttribute("freeBoardLists", freeBoardLists);

		return "/board/freeBoardList";
	}

	@GetMapping("/marketBoardList.do")
	public String marketBoardList(Model model) {
		List<BoardListDto> marketBoardLists = boardService.marketBoardFindAll();
		log.debug("marketBoardLists = {}", marketBoardLists);

		model.addAttribute("marketBoardLists", marketBoardLists);

		return "/board/marketBoardList";
	}

	@GetMapping("/todayFoodBoardList.do")
	public String todayFoodBoardList(Model model) {
		List<BoardListDto> todayFoodBoardList = boardService.todayFoodBoardFindAll();
        log.debug("todayFoodBoardList = {}", todayFoodBoardList);
        
        model.addAttribute("todayFoodBoardList", todayFoodBoardList);
        
        return "/board/todayFoodBoardList";
	}

	@GetMapping("/sharingInformationBoardList.do")
	public String sharingInformationBoardList(Model model) {
		List<BoardListDto> sharingInformationBoardList = boardService.sharingInformationBoardFindAll();
		//log.debug("sharingInformationBoardList = {}", sharingInformationBoardList);

		model.addAttribute("sharingInformationBoardList", sharingInformationBoardList);

		return "/board/sharingInformationBoardList";
	}

	@GetMapping("/askCodeBoardList.do")
	public String askCodeBoardList(Model model) {
		List<BoardListDto> askCodeBoardList = boardService.askCodeBoardFindAll();
		log.debug("askCodeBoardList = {}", askCodeBoardList);

		model.addAttribute("askCodeBoardList", askCodeBoardList);

		return "/board/askCodeBoardList";
	}

	@GetMapping("/studyBoardList.do")
	public String studyBoardList(Model model) {
		List<BoardListDto> studyBoardList = boardService.studyBoardFindAll();
        log.debug("studyBoardList = {}", studyBoardList);
        
        model.addAttribute("studyBoardList", studyBoardList);
        
        return "/board/studyBoardList";
	}

	@GetMapping("/preStudentBoardList.do")
	public String preStudentBoardList(Model model) {
		List<BoardListDto> preStudentBoardList = boardService.preStudentBoardFindAll();
		//log.debug("preStudentBoardList = {}", preStudentBoardList);

		model.addAttribute("preStudentBoardList", preStudentBoardList);

		return "/board/preStudentBoardList";
	}

	@GetMapping("/graduateBoardList.do")
	public String graduateBoardList(Model model) {
		List<BoardListDto> graduateBoardList = boardService.graduateBoardFindAll();
		//log.debug("graduateBoardList = {}", graduateBoardList);

		model.addAttribute("graduateBoardList", graduateBoardList);

		return "/board/graduateBoardList";
	}

	@GetMapping("/employeeBoardList.do")
	public String employeeBoardList(Model model) {
		List<BoardListDto> employeeBoardList = boardService.employeeBoardFindAll();
		//log.debug("employeeBoardList = {}", employeeBoardList);

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
		
		if(board.getBoardId() == 11) {
			return "redirect:/board/myClassBoardDetail.do?id=" + board.getPostId();
		}
		
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
		
		if(boardId == 11) {
			return "redirect:/board/myClassBoardDetail.do?id=" + board.getPostId();
		}
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
	public ResponseEntity<?> createCommnet(
			CreateCommentDto _comment,@AuthenticationPrincipal MemberDetails member){
		log.debug("commentttttttttttt={}", _comment);
		
		
		
				
				
		if(member !=null &&_comment.getCommentRef()!="" ) {//대댓글용
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
		}
		if(member !=null &&_comment.getCommentRef()==""){ //댓글용
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
		}else {
			return ResponseEntity
					.status(HttpStatus.OK).body("댓글작성에 실패했습니다..");
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
        //log.debug("studentInfo = {}", studentInfo);
		model.addAttribute("studentInfo", studentInfo);
		model.addAttribute("authority", principal.getAuthorities());
        
        return "/board/myClassBoardList";
	}

	@PostMapping("/myClassBoardList.do")
	@ResponseBody
	public ResponseEntity<?> myClassBoardList(@RequestParam(defaultValue = "1") int page, @RequestParam String tag) {
		// 페이징
		int limit = 8;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		// 게시글 전체 수
		int totalCount = boardService.totalCountMyClassBoardByTag(tag);
		
		// totalPage 계산
		int totalPages = (int) Math.ceil((double) totalCount / limit);
		List<BoardListDto> myClassBoardList = boardService.myClassBoardFindByTag(tag, params);
		log.info("myClassBoardList ={}", myClassBoardList);
		log.info("totalPages = {}", totalPages);
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(Map.of("board", myClassBoardList, "currentPage", page, "totalPages", totalPages));
	}

	@GetMapping("/myClassBoardFindAll.do")
	public ResponseEntity<?> myClassBoardFindAll(@RequestParam(defaultValue = "1") int page) {
		// 페이징
		int limit = 8;
		Map<String, Object> params = Map.of(
				"page", page,
				"limit", limit
		);
		// 게시글 전체 수
		int totalCount = boardService.totalCountMyClassBoard();
		
		// totalPage 계산
		int totalPages = (int) Math.ceil((double) totalCount / limit);
		List<BoardListDto> myClassBoardList = boardService.myClassBoardFindAll(params);
		
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
	public void myClassBoardDetail(@RequestParam int id, Model model) {
		BoardListDto postDetail = boardService.findById(id);
		log.debug("postDetail = {}", postDetail);

		PostAttachment postAttach = boardService.findAttachById(id);
		log.debug("postAttach = {}", postAttach);
		
		List<Comment> comments = boardService.findByCommentByPostId(id);
		log.debug("comments = {}", comments);
		
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
			@RequestParam int reportPostId,
			@RequestParam String reporterId,
			@RequestParam String attackerId,
			@RequestParam String reportType,
			@RequestParam String reportContent
			) {
		PostReportDto postReport = PostReportDto.builder()
				.postId(reportPostId)
				.reporterId(reporterId)
				.attackerId(attackerId)
				.reportType(reportType)
				.reportContent(reportContent)
				.build();
		int result = boardService.insertPostReport(postReport);
		
		return "redirect:/board/boardDetail.do?id="+reportPostId;
	}
	
	@GetMapping("/jobSearchBoardList.do")
	public String jobSearchBoardList(Model model) {
		List<BoardListDto> jobSearchBoardList = boardService.jobSearchBoardFindAll();

		model.addAttribute("jobSearchBoardList", jobSearchBoardList);

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
	
	@GetMapping("/jobKorea.do")
	public String jobKorea(@RequestParam(defaultValue = "1") int page, Model model) throws IOException {
		int limit = 8;
		List<JobKorea> jobKoreaList = boardService.getJobKoreaDatas(page, limit);
		
		// 게시글 전체 수
	    int totalCount = 100; // 전체 게시글 수를 가져오는 로직을 구현해야 합니다.
	    // totalPage 계산
	    int totalPages = (int) Math.ceil((double) totalCount / limit);
		
		log.info("jobKoreaList={}", jobKoreaList);
		model.addAttribute("jobKoreaList", jobKoreaList);
		model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
		return "/board/jobSearchBoardList";
	}
	
}

