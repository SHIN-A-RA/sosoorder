package com.soso.app.menu.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MenuVO {
	
	MultipartFile uploadFile;
	
	
	String menuNum;
	String menuName;
	String menuPrice;
	String menuImage;
	String menuCategory;
	String menuContents;
	String menuCheck;
	String storeId;

}
