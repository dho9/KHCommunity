package com.kh.app.messageBox.service;

import java.util.List;

import com.kh.app.messageBox.dto.MessageReportDto;
import com.kh.app.messageBox.entity.MessageBox;

public interface MessageService {

	int insertMessage(MessageBox message);

	List<MessageBox> getMessageListWithPaging(String memberId, int page, int size);

	int messageDelete(String messageId);

	int messageUpdate(String checked, String messageId);

	List<MessageBox> getMessageList(String memberId);

	int insertMessageReport(MessageReportDto messageReport);

}
