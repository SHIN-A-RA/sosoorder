<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css"/>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<style>
#ui-datepicker-div{z-index:9999 !important;}
</style>
 <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15 mt30" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">점포관리 - 쿠폰관리</h1>
    </div>
    
<div class="row">
	<div class="col">
		<div>
			<table id="table_id" class="display" width="100%">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    	쿠폰 등록
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쿠폰 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
	   	 <form class="pd30 pd_t0 pd_b0" id="storeCouponInsert">
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">시작날짜</span>
					</div>
					<input type="text" name="expStart" class="form-control expStart" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">종료날짜</span>
					</div>
					<input type="text" name="expEnd" class="form-control expEnd" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">할인금액</span>
					</div>
					
					<select name="discount" class="form-control" aria-describedby="basic-addon1" >
					    <option value="">할인금액선택</option>
					    <option value="1000">1000원 할인</option>
					    <option value="2000">2000원 할인</option>
					    <option value="3000">3000원 할인</option>
					</select>
					
				</div>
			</div>
				
			</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="btnInsert" >쿠폰등록하기</button>
        </div>
      </div>
    </div>
  </div>
  

<script>
	$(function() {
		couponList();
		couponDelete();
		couponInsert();
		couponOne();
		couponUpdate()
	});
	//목록
	function couponList(){
		var otable = $('#table_id').DataTable(
			{ajax: {url:'storeCouponList', dataSrc:''},
				columns:[
						{data:"serialNum"},
						{data:"expStart"},
						{data:"expEnd"},
						{data:"discount"},
						{
							data: null,
							render: function ( data, type, row ) {
								return "<a class=\'btnDelete\' name=\'" + data.serialNum + "\'><i class=\'fa fa-trash\' aria-hidden=\'true\'></i></a>";
								}
						}
					]
			});
	}
	
	//삭제 요청
	function couponDelete() {
		//삭제 버튼 클릭
		$('#tblBody').on('click','.btnDelete',function(){
			var serialNum = $(this).attr("name");
			var result = confirm(serialNum +" 쿠폰을 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					 url: "storeCouponDelete/" + serialNum, 
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
	}//couponDelete
	
	//등록 요청
	function couponInsert(){
		//couponInsert 요청
		$('#btnInsert').on('click',function(){
			$.ajax({ 
			    url: "storeCouponInsert",  
			    type: 'POST',  
			    dataType: 'json', 
			    data: $("#storeCouponInsert").serialize(),
			    success: function(response) {
			    	location.reload();
			    } 
			 });  
		});//등록 버튼 클릭
	}//couponInsert
	
	//조회 요청
	function couponOne(){
		//쿠폰 조회
		$('#tblBody').on('click', 'tr', function() {
			$(this).attr('data-toggle', 'modal');
			$(this).attr('data-target', '#myModal2');
			var serialNum = $(this).children().first().text();
			//특정 쿠폰 조회
			$.ajax({
				url:'storeCouponOne?serialNum=' + serialNum,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:couponSelectResult
			});
		});//조회 버튼 클릭
	}//couponOne
	
	//쿠폰 조회 응답
	function couponSelectResult(coupon) {
		$('#storeCouponUpdate').find('input:hidden[name="serialNum"]').val(coupon.serialNum);
		$('#storeCouponUpdate').find('input:text[name="expStart"]').val(coupon.expStart);
		$('#storeCouponUpdate').find('input:text[name="expEnd"]').val(coupon.expEnd);
		$('#storeCouponUpdate').find('select[name="discount"]').val(coupon.discount).attr("selected", "selected");
	}//couponSelectResult
	
	//수정 요청
	function couponUpdate(){
		//couponUpdate 요청
		var serialNum = $('#storeCouponUpdate').find('input:text[name="serialNum"]').val();
		$('#btnUpdate').on('click',function(){
			$.ajax({ 
			    url: "storeCouponUpdate",  
			    type: 'POST',  
			    dataType: 'json', 
			    data: $("#storeCouponUpdate").serialize(),
			    success: function(response) {
			    	location.reload();
			    } 
			 });  
		});//수정 버튼 클릭
	}//couponUpdate
	
	
</script>
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( ".expStart" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $(".expEnd").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( ".expEnd" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 /* maxDate: 0,  */                      // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $(".expStart").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script>

<!-- update Modal -->
 <!-- The Modal -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쿠폰 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
	   	 <form class="pd30 pd_t0 pd_b0" id="storeCouponUpdate">
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">시작날짜</span>
					</div>
					<input type="text" name="expStart" class="form-control expStart" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">종료날짜</span>
					</div>
					<input type="text" name="expEnd" class="form-control expEnd" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">할인금액</span>
					</div>
					
					<select name="discount" class="form-control" aria-describedby="basic-addon1" >
					    <option value="">할인금액선택</option>
					    <option value="1000">1000원 할인</option>
					    <option value="2000">2000원 할인</option>
					    <option value="3000">3000원 할인</option>
					</select>
					
				</div>
			</div>
				<input type="hidden" name="serialNum" class="serialNum" value="">
			</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="btnUpdate" >쿠폰수정하기</button>
        </div>
      </div>
    </div>
  </div>
<script>
	$(function(){
		if($(window).width() >768) { 
			$( '.navbar-nav li.li_1 a.nav-link' ).removeClass( 'collapsed' );
			$( '.navbar-nav li.li_1 a.nav-link' ).attr("aria-expanded", "true");
			$( '.navbar-nav li.li_1 #collapseTwo' ).addClass("show");
			$('.navbar-nav li.li_1 #collapseTwo .collapse-item:nth-child(7)').css("backgroundColor", "#eaecf4")
		}
	});
</script>
