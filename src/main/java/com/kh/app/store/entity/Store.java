package com.kh.app.store.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Store {
	private int storeId;
	private String storeName;
	private String postNumber;
	private String address;
	private String storeType;
}
