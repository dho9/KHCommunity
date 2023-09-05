package com.kh.app.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.ticket.dto.TicketBuyDto;
import com.kh.app.ticket.entity.TicketOrder;
import com.kh.app.ticket.repository.TicketRepository;

@Transactional(rollbackFor = Exception.class)
@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketRepository ticketRepository;
	
	@Override
	public int findTicketIdByStoreId(int storeId) {
		return ticketRepository.findTicketIdByStoreId(storeId);
	}
	@Override
	public int createOrder(TicketOrder order) {
		return ticketRepository.createOrder(order);
	}
	@Override
	public TicketBuyDto checkOreder(TicketBuyDto _order) {
		return ticketRepository.checkOreder(_order);
	}
	@Override
	public int findTicketPrice(int ticketId) {
		// TODO Auto-generated method stub
		return ticketRepository.findTicketPrice(ticketId);
	}
}
