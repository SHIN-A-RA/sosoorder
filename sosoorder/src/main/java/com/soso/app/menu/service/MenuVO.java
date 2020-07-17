package com.soso.app.menu.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MenuVO {
	String menunum;
	String menuname;
	String menuprice;
	String menuimage;
	String menucategory;
	String menucontents;
	String menucheck;
	String storeid;
	
	public MenuVO(String menunum, String menuname, String menuprice, String menuimage, String menucategory,
			String menucontents, String menucheck, String storeid) {
		super();
		this.menunum = menunum;
		this.menuname = menuname;
		this.menuprice = menuprice;
		this.menuimage = menuimage;
		this.menucategory = menucategory;
		this.menucontents = menucontents;
		this.menucheck = menucheck;
		this.storeid = storeid;
	}
	
	
	
}
