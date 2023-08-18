package com.kh.app.ticket.dto;

import java.util.List;

import javax.validation.constraints.NotNull;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TicketBuyDto {
	private String orderId;
	private String memberId;
	private String storename;
	private int amount;
	private int totalPrice;
}
