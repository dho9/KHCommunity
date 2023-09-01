package com.kh.app.messageBox.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.app.messageBox.dto.MessageReportDto;
import com.kh.app.messageBox.entity.MessageBox;

@Mapper
public interface MessageRepository {

	@Insert("insert into message_box values(seq_message_id.nextval, #{sendId}, #{receiveId}, #{messageContent}, default, #{anonymousCheck}, #{readCheck})")
	int insertMessage(MessageBox message);


	@Delete("delete from message_box where message_id = #{messageId}")
	int messageDelete(String messageId);

	@Update("update message_box set read_check = 'y' where message_id = #{messageId}")
	int messageUpdate(String checked, String messageId);

	@Select("SELECT * FROM (SELECT a.*, ROWNUM AS rnum FROM (SELECT * FROM message_box WHERE receive_id=#{memberId} ORDER BY message_id DESC) a WHERE ROWNUM <= #{offset} + #{size}) WHERE rnum > #{offset}")
    List<MessageBox> getMessageListWithPaging(@Param("memberId") String memberId,
                                              @Param("offset") int offset,
                                              @Param("size") int size);

	@Select("select * from message_box where receive_id= #{memberId}")
	List<MessageBox> getMessageList(String memberId);

	@Insert("insert into report(report_id, message_id, reporter_id, attacker_id, report_content, report_type, REPORT_SEND_DATE, REPORT_CHECK)" +
	        "values(seq_report_id.nextval, #{messageId}, #{reporterId}, #{attackerId}, #{reportContent}, #{reportType}, current_date, 'n')")
	int insertMessageReport(MessageReportDto messageReport);

}
