package com.kh.app.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.dto.CreateCommentDto;
import com.kh.app.board.dto.NoticeBoardDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.dto.PostReportDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Comment;
import com.kh.app.board.entity.CommentLike;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.board.entity.PostLike;

@Mapper
public interface BoardRepository {

	List<BoardSearchDto> findAllByKeyword(String keyword);

	List<BoardSearchDto> findAllByMemberId(String memberId);
	
	List<BoardListDto> freeBoardFindAll();
	
	List<BoardListDto> marketBoardFindAll();
	
	List<BoardListDto> todayFoodBoardFindAll();

	List<BoardListDto> preStudentBoardFindAll();

	List<BoardListDto> graduateBoardFindAll();
	
	List<BoardListDto> employeeBoardFindAll();
	
	List<BoardListDto> studyBoardFindAll();
	
	List<BoardListDto> sharingInformationBoardFindAll();

	List<BoardListDto> askCodeBoardFindAll();

	List<BoardListDto> myClassBoardFindAll();

	@Select("select * from favorite where board_id = #{boardId} and member_id = #{memberId}")
	Favorite findFavoriteByMemberId(int boardId, String memberId);

	@Delete("delete from favorite where board_id = #{boardId} and member_id = #{memberId}")
	int deleteFavoriteByMemberId(int boardId, String memberId);

	@Insert("insert into favorite values (#{boardId}, #{memberId})")
	int insertFavoriteByMemberId(int boardId, String memberId);
	
	BoardListDto findById(int id);

	List<BoardListDto> noticeBoardFindAll();
	
	@Select("select * from post_like where post_id = #{postId} and member_id = #{memberId}")
	PostLike findPostLikeByMemberId(int postId, String memberId);

	@Delete("delete from post_like where post_id = #{postId} and member_id = #{memberId}")
	int deletePostLikeByMemberId(int postId, String memberId);

	@Insert("insert into post_like values (#{postId}, #{memberId})")
	int insertPostLikeByMemberId(int postId, String memberId);

