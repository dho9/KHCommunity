package com.kh.app.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.kh.app.board.dto.BoardCreateDto;
import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.entity.Board;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.entity.PostLike;

@Mapper
public interface BoardRepository {

	List<BoardSearchDto> findAllByKeyword(String keyword);

	List<BoardSearchDto> findAllByMemberId(String memberId);
	
	List<BoardListDto> freeBoardFindAll();

	List<BoardListDto> preStudentBoardFindAll();

	List<BoardListDto> graduateBoardFindAll();

	@Select("select * from favorite where board_id = #{boardId} and member_id = #{memberId}")
	Favorite findFavoriteByMemberId(int boardId, String memberId);

	@Delete("delete from favorite where board_id = #{boardId} and member_id = #{memberId}")
	int deleteFavoriteByMemberId(int boardId, String memberId);

	@Insert("insert into favorite values (#{boardId}, #{memberId})")
	int insertFavoriteByMemberId(int boardId, String memberId);
	
	BoardListDto findById(int id);

	List<BoardListDto> employeeBoardFindAll();

	@Select("select * from post_like where post_id = #{postId} and member_id = #{memberId}")
	PostLike findPostLikeByMemberId(int postId, String memberId);

	@Delete("delete from post_like where post_id = #{postId} and member_id = #{memberId}")
	int deletePostLikeByMemberId(int postId, String memberId);

	@Insert("insert into post_like values (#{postId}, #{memberId})")
	int insertPostLikeByMemberId(int postId, String memberId);

	PostLike findPostLikeCount(int postId);
	
	@Insert("INSERT INTO post (post_id, board_id, member_id, title, post_created_at, comment_check, attach_check, status_check) VALUES (seq_post_id.NEXTVAL, #{boardId}, #{memberId}, #{title}, sysdate, 'n', 'n', 'y')")
	@SelectKey(
			before = false, 
			keyProperty = "postId", 
			resultType = int.class,
			statement = "select seq_post_id.currval from dual")
	int insertBoard(BoardCreateDto board);

	@Insert("insert into post_content (post_id, board_id, content) values(#{postId}, #{boardId}, #{content})")
	int insertPostContent(BoardCreateDto board);

	@Select("select * from board where board_id = #{boardId}")
	Board findBoardName(int boardId);
}
