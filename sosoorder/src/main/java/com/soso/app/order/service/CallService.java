package com.soso.app.order.service;

import java.util.List;

public interface CallService {
	//요청등록
	public void callInsert(CallVO callVO);
	
	//요청 리스트
	public List<CallVO> callGet(CallVO callVO);
	
	//요청 확인시 업데이트
	public void callUpdate(CallVO callVO);
}
