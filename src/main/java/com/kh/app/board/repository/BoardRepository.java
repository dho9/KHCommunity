package com.kh.app.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.app.board.entity.BoardDetails;

@Mapper
public interface BoardRepository {

	List<BoardDetails> findAll(RowBounds rowBounds);

}
