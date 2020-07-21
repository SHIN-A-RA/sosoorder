package com.soso.app.point.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.soso.app.menu.service.MenuVO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PointVO {
	String pointNum;
	String pointDate;
	String point;
	String storeId;
	Integer memberNum;
	String pointCheck;


}
