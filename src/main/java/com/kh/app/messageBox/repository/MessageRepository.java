package com.kh.app.messageBox.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.app.messageBox.entity.MessageBox;

@Mapper
public interface MessageRepository {

	@Insert("insert into message_box values(seq_message_id.nextval, #{sendId}, #{receiveId}, #{messageContent}, default, #{anonymousCheck}, #{readCheck})")
	int insertMessage(MessageBox message);

	@Select("select * from message_box where receive_id=#{memberId} order by 1 desc")
	ArrayList<MessageBox> getMessageList(String memberId);

	@Delete("delete from message_box where message_id = #{messageId}")
	int messageDelete(String messageId);

	@Update("update message_box set read_check = 'y' where message_id = #{messageId}")
	int messageUpdate(String checked, String messageId);

}
