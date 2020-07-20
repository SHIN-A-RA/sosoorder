package com.soso.app.menu.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MenuVO {
	String menuNum;
	String menuName;
	String menuPrice;
	String menuImage;
	String menuCategory;
	String menuContents;
	String menuCheck;
	String storeId;
	public MenuVO(String menuNum, String menuName, String menuPrice, String menuImage, String menuCategory,
			String menuContents, String menuCheck, String storeId) {
		super();
		this.menuNum = menuNum;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuImage = menuImage;
		this.menuCategory = menuCategory;
		this.menuContents = menuContents;
		this.menuCheck = menuCheck;
		this.storeId = storeId;
	}
	
	
	
	
	
}
