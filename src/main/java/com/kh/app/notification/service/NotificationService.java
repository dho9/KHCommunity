package com.kh.app.notification.service;


import com.kh.app.chat.entity.Talker;
import com.kh.app.messageBox.entity.MessageBox;

public interface NotificationService {

	int notifyChatCreate(Talker talker);

	int notifyMsgSend(MessageBox message);

	int notifyMsgSendFromAdmin(MessageBox message);


}
