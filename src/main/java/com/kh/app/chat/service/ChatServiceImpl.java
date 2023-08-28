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
	
}
