package com.kh.app.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.chat.entity.ChatRoom;
import com.kh.app.chat.entity.Talker;
import com.kh.app.chat.repository.ChatRepository;

@Transactional(rollbackFor = Exception.class)
@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatRepository chatRepository;
	
	@Override
	public int insertNewChatRoom(String memberId) {
		ChatRoom newChatRoom = new ChatRoom();
		
		int result = chatRepository.insertNewChatRoom(newChatRoom);
		
		int chatId = newChatRoom.getChatId();
		
		Talker talker = new Talker();
		talker.setChatId(chatId);
		talker.setStudentId(memberId);
		
		result = chatRepository.insertChatTalker(talker);
		
		return chatId;
	}
	
	@Override
	public int insertStudentChatMsg(int chatId, String studentId, String message) {
		return chatRepository.insertStudentChatMsg(chatId, studentId, message);
	}
	
	@Override
	public int insertAdminChatMsg(int chatId, String message) {
		return chatRepository.insertAdminChatMsg(chatId, message);
	}
	
	@Override
	public int updateAdminTalker(int chatId) {
		return chatRepository.updateAdminTalker(chatId);
	}
	
	@Override
	public int updateChatTypeInChatRoom(int chatId, String chatType) {
		return chatRepository.updateChatTypeInChatRoom(chatId, chatType);
	}
	
}
