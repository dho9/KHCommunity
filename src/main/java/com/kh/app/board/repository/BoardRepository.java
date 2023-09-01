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
import com.kh.app.board.dto.CommentReportDto;
import com.kh.app.board.dto.CreateCommentDto;
import com.kh.app.board.dto.JobKorea;
import com.kh.app.board.dto.NoticeBoardDto;
import com.kh.app.board.dto.PopularBoardDto;
import com.kh.app.board.dto.PostReportDto;
import com.kh.app.board.dto.StudyInfo;
import com.kh.app.board.dto.StudyList;
import com.kh.app.board.dto.StudyListDto;
import com.kh.app.board.dto.StudyMemberDto;
import com.kh.app.board.dto.StudyMemberId;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Comment;
import com.kh.app.board.entity.CommentLike;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostAttachment;
import com.kh.app.board.entity.PostLike;
import com.kh.app.board.entity.Study;
import com.kh.app.member.entity.Student;

@Mapper
public interface BoardRepository {


	List<BoardSearchDto> findAllByKeyword(String keyword);

	List<BoardSearchDto> findAllByMemberId(String memberId);
	
	List<BoardListDto> freeBoardFindAll(RowBounds rowBounds);
	
	List<BoardListDto> marketBoardFindAll(RowBounds rowBounds);
	
	List<BoardListDto> todayFoodBoardFindAll(RowBounds rowBounds);
	
	List<BoardListDto> sharingInformationBoardFindAll(RowBounds rowBounds);
	
	List<BoardListDto> askCodeBoardFindAll(RowBounds rowBounds);
	
	List<BoardListDto> studyBoardFindAll(RowBounds rowBounds);
	
	List<BoardListDto> graduateBoardFindAll(RowBounds rowBounds);

	List<BoardListDto> preStudentBoardFindAll(RowBounds rowBounds);

