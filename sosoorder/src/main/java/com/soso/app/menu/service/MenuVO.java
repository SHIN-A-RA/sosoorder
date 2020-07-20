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

}
