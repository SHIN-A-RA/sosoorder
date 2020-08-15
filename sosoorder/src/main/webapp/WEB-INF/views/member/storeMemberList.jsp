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
	<h1 class="h3 mb-0 text-gray-800">점포관리 - 회원 목록</h1>
</div>
<div align="center">
	<h3>회원 목록</h3>
</div>
<div class="row">
	<div class="col">
		<div id="storeMemberList">
			<table id="table_id" class="display tb_style">
				<thead>
					<tr>
						<th>핸드폰번호</th>
						<th>주소</th>
						<th>적립금</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${storeMemberList}" var="List">
						<tr name="${List.phone}">
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
		var otable = $('#table_id').DataTable({})
			$('#table_id tbody').on('click', 'tr', function() {
				console.log(col1);
				var col1 = $(this).attr("name");
				//var data = otable.row(this).data();
				//var col1 = data[1];
				location.href = "storeMemberUpdateForm?phone=" + col1
			});
		});
		
		

		//삭제
		/* $('#seatDelete').on('click', function() {
			location.href = 'seatDelete?seatNum=' + $("#seatNum").val()
		}); */
		
		

</script>
<script>
	$(function(){
		$( '.navbar-nav li.li_1 a.nav-link' ).removeClass( 'collapsed' );
		$( '.navbar-nav li.li_1 a.nav-link' ).attr("aria-expanded", "true");
		$( '.navbar-nav li.li_1 #collapseTwo' ).addClass("show");
		$('.navbar-nav li.li_1 #collapseTwo .collapse-item:nth-child(4)').css("backgroundColor", "#eaecf4")
		
	});
</script>
