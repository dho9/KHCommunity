package com.kh.app.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.ticket.entity.Ticket;
import com.kh.app.ticket.service.TicketService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@GetMapping("/ticketList.do")
	public void ticketList(Model model) {
		List<Ticket> ticket = ticketService.findAll();
		 log.debug("ticekt = {}", ticket);
		model.addAttribute("stores", ticket);
		
	}
	
}
