<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<div>
 <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">쿠폰등록</h1>
    </div>
    
    <!-- https://sgroom.tistory.com/60 -->
    <div>
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
			
			<button class="btn btn-success btn-icon-split fr" id="btnInsert">
	          <span class="icon text-white-50"><i class="fas fa-check"></i></span>
	          <span class="text">쿠폰등록하기</span>
	        </button>
	    </form>
	</div> 
</div> 
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
<script>
$(function(){
	

//couponInsert 요청
	$('#btnInsert').on('click',function(){
		$.ajax({ 
		    url: "storeCouponInsert",  
		    type: 'POST',  
		    dataType: 'json', 
		    data: $("#storeCouponInsert").serialize(),
		    success: function(response) {
		    	window.close();
		    } 
		 });  
	});//등록 버튼 클릭



});

</script>