	PostLike findPostLikeCount(int postId);
	
	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check, tag, anonymous_check) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, sysdate, 'n', 'n', 'y', #{tags, typeHandler=stringListTypeHandler}, #{anonymousCheck})")
	@SelectKey(
			before = false, 
			keyProperty = "postId", 
			resultType = int.class,
			statement = "select seq_post_id.currval from dual")
	int insertBoardNofiles(BoardCreateDto board);
	
	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check, tag, anonymous_check) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, sysdate, 'n', 'y', 'y', #{tags, typeHandler=stringListTypeHandler}, #{anonymousCheck})")
	@SelectKey(
			before = false, 
			keyProperty = "postId", 
			resultType = int.class,
			statement = "select seq_post_id.currval from dual")
	int insertBoard(BoardCreateDto board);

	@Insert("insert into post_content (post_id, board_id, content) values(#{postId}, #{boardId}, #{content})")
	int insertPostContent(BoardCreateDto board);
	
	@Insert("insert into post_attachment values(seq_post_attach_id.nextval, #{postId}, #{boardId}, #{postOriginalFilename}, #{postRenamedFilename})")
	int insertPostAttach(PostAttachment attach);

	@Select("select * from board where board_id = #{boardId}")
	Board findBoardName(int boardId);

	List<PopularBoardDto> findByPopularPost();
	
	@Select("select * from post_attachment where post_id = #{id}")
	PostAttachment findAttachById(int id);

	List<BoardListDto> myClassBoardFindAll(RowBounds rowBounds, int boardId);
	
	List<Comment> findByCommentByPostId(int postId);
	
	@Select("select * from comment_like where comment_id = #{commentId} and member_id = #{memberId}")
	CommentLike findCommentLikeByMemberId(int commentId, String memberId);
	
	@Delete("delete from comment_like where comment_Id = #{commentId} and member_id = #{memberId}")
	int deleteCommentLikeByMemberId(int commentId, String memberId);
	
	@Insert("insert into comment_like values (#{commentId}, #{memberId})")
	int insertCommentLikeByMemberId(int commentId, String memberId);
	
	CommentLike findCommentLikeCount(int commentId);

	List<BoardListDto> myClassBoardFindByTag(String tag, RowBounds rowBounds, int boardId);
	
	@Select("SELECT pc.comment_id FROM post_comment pc WHERE pc.post_id = #{postId} AND pc.comment_id IN (SELECT cl.comment_id FROM comment_like cl WHERE cl.member_id = #{memberId})")
	List<CommentLike> CommentLikeCheckById(int postId, String memberId);
	
	@Insert("INSERT INTO post_comment(comment_id, post_id, board_id, member_id, comment_content, comment_level,comment_ref, anonymous_check) " +
	        "VALUES (seq_comment_id.nextval, #{postId}, #{boardId}, #{memberId}, #{commentContent}, #{commentLevel}, #{commentRef}, #{anonymousCheck})")
	int createComment(Comment comment);

	int totalCountMyClassBoard(int boardId);
	
	@Delete("delete post where post_id = #{deletePostId}")
	int deleteBoard(int deletePostId);

	@Select("SELECT p.post_id, p.title, pc.content\r\n"
			+ "FROM post p\r\n"
			+ "JOIN post_content pc ON p.post_id = pc.post_id\r\n"
			+ "WHERE p.board_id = 10\r\n"
			+ "ORDER BY p.post_created_at DESC\r\n"
			+ "FETCH FIRST 3 ROWS ONLY")
	List<NoticeBoardDto> findThreeNotice();

	@Update("update post set title = #{title}, tag = #{tags, typeHandler=stringListTypeHandler}, anonymous_check = #{anonymousCheck} where post_id = #{postId}")
	int updatePost(BoardCreateDto board);
	
	@Update("update post_content set content = #{content} where post_id = #{postId}")
	int updatePostContent(BoardCreateDto board);

	@Delete("delete post_attachment where post_id = #{postId}")
	int deletePostAttach(PostAttachment attach);
	
	
	List<BoardListDto> AllBoardFindMyarticle(String memberId, RowBounds rowBounds);

	@Select("select count(*) from post where member_id= #{memberId}")
	int totalCountMyarticle(String memberId);
	
	
	List<BoardListDto> AllBoardFindMycommentarticle(String memberId, RowBounds rowBounds);
	
	@Select("SELECT COUNT(*) FROM (SELECT COUNT(*) FROM post_comment WHERE member_id = #{memberId} GROUP BY post_id)")
	int totalCountMycommentarticle(String memberId);

	List<CommentLike> commentLikeCheck(int postId);


	@Insert("insert into report(report_id, post_id, reporter_id, attacker_id, report_content, report_type, REPORT_SEND_DATE, REPORT_CHECK)" +
	        "values(seq_report_id.nextval, #{postId}, #{reporterId}, #{attackerId}, #{reportContent}, #{reportType}, sysdate, 'n')")
	int insertPostReport(PostReportDto postReport);

	@Select("SELECT p.post_id, p.title, pc.content, b.board_name\r\n"
			+ "FROM post p\r\n"
			+ "JOIN post_content pc ON p.post_id = pc.post_id\r\n"
			+ "left join board b on b.board_id = p.board_id\r\n"
			+ "WHERE p.board_id = #{boardId}\r\n"
			+ "ORDER BY p.post_created_at DESC\r\n"
			+ "FETCH FIRST 3 ROWS ONLY")
	List<PopularBoardDto> findThreePostByBoardId(int boardId);

	List<BoardListDto> jobSearchBoardFindAll();

	@Select("select count(*) from post p join post_content c on p.post_id = c.post_id where p.board_id=#{boardId} and tag =#{tag}")
	int totalCountMyClassBoardByTag(String tag, int boardId);
	
	@Update ("update post_comment set comment_content = '삭제된 댓글입니다.', delete_ck = 1 where comment_id = #{commentId}" )
	int deleteComment(int commentId);
	@Select ("select count(*)from post_comment  where comment_ref= #{commentId}")
	int checkRef(int commentId);
	
	@Delete ("delete from post_comment where comment_id =#{commentId}")
	int deleteCommentId(int commentId);
	
}
