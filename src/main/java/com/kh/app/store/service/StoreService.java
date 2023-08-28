package com.kh.app.store.service;

import java.util.List;

import com.kh.app.store.dto.StoreDetailDto;
import com.kh.app.store.entity.Store;

public interface StoreService {

	List<Store> findAll();

	StoreDetailDto findStoreById(int id);

	int findStoreIdByName(String name);


}
