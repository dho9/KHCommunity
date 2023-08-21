package com.kh.app.schedule.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.app.schedule.entity.Calendar;

@Mapper
public interface CalenDao {
	
	public ArrayList<Calendar> calenList();
	
}