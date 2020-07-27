<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<div>
	<h3 id="un">좌석 등록</h3>
</div>
<div class="row">
	<div class="col">
		<div>목록</div>
		<div id="seatList">
			<table id="table_id" class="display">
				<thead>
					<tr>
						<th>테이블 번호</th>
						<th>좌석 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${SeatList}" var="List">
						<tr>
							<td>${List.seatNum}번</td>
							<td>${List.seat}인석</td>
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
		var otable = $('#table_id').DataTable({})
	});
</script>

