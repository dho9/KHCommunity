package com.kh.app.schedule.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.schedule.entity.Calendar;
import com.kh.app.schedule.repository.CalenDao;

@Service
public class CalenService {
	@Autowired(required = false)
	private CalenDao dao;
	
	public ArrayList<Calendar> calenList(){
		return dao.calenList();
	}
}