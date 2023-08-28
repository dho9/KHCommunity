package com.kh.app.chat.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectKey;

import com.kh.app.chat.entity.ChatRoom;
import com.kh.app.chat.entity.Talker;

@Mapper
public interface ChatRepository {

	@Insert("insert into chat_room (chat_id, chat_date, chat_type) values (seq_chat_id.NEXTVAL, current_date, null)")
	@SelectKey(
			before = false, 
			keyProperty = "chatId", 
			resultType = int.class,
			statement = "select seq_chat_id.currval from dual")
	int insertNewChatRoom(ChatRoom newChatRoom);

	@Insert("insert into talker (chat_id, student_id, employee_id) values (#{chatId}, #{studentId}, null )")
	int insertChatTalker(Talker talker);

}
