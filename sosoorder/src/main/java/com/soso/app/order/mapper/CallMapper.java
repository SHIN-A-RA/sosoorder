package com.soso.app.order.mapper;

import java.util.List;

import com.soso.app.order.service.CallVO;

public interface CallMapper {
	//요청등록
	public void callInsert(CallVO callVO);
	
	//요청 리스트
	public List<CallVO> callGet(CallVO callVO);
	
	//요청 확인시 업데이트
	public void callUpdate(CallVO callVO);
}
