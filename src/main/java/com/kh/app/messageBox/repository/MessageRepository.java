package com.kh.app.messageBox.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.messageBox.entity.MessageBox;

@Mapper
public interface MessageRepository {

	@Insert("insert into message_box values(seq_message_id.nextval, #{sendId}, #{receiveId}, #{messageContent}, default, #{anonymousCheck}, #{readCheck})")
	int insertMessage(MessageBox message);

	@Select("select * from message_box where receive_id=#{memberId} order by 1 desc")
	ArrayList<MessageBox> getMessageList(String memberId);

}
