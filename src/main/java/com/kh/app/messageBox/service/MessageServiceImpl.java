package com.kh.app.messageBox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.messageBox.dto.MessageReportDto;
import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.messageBox.repository.MessageRepository;

@Transactional(rollbackFor = Exception.class)
@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageRepository messageRepository;
	@Override
	public int insertMessage(MessageBox message) {
		return messageRepository.insertMessage(message);
	}
	@Override
    public List<MessageBox> getMessageListWithPaging(String memberId, int page, int size) {
        int offset = (page - 1) * size;
        return messageRepository.getMessageListWithPaging(memberId, offset, size);
    }
	@Override
	public int messageDelete(String messageId) {
		return messageRepository.messageDelete(messageId);
	}
	@Override
	public int messageUpdate(String checked, String messageId) {
		return messageRepository.messageUpdate(checked, messageId);
	}
	@Override
	public List<MessageBox> getMessageList(String memberId) {
		return messageRepository.getMessageList(memberId);
	}
	@Override
	public int insertMessageReport(MessageReportDto messageReport) {
		return messageRepository.insertMessageReport(messageReport);
	}
	
	


	
}
