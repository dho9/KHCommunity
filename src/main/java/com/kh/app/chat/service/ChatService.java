package com.kh.app.chat.service;

public interface ChatService {

	int insertNewChatRoom(String memberId);

	int insertStudentChatMsg(int chatId, String studentId, String message);

	int insertAdminChatMsg(int chatId, String message);

	int updateAdminTalker(int chatId);

	int updateChatTypeInChatRoom(int chatId, String chatType);

}
