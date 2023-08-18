package com.kh.app.store.service;

import java.util.List;

import com.kh.app.store.entity.Store;

public interface StoreService {

	List<Store> findAll();

	Store findStoreById(int id);

	int findStoreIdByName(String name);

}
