package com.kh.app.schedule.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.app.schedule.entity.Calendar;

@Repository
public interface CalenDao {
	public ArrayList<Calendar> calenList();
}