package com.kh.app.ticket.service;

import java.util.List;

import com.kh.app.store.entity.Store;
import com.kh.app.ticket.dto.TicketBuyDto;
import com.kh.app.ticket.entity.TicketOrder;

public interface TicketService {

	int findTicketIdByStoreId(int storeId);

	int createOrder(TicketOrder order);

	TicketBuyDto checkOreder(TicketBuyDto _order);

	int findTicketPrice(int ticketId);




}
