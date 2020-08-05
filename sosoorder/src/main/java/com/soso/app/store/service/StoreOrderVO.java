package com.soso.app.store.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StoreOrderVO {
	
	String payNum;
	String payCheck;
	String MenuName;
	String OrderCount;
	String seat;
	String status;
	String storeId;
	String addr;
}
