package com.kh.app.notification.repository;


import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectKey;

import com.kh.app.ws.dto.MsgPayload;

@Mapper
public interface NotificationRepository {

	@Insert("insert into alarm (alarm_id, received_id, content, post_id, created_at, alarm_type, read_check) values (seq_alarm_id.nextval, #{receivedId}, #{content}, current_date, #{alarmType}, 'n', #{postId})")
	@SelectKey(
			before = false, 
			keyProperty = "alarmId", 
			resultType = int.class,
			statement = " select seq_alarm_id.currval from dual")
	int insertAlarm(MsgPayload payload);

	@Insert("insert into alarm (alarm_id, received_id, content, created_at, alarm_type, read_check, post_id) values (seq_alarm_id.nextval, #{receivedId}, #{content},current_date, #{alarmType}, 'n', null)")
	@SelectKey(
			before = false, 
			keyProperty = "alarmId", 
			resultType = int.class,
			statement = " select seq_alarm_id.currval from dual")
	int insertCommentAlarm(MsgPayload payload);


}
