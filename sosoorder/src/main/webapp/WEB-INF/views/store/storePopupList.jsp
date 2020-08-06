<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css"/>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

 <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">팝업관리</h1>
    </div>
    
<div class="row">
	<div class="col">
		<div>
			<table id="table_id" class="display" width="100%">
				<thead>
					<tr>
						<th width="10%">NO.</th>
						<th width="30%">제목</th>
						<th width="20%">시작일</th>
						<th width="20%">종료일</th>
						<th width="15%" class="center">사용유무</th>
						<th width="5%" class="center">삭제</th>
					</tr>
				</thead>
				<tbody id="tblBody">
				</tbody>
			</table>
		</div>
	</div>
</div>

<div align="right">
	<input type="button" class="btn btn-danger"
		onClick="location.href='storePopupInsertForm'" value="등록" />
</div>
<script>
	$(function() {
		popList();
		popDelete();
		popOne();
	});
	//목록
	function popList(){
		var otable = $('#table_id').DataTable(
			{ajax: {url:'storePopupList', dataSrc:''},
				columns:[
						{data:"popNum"},
						{data:"popTitle"},
						{data:"startDay"},
						{data:"endDay"},
						{data:"popCheck"},
						{
							data: null,
							render: function ( data, type, row ) {
								return "<a class=\'btnDelete\' name=\'" + data.popNum + "\'><i class=\'fa fa-trash\' aria-hidden=\'true\'></i></a>";
								}
						}
					]
			});
	}
	
	//삭제 요청
	function popDelete() {
		//삭제 버튼 클릭
		$('#tblBody').on('click','.btnDelete',function(){
			var popNum = $(this).attr("name");
			var result = confirm(popNum +" 팝업을 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					 url: "storePopupDelete/" + popNum, 
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						location.reload();
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//popDelete
	
	//조회 요청
	function popOne(){
		//쿠폰 조회
		$('#tblBody').on('click', 'tr', function() {
			var popNum = $(this).children().first().text();
			location.href = "storePopupOne?popNum=" + popNum
		});//조회 버튼 클릭
	}//popOne
	

</script>