package com.soso.app.store.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StorePopupVO {
	MultipartFile uploadFile;
	
	String popNum;
	String popTitle;
	String popContents;
	String popCheck;
	String storeId;
	String popImage;
	String startDay;
	String endDay;
}
