package com.soso.app.user.service;

import java.util.List;
import java.util.Map;

import com.soso.app.admin.service.AdminVO;

public interface UserService {
	//사업자정보
	public AdminVO storeInfo(AdminVO adminVO);
	
	//조회
	public UserVO getUser(UserVO userVO);
	//등록
	public List<Map> getRole(UserVO userVO);
}
