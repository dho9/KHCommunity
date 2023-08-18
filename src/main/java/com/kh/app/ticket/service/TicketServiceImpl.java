package com.kh.app.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.ticket.entity.Ticket;
import com.kh.app.ticket.repository.TicketRepository;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketRepository ticketRepository;
	
	@Override
	public List<Ticket> findAll() {
		// TODO Auto-generated method stub
		return ticketRepository.findAll();
	}
	@Override
	public Ticket findTicektById(int id) {
		// TODO Auto-generated method stub
		return ticketRepository.findTicektById(id);
	}
}
