package com.kh.app.ticket.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TicketOrder {

	private String orderId;
	private String memberId;
	private int storeId;
	private int ticketId;
	private int amount;
	private int totalPrice;
	
}
