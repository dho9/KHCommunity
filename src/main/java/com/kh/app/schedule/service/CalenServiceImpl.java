package com.kh.app.schedule.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.schedule.dto.CalendarInsertDto;
import com.kh.app.schedule.entity.Calendar;
import com.kh.app.schedule.repository.CalenDao;

@Service
public class CalenServiceImpl {
	
	@Autowired
	private CalenDao calendao;
	
	public ArrayList<Calendar> calenList(String memberId){
		return calendao.calenList(memberId);
	}

	public int insertEvent(CalendarInsertDto calendarInsertDto) {
		
		return calendao.insertEvent(calendarInsertDto);
	}

	public int deleteEvent(int eventId) {
		
		return calendao.deleteEvent(eventId);
	}
}