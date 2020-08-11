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
	<h1 class="h3 mb-0 text-gray-800">점포관리 - 좌석관리</h1>
</div>
<div style="margin-left:300px">
	<h3>좌석 목록</h3>
</div>
<br>
<div class="row">
	<div class="col">
		<div id="seatList">
			<table id="table_id" class="display tb_style">
				<thead align="center">
					<tr>
						 <th>No.</th>
						 <th>테이블 번호</th> 
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${SeatList}" var="List">
						<tr>
							 <td>${List.seatNum}</td> 
							 <td>${List.seat}</td> 
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col">
		<form action="seatInsert" method="post" enctype="multipart/form-data">
			<div>
				<div align="center">
					<h3>좌석등록</h3>
				</div>
				<br> <br>
				<div align="center">
					<p></p>
					<span> <span>
					<input type="hidden" id="seatNum" name="seatNum"
							placeholder="테이블 번호"></span>
							<input type="text" id="seat" name="seat"
							placeholder="테이블 번호"></span>

					<span><input type="submit" class="btn btn-success"
						value="테이블등록" /></span> <span> <input type="button"
						class="btn btn-danger" id="seatDelete" value="테이블삭제" /></span>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	$(function() {
		//목록
		var otable = $('#table_id').DataTable({});
		$('#table_id tbody').on('click', 'tr', function() {
			console.log($(this));
			$(this).children().eq(0).text();
			$("#seatNum").val($(this).children().eq(0).text());
			$(this).children().eq(1).text();
			$("#seat").val($(this).children().eq(1).text());
		});

		//삭제
		$('#seatDelete').on('click', function seatDelete() {
			location.href = 'seatDelete?seatNum=' + $("#seatNum").val()
		});
	});
</script>
<br>
<br>
