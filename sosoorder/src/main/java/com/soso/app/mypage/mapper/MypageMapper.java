package com.soso.app.mypage.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soso.app.member.service.MemberVO;
import com.soso.app.mypage.service.UserCouponVO;
import com.soso.app.order.service.OrderCptVO;



public interface MypageMapper {


//	public List<Map> getPointsList(MemberVO memberVO);
	public List<Map> getPointsList(HashMap<String, Object> map);
	public List<Map> getStoreList(MemberVO memberVO);
	public List<Map> getOrderList(HashMap<String, Object> map);
	public void orderStarUpdate(OrderCptVO ordercptVO);
	public List<Map> StarOrderList(HashMap<String, Object> map);
	public List<Map> getCoupon(HashMap<String, Object> map);
	/* public List<Map<String, Object>> getEmpMap(); */
}
