<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			<form action="empInsert" method="post" name="frm" id="frm">
				<table border ="2" id="table_id" >
					<thead>
					<tr>
						<th>직원이름</th>
						<th>업무파트</th>
						<th>직원생일</th>
						<th>입사일</th>
						<th>급여</th>
						<th>급여일</th>
						<th>전화번호</th>
						<th>직급</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${oneEmp}" var="one">
					<tr>
						<td><input type="text" name="empName" id="empName" value="${one.empName}"  /></td>
						<td><input type="text" name="workPart" id="workPart" value="${one.workPart}" /></td>
						<td><input type="text" name="hireDate" id="hireDate"  value="${one.hireDate}"/></td>
						<td><input type="text" name="salary" id="salary" value="${one.salary}" /></td>
						<td><input type="text" name="salaryDay" id="salaryDay" value="${one.salaryDay}"  /></td>
						<td><input type="text" name="empPhone" id="empPhone" value="${one.empPhone}"/></td>
						<td><input type="text" name="empClass" id="empClass" value="${one.empClass}" /></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<input type="submit" class="login pull-right" value="직원등록">
				</form>
			

