package com.soso.app.store.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StorePopupVO {
	String popNum;
	String popTitle;
	String popContents;
	String popChack;
	String storeId;
	String popImage;
	String startDay;
	String endDay;
}
