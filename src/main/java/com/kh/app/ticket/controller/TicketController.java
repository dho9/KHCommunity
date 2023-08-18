package com.kh.app.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.app.store.service.StoreService;
import com.kh.app.ticket.dto.TicketBuyDto;
import com.kh.app.ticket.entity.TicketOrder;
import com.kh.app.ticket.service.TicketService;

import lombok.extern.slf4j.Slf4j;


@Validated
@CrossOrigin
@RestController
@Controller
@Slf4j
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private StoreService storeService;
	
	@PostMapping("/buyTicket.do")
	public ResponseEntity<?> buyTicket( @RequestBody TicketBuyDto _order){
//		log.debug("dto = {}",order);
		String name = _order.getStorename();
		int storeId = storeService.findStoreIdByName(name);
		int ticketId = ticketService.findTicketIdByStoreId(storeId);
//		log.debug("storeId = {}",storeId);
//		log.debug("ticketId = {}",ticketId);
		TicketOrder order = TicketOrder.builder()
				.orderId(_order.getOrderId())
				.memberId(_order.getMemberId())
				.storeId(storeId)
				.ticketId(ticketId)
				.amount(_order.getAmount())
				.totalPrice(_order.getTotalPrice())
				.build();
//		log.debug("order = {}",order);
		int result = ticketService.createOrder(order);
//		log.debug("result = {}",result);
		String msg ="";
		if(result>0) {
			  msg = "정상적으로 결제되었습니다.";
			  return ResponseEntity.ok().body(msg);
			
		}else {
			 msg = "결제에 실패하였습니다.";
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(msg);
			
		}
		 
		
	}
		
}