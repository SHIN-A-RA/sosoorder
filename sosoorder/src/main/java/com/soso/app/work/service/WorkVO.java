package com.soso.app.work.service;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class WorkVO {//11개
	String empNum; //insert view 입력 제외
	String workStart;
	String workEnd;

}
