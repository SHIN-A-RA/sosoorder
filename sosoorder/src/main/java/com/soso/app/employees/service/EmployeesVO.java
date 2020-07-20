package com.soso.app.employees.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EmployeesVO {//11개
	String empNum; //insert view 입력 제외
	String empName;
	String workPart;
	String empBirth; //date
	String hireDate; //insert view 입력 제외 //date
	int salary;
	String endDate; //insert view 입력 제외 //date
	String empPhone; 
	String salaryDay;  //date
	String empClass; 
	String storeId; //insert view 입력 제외 Session값 가져와서 넣음 또는 sql쿼리문으로 입력 
}
