<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 
<script>
	$(function() {
		var inTable = $('#empList').DataTable({});
		$('#empList tbody').on('click', 'tr', function() {
			var data = inTable.row(this).data();
			var col1 = data[0];
			location.href = "empInsertForm?empNum="+col1
		});
	});
	
</script>

<div class="row">
	<div class="col">
		<table class="display" id="empList">
			<thead class="thead-dark">
				<tr>
					<th>직원번호</th>
					<th>직원이름</th>
					<th>업무파트</th>
					<th>생일</th>
					<th>입사일</th>
					<th>급여</th>
					<th>퇴사일</th>
					<th>휴대전화</th>
					<th>월급날</th>
					<th>직급</th>
					<th>사업주</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${emp}" var="emp">
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
					<td><c:choose>
					    <c:when test="${emp.empClass == 1}">
					        	아르바이트
					    </c:when>
					    <c:otherwise>정직원</c:otherwise>
					 </c:choose></td>   
						<td>${emp.storeId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<input type="button" class="btn btn-danger" onClick="location.href='empInsertForm'" value="등록" />
	</div>
</div>

