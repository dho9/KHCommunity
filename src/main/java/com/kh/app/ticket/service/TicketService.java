package com.kh.app.ticket.service;

import java.util.List;

import com.kh.app.ticket.entity.Ticket;

public interface TicketService {

	List<Ticket> findAll();

	Ticket findTicektById(int id);

}
