package com.kh.app.board.service;

import java.util.List;

import com.kh.app.board.entity.BoardSearchDetails;

public interface BoardService {

	List<BoardSearchDetails> findAllByKeyword(String keyword);

	List<BoardSearchDetails> findAllByMemberId(String memberId);

}
