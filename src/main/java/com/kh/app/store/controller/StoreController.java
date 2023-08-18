package com.kh.app.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.app.store.entity.Store;
import com.kh.app.store.service.StoreService;

import lombok.extern.slf4j.Slf4j;


@Validated
@Controller
@Slf4j
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/storeList.do")
	public void storeList(Model model) {
		List<Store> store = storeService.findAll();
//		 log.debug("ticekt = {}", ticket);
		model.addAttribute("stores", store);
		
	}
	@GetMapping("/storeDetail.do")
	public void storeDetail(@RequestParam int id, Model model) {
		Store store = storeService.findStoreById(id);
//		 log.debug("ticekt = {}", ticket);
		model.addAttribute("store", store);
		
	}
}