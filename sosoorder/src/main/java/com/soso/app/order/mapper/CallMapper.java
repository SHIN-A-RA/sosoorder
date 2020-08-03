package com.soso.app.order.mapper;

import com.soso.app.order.service.CallVO;

public interface CallMapper {
	//요청등록
	public void callInsert(CallVO callVO);
}
