package com.kh.app.notification.service;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.board.entity.Comment;
import com.kh.app.chat.entity.Talker;
import com.kh.app.messageBox.entity.AnonymousCheck;
import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.notification.entity.Alarm;
import com.kh.app.notification.entity.AlarmType;
import com.kh.app.notification.repository.NotificationRepository;
import com.kh.app.ws.dto.ChatPayload;
import com.kh.app.ws.dto.MsgPayload;

@Transactional(rollbackFor = Exception.class)
@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	NotificationRepository notificationRepository;
	
	// 채팅방 생성시 관리자에게 알림
	@Override
	public int notifyChatCreate(Talker talker) {
		
		ChatPayload payload = ChatPayload.builder()
				.chatId(talker.getChatId())
				.content(talker.getStudentId() + "님이 상담을 요청하셨습니다.<br>채팅방 : " + talker.getChatId() + "번")
				.createdAt(System.currentTimeMillis())
				.build();
		
		simpMessagingTemplate.convertAndSend("/topic/admin", payload);
		
		// 3. db 알림행 등록
		return 0;
		
	}
	
	// 게시글, 댓글에서 쪽지 전송시 받는 사람에게 알림
	@Override
	public int notifyMsgSend(MessageBox message) {
		
		// 알림 받을 대상
		String to = message.getReceiveId();
		
		// 알림 보내는 대상 - 익명 체크하면 익명, 아니면 아이디
		String sendId = "";
		if(message.getAnonymousCheck() == AnonymousCheck.y) {
			sendId = "익명";
		} else {
			sendId = message.getSendId();
		}
		String realSendID = message.getSendId();
		
		MsgPayload payload = MsgPayload.builder()
				.alarmId(0)
				.sendId(sendId)
				.receivedId(to)
				.anonymousCheck(message.getAnonymousCheck())
				.content(sendId + "님이 쪽지를 보냈습니다.")
				.createdAt(System.currentTimeMillis())
				.alarmType(AlarmType.m)
				.build();

		// db저장
		int alarmId = notificationRepository.insertMessageAlarm(payload);
		// 특정 사용자에게 알림
		simpMessagingTemplate.convertAndSend("/topic/msgnotice/" + to, payload);
		
		return alarmId;
	}
	
	// 관리자 페이지에서 쪽지 보낼 때 받는 사람에게 알림
	@Override
	public int notifyMsgSendFromAdmin(MessageBox message) {
		
		// 알림 받을 대상
		String to = message.getReceiveId();
				
		// 알림 보내는 대상(관리자)
		String sendId = "admin";
				
		MsgPayload payload = MsgPayload.builder()
				.alarmId(0)
				.sendId(sendId)
				.receivedId(to)
				.content("관리자가 쪽지를 보냈습니다.")
				.createdAt(System.currentTimeMillis())
				.alarmType(AlarmType.m)
				.build();
				
		// db저장
		int alarmId = notificationRepository.insertMessageAlarm(payload);
		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		
//		resultMap.put("alarmId", payload.getAlarmId());
//		
//		System.out.println(resultMap);
//		System.out.println(payload.getAlarmId());
//		payload.setAlarmId(payload.getAlarmId());
		
		// 특정 사용자에게 알림
		simpMessagingTemplate.convertAndSend("/topic/msgnotice/" + to, payload);
		
		return alarmId;
	}
	
	@Override
	public int notifyAlamSendFromMemberId(String memberId, String msg) {
		String to = memberId;
		String sendId = "system";
		
		MsgPayload payload = MsgPayload.builder()
				.alarmId(0)
				.sendId(sendId)
				.receivedId(to)
				.content(msg)
				.createdAt(System.currentTimeMillis())
				.alarmType(AlarmType.s)
				.build();
				
		// db저장
		int alarmId = notificationRepository.insertMessageAlarm(payload);
		simpMessagingTemplate.convertAndSend("/topic/msgnotice/" + to, payload);
		
		return alarmId;
	}


	// 댓글쓰면 게시글 게시자에게 알림
	@Override
	public int notifyComment(Comment comment, String receivedId) {
		// 알림 받을 대상
		String to = receivedId;
						
		// 알림 보내는 대상(관리자)
		String sendId = "";
		
		// 익명인지 아닌지
		if(comment.isAnonymousCheck()) {
			sendId = "익명";
		} else {
			sendId = comment.getMemberId();
		}
				
		MsgPayload payload = MsgPayload.builder()
				.alarmId(0)
				.sendId(sendId)
				.receivedId(to)
				.content(sendId + "님이 댓글을 남겼습니다.")
				.createdAt(System.currentTimeMillis())
				.alarmType(AlarmType.c)
				.postId(comment.getPostId())
				.build();
		
		int alarmId = notificationRepository.insertCommentAlarm(payload);
		
		// 특정 사용자에게 알림
		simpMessagingTemplate.convertAndSend("/topic/commentNotice/" + to, payload);
		
		return 0;
	}
	
}
