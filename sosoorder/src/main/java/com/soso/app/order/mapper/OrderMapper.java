package com.soso.app.order.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.test.context.ContextConfiguration;

import com.soso.app.member.service.MemberVO;
import com.soso.app.order.service.OrderCptVO;

@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface OrderMapper {
	
	//주문메뉴리스트
	public List<Map<String, Object>> getOrder(OrderCptVO orderCptVO);	
	
	//by혜원, 총적립금 확인
	public List<OrderCptVO> getTotalPoint(OrderCptVO orderCptVO);	
	
	//by혜원, 쿠폰조회
	public List<Map<String, Object>> findCoupon(OrderCptVO orderCptVO);
	
	// 좌석조회
	public List<OrderCptVO> getSeat(OrderCptVO orderCptVO);	
	
	//결제등록
	public void payInsert(OrderCptVO orderCptVO);
	
	//결제프로시저
	public void paymentProc(HashMap<String, Object> map);
	
	//적립금적립하기
	public void insertPo(OrderCptVO orderCptVO);
	
	//적립금리스트
	public List<Map<String, Object>> showPoint(OrderCptVO orderCptVO);
	
	//비회원적립금하기
	public void insertMem(MemberVO memberVO);
	
	
	//비회원적립프로시저
	public void insertMemProc(OrderCptVO orderCptVO);
	
	//영수증 출력시 정보가져오기 
	public OrderCptVO receiptGet(OrderCptVO orderCptVO);
	
	//주소가져오기
	public List<OrderCptVO> getAddr(OrderCptVO orderCptVO);
	
}
