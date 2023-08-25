package com.kh.app.messageBox.service;

import java.util.ArrayList;

import com.kh.app.messageBox.entity.MessageBox;

public interface MessageService {

	int insertMessage(MessageBox message);

	ArrayList<MessageBox> getMessageList(String memberId);

	int messageDelete(String messageId);

	int messageUpdate(String checked, String messageId);

}
