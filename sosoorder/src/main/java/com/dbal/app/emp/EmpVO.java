package com.dbal.app.emp;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EmpVO {
	String firstName;
	String lastName;
	String email;
	String hireDate;
	String employeeId;
	String jobId;
	String departmentId;
	Integer salary;
	Integer[] employeeIds;
	
	
	@Builder
	public EmpVO(String firstName, String lastName, String email, String hireDate, String employeeId, String jobId,
			String departmentId, Integer salary, Integer[] employeeIds) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.hireDate = hireDate;
		this.employeeId = employeeId;
		this.jobId = jobId;
		this.departmentId = departmentId;
		this.salary = salary;
		this.employeeIds = employeeIds;
	}
	
	
}
