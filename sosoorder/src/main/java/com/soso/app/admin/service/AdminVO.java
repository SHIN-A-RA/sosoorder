package com.soso.app.admin.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AdminVO {
	String storeId;
	String storePwd;
	String storeNum;
	String storeAddr;
	String storeName;
	String accountNum;
	String storeMenu;
}
