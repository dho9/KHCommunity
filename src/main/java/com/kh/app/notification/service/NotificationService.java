package com.kh.app.notification.service;


import javax.validation.Valid;

import com.kh.app.board.entity.Comment;
import com.kh.app.chat.entity.Talker;
import com.kh.app.member.dto.AdminStudentListDto;
import com.kh.app.messageBox.entity.MessageBox;

public interface NotificationService {

	int notifyChatCreate(Talker talker);

	int notifyMsgSend(MessageBox message);

	int notifyMsgSendFromAdmin(MessageBox message);

	int notifyComment(Comment comment, String receivedId);

	int notifyCocomment(Comment comment, String receivedId);

	int notifyStudentApproveCheckOk(AdminStudentListDto student);

	int notifyStudentApproveCheckNo(AdminStudentListDto student);

	int notifyVacationCheckOk(String studentId, String vacationStartDate, String vacationEndDate);

	int notifyVacationCheckNo(String studentId, String vacationStartDate, String vacationEndDate);


}
