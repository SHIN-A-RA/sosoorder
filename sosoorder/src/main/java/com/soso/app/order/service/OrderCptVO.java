package com.soso.app.order.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.soso.app.menu.service.MenuVO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderCptVO {
	String menuOrderNum;
	String orderStar;
	String menuNum;
	String orderCount;
	String orderNum;
	String paynum;
	String price;
	
	MenuVO menuVO;

}
