package com.kh.app.notification.service;


import com.kh.app.board.entity.Comment;
import com.kh.app.chat.entity.Talker;
import com.kh.app.messageBox.entity.MessageBox;

public interface NotificationService {

	int notifyChatCreate(Talker talker);

	int notifyMsgSend(MessageBox message);

	int notifyMsgSendFromAdmin(MessageBox message);

	int notifyAlamSendFromMemberId(String memberId, String msg);
	
	int notifyComment(Comment comment, String receivedId);


}
