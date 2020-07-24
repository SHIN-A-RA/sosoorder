<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


 <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">쿠폰관리</h1>
    </div>
    
<div class="row">
	<div class="col">
		<div>
			<table id="table_id" class="display">
				<thead>
					<tr>
						<th width="19%">시리얼NO.</th>
						<th width="29%">시작날짜</th>
						<th width="29%">종료날짜</th>
						<th width="19%">할인가격</th>
						<th width="6%" class="center">삭제</th>
					</tr>
				</thead>
				<tbody id="tblBody">
				</tbody>
			</table>
		</div>
	</div>
</div>
<div align="right">
	<input type="button" class="btn btn-danger" value="등록" 
	onclick="window.open('storeCouponInsertForm','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
	/>
</div>
<script>
	$(function() {
		//목록
		var otable = $('#table_id').DataTable(
				{ajax: {url:'storeCouponList', dataSrc:''},
					columns:[
						{data:"serialNum"},
						{data:"expStart"},
						{data:"expEnd"},
						{data:"discount"}]
				});
		
	/* 	$('#tblBody').find("<tr>").eq(4).append(
				"<td class=\'center\'>"+
				"<a id=\'btnDelete\'>"+
					"<i class=\'fa fa-trash\' aria-hidden=\'true\'></i>"+
				"</a>"+
				"</td>"
			); */
		/* $('#table_id tbody').on('click', 'tr', function() {
			var data = otable.row(this).data();
			var col1 = data[0];
			location.href="storeCouponUpdate?sericalNum="+col1
		}); */
	});
	
	
</script>
<script>
$(function() {
	//couponInsert 요청
	$('#btnDelete').on('click',function(){
		var serialNum = $(this).closest('tr').find('.serialNum').text();
		console.log(serialNum)
		$.ajax({ 
		    url: "storeCouponDelete/" + serialNum,  
		    type: 'DELETE',  
		    success: function(response) {
		    	alert("삭제되었습니다.");
		    } 
		 });  
	});//등록 버튼 클릭
	
/* 	couponList();
	//사용자 목록 조회 요청
	function couponList() {
		$.ajax({
			url:'storeCouponList',
			type:'GET',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:couponListResult
		});
	}//couponList
	
	//사용자 목록 조회 응답
	function couponListResult(data) {
		$.each(data,function(idx,item){
			var tr = $('<tr>').append(
					"<td class=\'serialNum\'>" + item.serialNum + "</td>"+
					"<td>" + item.expStart + "</td>"+
					"<td>" + item.expEnd + "</td>"+
					"<td>" + item.discount + "</td>"+
					"<td class=\'center\'>"+
						"<a id=\'btnDelete\'>"+
							"<i class=\'fa fa-trash\' aria-hidden=\'true\'></i>"+
						"</a>"+
					"</td>"
				);
			
			$("#tblBody").append(tr);
			
		});//each
	}//userListResult */
});
</script>

