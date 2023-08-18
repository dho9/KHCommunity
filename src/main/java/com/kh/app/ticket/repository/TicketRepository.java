package com.kh.app.ticket.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.ticket.entity.Ticket;

@Mapper
public interface TicketRepository {

	@Select("select * from store")
	List<Ticket> findAll();

}
