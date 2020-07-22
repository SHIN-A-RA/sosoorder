package com.soso.app.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soso.app.member.service.MemberVO;
import com.soso.app.order.service.OrderCptVO;

public interface MypageService {

	//public List<Map> getPointsList(MemberVO memberVO);
	public List<Map> getPointsList(HashMap<String, Object> map);
	
	public List<Map> getStoreList(MemberVO memberVO);
	public List<Map> getOrderList(MemberVO memberVO);
	public void orderStarUpdate(OrderCptVO ordercptVO);
	public List<Map> StarOrderList(MemberVO memberVO);


	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
