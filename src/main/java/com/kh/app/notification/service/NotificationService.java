package com.kh.app.notification.service;

import javax.validation.Valid;

import com.kh.app.chat.entity.Talker;
import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.notification.entity.Alarm;

public interface NotificationService {

	int notifyChatCreate(Talker talker);

	int notifyMsgSend(MessageBox message);

	int notifyMsgSendFromAdmin(@Valid MessageBox message);


}
