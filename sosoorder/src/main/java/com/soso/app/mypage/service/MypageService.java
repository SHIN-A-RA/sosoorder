package com.soso.app.mypage.service;

import java.util.List;
import java.util.Map;

import com.soso.app.member.service.MemberVO;

public interface MypageService {

	public List<Map> getPointsList(MemberVO memberVO);
	public List<Map> getStoreList(MemberVO memberVO);

	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
