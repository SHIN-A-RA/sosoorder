package com.soso.app.order.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CallVO {
	String callNum;
	String seatNum;
	String callContents;
	String callCheck;
	String storeId;
	@Override
	public String toString() {
		return "CallVO [callNum=" + callNum + ", seatNum=" + seatNum + ", callContents=" + callContents + ", callCheck="
				+ callCheck + ", storeId=" + storeId + "]";
	}
	
	
}
