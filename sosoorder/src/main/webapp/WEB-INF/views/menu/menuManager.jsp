<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#un {
	text-decoration: underline;
}
</style>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
				
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	
<div class="slick_box menu_category">
	<div class="menu_bar">
		<div>
			<a>양식</a>
		</div>
		<div>
			<a>중식</a>
		</div>
		<div>
			<a>한식</a>
		</div>
		<div>
			<a>경양식</a>
		</div>
		<div>
			<a>분식</a>
		</div>
		<div>
			<a>편의점음식</a>
		</div>
	</div>

	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left"
		aria-hidden="true"></i></span> <span class="next" id="aro_next1"><i
		class="fa fa-caret-right" aria-hidden="true"></i></span>
</div>
<div>
	<h3 id="un">메뉴관리</h3>
</div>
<br>
<br>
<br>
<br>
<br>
<div class="row">
	<div class="col">
		<div>목록</div>
		<div id="empList">
			<table id="table_id" class="display">
				<thead>
					<tr>
						<th>번호</th>
						<th>메뉴 카테고리</th>
						<th>메뉴 이름</th>
						<th>가격</th>
						<th>주/부 메뉴 코드</th>
						<th>메뉴 소개</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${menuManager}" var="menu">
					<tr>
						<td>${menu.menuNum}</td> 
						<td>${menu.menuCategory}</td>
						<td>${menu.menuName}</td>
						<td>${menu.menuPrice}</td>
						<td>${menu.menuCheck}</td>
						<td>${menu.menuContents}</td>
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

		$('#table_id').DataTable({});
	});
	
</script>
<br>
<br>
<br>
<div align="right">
	<button type="button" class="btn btn-danger"
		onClick="location.href='menuInsert'">등록</button>
</div>

<script>
	$('.menu_bar').slick({
		autoplay : false,
		dots : false,
		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
		infinite : false,
		autoplaySpeed : 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		prevArrow : $('#aro_prev1'),
		nextArrow : $('#aro_next1'),
		arrows : true,
		slidesToShow : 5,
		slidesToScroll : 5,
		fade : false
	});
</script>
