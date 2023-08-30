package com.kh.app.notification.repository;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.app.ws.dto.MsgPayload;

@Mapper
public interface NotificationRepository {
	
	@Insert("insert into alarm (alarm_id, received_id, content, created_at, alarm_type, read_check) values (seq_alarm_id.nextval, #{receivedId}, #{content}, current_date, 'm', 'n')")
	int insertMessageAlarmFromAdmin(MsgPayload payload);

	@Insert("insert into alarm (alarm_id, received_id, content, created_at, alarm_type, read_check) values (seq_alarm_id.nextval, #{receivedId}, #{content}, current_date, 'm', 'n')")
	int insertMessageAlarm(MsgPayload payload);

}