	List<BoardListDto> employeeBoardFindAll(RowBounds rowBounds);
	
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
	
	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check, tag, anonymous_check) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, current_date, 'n', 'n', 'y', #{tags, typeHandler=stringListTypeHandler}, #{anonymousCheck})")
	@SelectKey(
			before = false, 
			keyProperty = "postId", 
			resultType = int.class,
			statement = "select seq_post_id.currval from dual")
	int insertBoardNofiles(BoardCreateDto board);
	
	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check, tag, anonymous_check) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, current_date, 'n', 'y', 'y', #{tags, typeHandler=stringListTypeHandler}, #{anonymousCheck})")
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
	        "values(seq_report_id.nextval, #{postId}, #{reporterId}, #{attackerId}, #{reportContent}, #{reportType}, current_date, 'n')")
	int insertPostReport(PostReportDto postReport);
	
	@Insert("insert into report(report_id, comment_id, reporter_id, attacker_id, report_content, report_type, REPORT_SEND_DATE, REPORT_CHECK)" +
	        "values(seq_report_id.nextval, #{commentId}, #{reporterId}, #{attackerId}, #{reportContent}, #{reportType}, current_date, 'n')")
	int insertCommentReport(CommentReportDto commentReport);

	@Select("SELECT p.post_id, p.title, pc.content, b.board_name, p.post_created_at\r\n"
			+ "FROM post p\r\n"
			+ "JOIN post_content pc ON p.post_id = pc.post_id\r\n"
			+ "left join board b on b.board_id = p.board_id\r\n"
			+ "WHERE p.board_id = #{boardId}\r\n"
			+ "ORDER BY p.post_created_at DESC\r\n"
			+ "FETCH FIRST 5 ROWS ONLY")
	List<PopularBoardDto> findThreePostByBoardId(int boardId);

	@Select("select count(*) from post p join post_content c on p.post_id = c.post_id where p.board_id=#{boardId} and tag =#{tag}")
	int totalCountMyClassBoardByTag(String tag, int boardId);
	
	@Update ("update post_comment set comment_content = '삭제된 댓글입니다.', delete_ck = 1 where comment_id = #{commentId}" )
	int deleteComment(int commentId);
	@Select ("select count(*)from post_comment  where comment_ref= #{commentId}")
	int checkRef(int commentId);
	
	@Delete ("delete from post_comment where comment_id =#{commentId}")
	int deleteCommentId(int commentId);

	@Select ("select count(*) from post where board_id=1")
	int totalCountFreeBoard();

	@Select ("select count(*) from post where board_id=2")
	int totalCountMarketBoard();

	@Select ("select count(*) from post where board_id=3")
	int totalCountTodayFoodBoard();
	
	@Select ("select count(*) from post where board_id=4")
	int totalCountSharingInformationBoard();

	@Select ("select count(*) from post where board_id=5")
	int totalCountAskCodeBoard();

	@Select ("select count(*) from post where board_id=6")
	int totalCountStudyBoard();

	@Select ("select count(*) from post where board_id=7")
	int totalCountGraduateBoard();

	@Select ("select count(*) from post where board_id=8")
	int totalCountPreStudentBoard();

	@Select ("select count(*) from post where board_id=9")
	int totalCountEmployeeBoard();
	
	@Select("select * from study")
	List<StudyList> findAllStudy();
	
	@Insert("insert into study(study_id,board_id,study_name,member_id,study_people,member_count,post_id) values (seq_study_id.nextval, seq_board_id.nextval,#{studyName},#{memberId},1, #{memberCount},#{postId})")
	int createStudy(Study study);
	
	@Select("select board_id from study where study_name = #{studyName} and member_id = #{memberId} and member_count= #{memberCount}")
	int findBoarderId(Study study);
	
	@Insert("INSERT INTO board (board_id, board_name, board_category, board_link)"
			+ "SELECT board_id, '스터디'||#{memberId}, '스터디', 'study'||#{memberId}"
			+ "FROM study "
			+ "WHERE board_id = #{boardId}")
	int createBoard(Study study);
	
	@Select("select seq_post_id.CURRVAL from dual")
	int findByPostId();
	
	@Update("update study set post_id = #{postId} where board_Id = #{boardId}")
	int updatePostId(int postId, int boardId);

	StudyListDto studyFindById(int id);

	@Insert("insert into study_info (study_id, member_id, introduce, study_application_at, application_check) values(#{studyId},#{appliId}, #{appliContent},default,default )")
	int insertStudy(int studyId, String appliId, String appliContent);
	
	@Select("select count(*) from study_info where study_id = #{studyId} and member_Id = #{appliId}")
	int checkStudy(int studyId, String appliId);
	
	@Select("select * from study where study_id in ( select study_id from study_info where member_id =#{memberId} and APPLICATION_CHECK=1)")
	List<StudyList> findStudyList(String memberId);
	
	@Select("select study_id from study where board_id = #{boardId}")
	int findStudyId( int boardId);
	
	@Insert("insert into study_info (study_id, member_id,application_check) values(#{findStudyId},#{memberId}, 1)")
	int insertStudyInfo(String memberId, int findStudyId);
	
	@Select("select * from study_info where study_id = #{findStudyId} and APPLICATION_CHECK = 0")
	List<StudyInfo> finAllStudyAppli(int findStudyId);
	
	
	@Update("update study_info set APPLICATION_CHECK = 1 where member_Id = #{memberId} and study_Id = #{studyId} ")
	int updateStudyInfo(String memberId, int studyId);
	
	@Delete("delete from study_info  where member_Id = #{memberId} and study_Id = #{studyId} ")
	int deleteStudyInfo(String memberId, int studyId);

	@Select("select * from study where board_id=#{id}")
	Study myStudyFindById(int id);

	List<BoardListDto> findAllByBoardId(int id);

	List<StudyMemberDto> findStudyMember(int studyId);

	@Select("select member_id as receivedId from post where post_id = #{postId}")
	String findReceivedIdByPostId(int postId);

	@Select("select member_id as receivedId from post_comment where comment_id = #{ref}")
	String findReceivedIdByCommentRef(int ref);


	@Update(" update study set study_people = study_people+1 where study_id =#{studyId}")
	int updateStudyCount(int studyId);
	
	@Select ("select * from study where study_id=#{studyId}")
	Study findByStudyleaderName(int studyId);

	@Delete ("delete from post where board_id=#{deleteStudyBoardId}")
	int deleteStudyBoard(int deleteStudyBoardId);

	@Delete("delete from study where study_id=#{deleteStudyId}")
	int deleteStudy(int deleteStudyId);

	@Delete("delete from board where board_id=#{deleteStudyBoardId}")
	int deleteBoardType(int deleteStudyBoardId);
	
	@Delete("delete study_info where study_id=#{studyId} and member_id = #{memberId}")
	int studyDeleteMember(String memberId, int studyId);
	
	@Select("select member_id from study_info where study_id = #{studyId}")
	List<StudyMemberId> findStudyMemberIdList(int studyId);
	
	@Update(" update study set study_people = study_people-1 where study_id =#{studyId}")
	int minusStudyCount(int studyId);

	@Select("select * from student where student_id=#{memberId}")
	Student findStudentById(String memberId);
	
}
