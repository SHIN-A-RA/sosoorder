package com.soso.app.openClose.service;

import java.util.List;
import java.util.Map;


public interface OpenCloseService {
	public void openInfoInsert(OpenCloseVO openCloseVO);
	public void closeInfoUpdate(OpenCloseVO openCloseVO);
	public List<Map> openTime(OpenCloseVO openCloseVO);
	
	
	/* 요소들 뽑아내기 */
	public String closeTotalSales(OpenCloseVO openCloseVO);
	public String closeAccount(OpenCloseVO openCloseVO);
	public String closeCard(OpenCloseVO openCloseVO);
	public String closeCash(OpenCloseVO openCloseVO);
	public String VAT(OpenCloseVO openCloseVO);
	public String netSales(OpenCloseVO openCloseVO);
	public List<Map> closeMenu(OpenCloseVO openCloseVO);
	public String afterCash(OpenCloseVO openCloseVO);
}
