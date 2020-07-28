package com.soso.app.store.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StorePopupVO {
	@JsonIgnore
	MultipartFile uploadFile;
	
	String popNum;
	String popTitle;
	String popContents;
	String popCheck;
	String storeId;
	String popImage;
	String startDay;
	String endDay;
	
	@JsonIgnore
	private List<StorePopupVO> popList;
}
