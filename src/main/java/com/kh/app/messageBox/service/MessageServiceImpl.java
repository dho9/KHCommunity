package com.kh.app.messageBox.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.messageBox.repository.MessageRepository;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageRepository messageRepository;
	@Override
	public int insertMessage(MessageBox message) {
		// TODO Auto-generated method stub
		return messageRepository.insertMessage(message);
	}
	@Override
	public ArrayList<MessageBox> getMessageList(String memberId) {
		// TODO Auto-generated method stub
		return messageRepository.getMessageList(memberId);
	}
	@Override
	public int messageDelete(String messageId) {
		// TODO Auto-generated method stub
		return messageRepository.messageDelete(messageId);
	}
	@Override
	public int messageUpdate(String checked, String messageId) {
		// TODO Auto-generated method stub
		return messageRepository.messageUpdate(checked, messageId);
	}
	


	
}
