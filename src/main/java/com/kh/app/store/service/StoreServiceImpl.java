package com.kh.app.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.store.dto.StoreDetailDto;
import com.kh.app.store.entity.Store;
import com.kh.app.store.repository.StoreRepository;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreRepository storeRepository;
	
	@Override
	public List<Store> findAll() {
		// TODO Auto-generated method stub
		return storeRepository.findAll();
	}
	@Override
	public StoreDetailDto findStoreById(int id) {
		// TODO Auto-generated method stub
		return storeRepository.findStoreById(id);
	}
	
	@Override
	public int findStoreIdByName(String name) {
		// TODO Auto-generated method stub
		 return storeRepository.findStoreIdByName(name);
	}
}
