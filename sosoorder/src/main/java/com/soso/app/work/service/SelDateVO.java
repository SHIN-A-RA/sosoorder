package com.soso.app.work.service;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
//Full Calendar에서 선택한 날짜를 List에 뿌려주기 위한 VO 입니다.
public class SelDateVO {
	String selectDate;
	String storeId;
	String selectMonth;
	String empNum;
}
