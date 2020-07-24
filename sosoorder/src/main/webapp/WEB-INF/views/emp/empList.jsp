<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <h2>Table Head Colors</h2>
  <p>The .thead-dark class adds a black background to table headers, and the .thead-light class adds a grey background to table headers:</p>
  <table class="table">
    <thead class="thead-dark">
		<tr>
			<th scope="col">직원번호</th>
			<th scope="col">직원이름</th>
			<th scope="col">업무파트</th>
			<th scope="col">생일</th>
			<th scope="col">입사일</th>
			<th scope="col">급여</th>
			<th scope="col">퇴사일</th>
			<th scope="col">휴대전화</th>
			<th scope="col">월급날</th>
			<th scope="col">직급</th>
			<th scope="col">사업주</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${empList}" var="emp">
			<tr>
				<td>${emp.empNum}</td>
				<td>${emp.empName}</td>
				<td>${emp.workPart}</td>
				<td>${emp.empBirth}</td>
				<td>${emp.hireDate}</td>
				<td>${emp.salary}</td>
				<td>${emp.endDate}</td>
				<td>${emp.empPhone}</td>
				<td>${emp.salaryDay}</td>
				<td>${emp.empClass}</td>
				<td>${emp.storeId}</td>
				<td><button type="button" onclick="empEditForm?empNum=${emp.empNum}" >수정</button></td>
				<td><button type="button" onclick="location.href='empDelete?empNum=${emp.empNum}'" >삭제</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
	<button type="submit"  class="btn btn-danger" >직원등록</button>
