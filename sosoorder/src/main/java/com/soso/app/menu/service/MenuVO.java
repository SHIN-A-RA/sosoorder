package com.soso.app.menu.service;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MenuVO {
	@JsonIgnore
	MultipartFile uploadFile;
	@JsonIgnore
	String orderStarAll;
	
	String menuNum;
	String menuName;
	String menuPrice;
	String menuImage;
	String menuCategory;
	String menuContents;
	String menuCheck;
	String storeId;

}
