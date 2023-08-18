package com.kh.app.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.board.dto.BoardListDto;
import com.kh.app.board.dto.BoardSearchDto;
import com.kh.app.board.entity.Favorite;
import com.kh.app.board.dto.PostDetails;

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

}
