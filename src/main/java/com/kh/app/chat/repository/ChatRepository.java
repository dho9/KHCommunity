package com.kh.app.chat.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

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

	@Insert("insert into chat_message (chat_no, chat_id, member_id, employee_id, chat_content) values(seq_chat_message_no.nextval, #{chatId}, #{studentId}, null, #{message})")
	int insertStudentChatMsg(int chatId, String studentId, String message);

	@Insert("insert into chat_message (chat_no, chat_id, member_id, employee_id, chat_content) values(seq_chat_message_no.nextval, #{chatId}, null, 'admin', #{message})")
	int insertAdminChatMsg(int chatId, String message);

	@Update("update talker set employee_id = 'admin' where chat_id = #{chatId}")
	int updateAdminTalker(int chatId);

	@Update("update chat_room set chat_type = #{chatType} where chat_id = #{chatId}")
	int updateChatTypeInChatRoom(int chatId, String chatType);

}
