<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	
	
<!-- Page Heading -->
<div
	class="d-sm-flex align-items-center justify-content-between mb-4 pd15"
	style="border-bottom: 1px solid #d2d2d2">
	<h1 class="h3 mb-0 text-gray-800">점포관리 - 회원 리스트</h1>
</div>
<div align="center">
	<h3>회원 리스트</h3>
</div>
<div class="row">
	<div class="col">
		<div id="storeMemberList">
			<table id="table_id" class="display">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>주소</th>
						<th>적립금</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${storeMemberList}" var="List">
						<tr>
							<td>${List.phone}</td>
							<td>${List.delAddr}</td>
							<td>${List.point}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	$(function() {
		//목록
		var otable = $('#table_id').DataTable({
		});
		
		

		//삭제
		/* $('#seatDelete').on('click', function() {
			location.href = 'seatDelete?seatNum=' + $("#seatNum").val()
		}); */
	});
</script>

<br>
<br>
<br>
<div align="right">
	<input type="button" class="btn btn-danger"
		onClick="location.href='storeMemberUpdate'" value="등록" />
</div>