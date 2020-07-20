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
	String storeCd;
	
	
	public MenuVO(String menuNum, String menuName, String menuPrice, String menuImage, String menuCategory,
			String menuContents, String menuCheck, String storeCd) {
		super();
		this.menuNum = menuNum;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuImage = menuImage;
		this.menuCategory = menuCategory;
		this.menuContents = menuContents;
		this.menuCheck = menuCheck;
		this.storeCd = storeCd;
	}
	

}
