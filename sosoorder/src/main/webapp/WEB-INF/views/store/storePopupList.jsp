<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" />
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<!-- Page Heading -->
<div
	class="d-sm-flex align-items-center justify-content-between mb-4 pd15 mt30"
	style="border-bottom: 1px solid #d2d2d2">
	<h1 class="h3 mb-0 text-gray-800">좌석 및 팝업관리</h1>
</div>

<script>
	// 테이클 칸을 클릭하면 인풋태그로 값 가져가는 거.
	$(function() {
		//목록
		var otable = $('#table_idd').DataTable({
			searching: false,
            paging: false,
            info: false,
			ordering:  false,
			responsive: true
		});
		$('#table_idd').on('click', 'tr', function() {
			
			$(this).children().eq(0).text();
			$("#seatNum").val($(this).children().eq(0).text());

			$(this).children().eq(1).text();
			$("#seat").val($(this).children().eq(1).text());
		});

		//삭제
		$('.seatDelete').on('click', function() {
			location.href = 'seatDelete?seatNum=' + $(this).find(".seatNum").val()
		});
		
		//수정
		$('.seatUpdate').on('click', function() {
			location.href = 'seatUpdate?seatNum=' + $(this).find(".seatNum").val()
		});
	});
</script>

<div class="row">

	<div class="col-12">
		<div class="mb-4 pd15">
			<h1 class="h4 mb-0">좌석 관리</h1>
		</div>
		<div id="seatList">
			<div class="col-6 fl">
				<table id="table_idd" class="display tb_style" style="width: 100%">
					<thead align="center">
						<tr>
							<th style="display: none">seatNum</th>
							<th>테이블 번호</th>
							<th>사용 유/무</th>
							<th>사용 변경</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach items="${SeatList}" var="List">
							<tr>
								<td style="display: none">${List.seatNum}</td>
								<td>${List.seat}</td>
								<c:choose>
								<c:when test="${List.userCheck==1}">
								<td>사용가능</td>
								</c:when>
								<c:otherwise>
								<td>사용불가</td>
								</c:otherwise>
								</c:choose>
								
								<c:choose>
								<c:when test="${List.userCheck==1}">
								<td><div class="btn btn-outline-danger seatDelete" ><input type="hidden" value="${List.seatNum}" class="seatNum">사용 안함</div></td>
								</c:when>
								<c:otherwise>
								<td><div class="btn btn-outline-danger seatUpdate" ><input type="hidden" value="${List.seatNum}" class="seatNum">좌석 배정</div></td>
								</c:otherwise>
								</c:choose>
								
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<form action="seatInsert" method="post" class="col-6 fr">
				<div>
					<p class="mb11">등록하고자 하는 좌석 번호를 입력하고<br>등록 버튼을 눌러주세요</p>
					<input type="hidden" class="seatNum mt11" name="seatNum" placeholder="seatNum">
					<input type="text" id="seat" name="seat" class="form-control" placeholder="테이블 번호">
					<input type="submit" class="btn btn-success col mt11" value="새 테이블 등록">
				</div>
			</form>
		</div>
		
	</div>
	<div class="col-12" style="border-top: 1px solid #d2d2d2;margin-top: 50px; ">
		<div class="mb-4 pd15 mt30">
			<h1 class="h4 mb-0">팝업 관리</h1>
		</div>
		<div>
			<table id="table_id" class="display" width="100%">
				<thead>
					<tr>
						<th width="10%">NO.</th>
						<th width="15%">제목</th>
						<th width="15%">시작일</th>
						<th width="15%">종료일</th>
						<th width="15%" class="center">사용유무</th>
						<th width="10%" class="center">삭제</th>
					</tr>
				</thead>
				<tbody id="tblBody">
				</tbody>
			</table>
		</div>
		
		<div class="fr">
			<input type="button" class="btn btn-danger mt11"
				onClick="location.href='storePopupInsertForm'" value="팝업등록" />
		</div>

	</div>
</div>

<script>
	$(function() {
		popList();
		popDelete();
		popOne();
	});
	//목록

	function popList() {
		
		var otable = $('#table_id')
				.DataTable(
						{
							ajax : {
								url : 'storePopupList',
								dataSrc : ''
							},
							columns : [
									{
										data : "popNum"
									},
									{
										data : "popTitle"
									},
									{
										data : "startDay"
									},
									{
										data : "endDay"
									},
									{
										data : 
									 		if( "popCheck" == 1){
												"사용가능" 									 			
									 		}
											
											/*  "popCheck"  */
									},
									{
										data : null,
										render : function(data, type, row) {
											return "<a class=\'btnDelete\' name=\'" + data.popNum + "\'><i class=\'fa fa-trash\' aria-hidden=\'true\'></i></a>";
										}
									} ],
									searching: false,
						             paging: false,
						             info: false,
									 ordering:  false,
									 responsive: true
						});
	}

	//삭제 요청
	function popDelete() {
		//삭제 버튼 클릭
		$('#tblBody').on('click', '.btnDelete', function() {
			var popNum = $(this).attr("name");
			var result = confirm(popNum + " 팝업을 정말로 삭제하시겠습니까?");
			if (result) {
				$.ajax({
					url : "storePopupDelete/" + popNum,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						location.reload();
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//popDelete

	//조회 요청
	function popOne() {
		//쿠폰 조회
		$('#tblBody').on('click', 'tr', function() {
			var popNum = $(this).children().first().text();
			location.href = "storePopupOne?popNum=" + popNum
		});//조회 버튼 클릭
	}//popOne
</script>

<script>
	$(function(){
		if($(window).width() >768) { 
			$( '.navbar-nav li.li_1 a.nav-link' ).removeClass( 'collapsed' );
			$( '.navbar-nav li.li_1 a.nav-link' ).attr("aria-expanded", "true");
			$( '.navbar-nav li.li_1 #collapseTwo' ).addClass("show");
			$('.navbar-nav li.li_1 #collapseTwo .collapse-item:nth-child(5)').css("backgroundColor", "#eaecf4")
		}
	});
</script>