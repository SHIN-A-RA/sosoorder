package com.soso.app.order.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MessageVO {
	String cmd;  //주문접수(고객->스토어), 조리시작알림, 조리완료알림  //
	String msg;
	String member;
	String store;
	

	

}
