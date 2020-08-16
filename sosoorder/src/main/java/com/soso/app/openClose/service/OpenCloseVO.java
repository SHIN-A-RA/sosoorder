package com.soso.app.openClose.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OpenCloseVO {

	String storeOpen;
	String storeClose;
	String storeStartCash;
	String storeEndCash;
	String storeId;

	String EtcCash;
	String thousandWon;
	String fiveThousandWon;
	String tenThousandWon;
	String fiftyThousandWon;
	String OneHundredThousandWon;
	
	String openTime;
	String today;
	String storeDayData;
	
	String closeTotalSales;
	String closeAccount;
	String closeCard;
	String closeCash;
	String vat;
	String netSales;
	
	String AllAcount;
	String menuName;
	String afterCash;
}
