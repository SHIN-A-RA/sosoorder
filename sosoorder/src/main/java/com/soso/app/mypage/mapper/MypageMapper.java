package com.soso.app.mypage.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.member.service.MemberVO;



public interface MypageMapper {


	public List<Map> getPointsList(MemberVO memberVO);
	
	public List<Map> getStoreList(MemberVO memberVO);

	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
