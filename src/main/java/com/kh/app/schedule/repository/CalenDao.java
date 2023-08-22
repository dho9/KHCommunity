package com.kh.app.schedule.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.app.schedule.dto.CalendarInsertDto;
import com.kh.app.schedule.entity.Calendar;

@Mapper
public interface CalenDao {
	
	public ArrayList<Calendar> calenList(String memberId);

	@Insert("INSERT INTO calendar (id, groupId, title, writer, content, start1, end1, allDay, textColor, backgroundColor, borderColor, member_id) " +
	        "values (seq_cal.nextval, null, #{title}, 'test', '내용', to_date(#{start},'YYYY/MM/DD'), to_date(#{end},'YYYY/MM/DD'), 1, 'yellow', #{backgroundColor}, #{backgroundColor}, #{memberId})")
	public int insertEvent(CalendarInsertDto calendarInsertDto);
	
}