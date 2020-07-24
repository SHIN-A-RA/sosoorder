package com.soso.app.store.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StoreCouponVO {
	String serialNum;
	String expStart;
	String expEnd;
	String discount;
	String storeId;
}
