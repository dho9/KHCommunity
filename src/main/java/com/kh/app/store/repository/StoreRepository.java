package com.kh.app.store.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.app.store.dto.StoreDetailDto;
import com.kh.app.store.entity.Store;

@Mapper
public interface StoreRepository {

	@Select("select * from store")
	List<Store> findAll();

	@Select("select store_id from store where store_name = #{name}")
	int findStoreIdByName(String name);

	StoreDetailDto findStoreById(int id);

}
