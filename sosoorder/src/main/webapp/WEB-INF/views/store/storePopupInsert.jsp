<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<div>
 <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">팝업등록</h1>
    </div>
    
    <div>
	    <form class="pd30 pd_t0 pd_b0" id="storePopupInsert" action="storePopupInsert" method="post">
			<div class="row">
				<div class="checkbox-container">
					<label for="is-subscription">사용유무</label>
					<input type="checkbox" name="popChack" value="1" id="is-subscription" checked>
				</div>
			</div>
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">제&nbsp;&nbsp;목</span>
					</div>
					<input type="text" name="popTitle" class="form-control popTitle" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb11 col pd_l0" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">시작일</span>
					</div>
					<input type="text" name="expStart" class="form-control expStart" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			
				<div class="input-group mb11 col pd_r0" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">종료일</span>
					</div>
					<input type="text" name="expEnd" class="form-control expEnd" aria-label="" aria-describedby="basic-addon1" value="">
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">내&nbsp;&nbsp;용</span>
					</div>
					<textarea cols="30" rows="10"
					name="popContents" class="form-control popContents"
					aria-label="" aria-describedby="basic-addon1" 
					> </textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">이미지</span>
					</div>
					
					<input type="file"	name="uploadFile" class="form-control uploadFile" aria-label="" aria-describedby="basic-addon1" value="">
				
				</div>
			</div>
			
			
			
			<button type="submit" class="btn btn-success btn-icon-split fr" id="btnInsert">
	          <span class="icon text-white-50"><i class="fas fa-check"></i></span>
	          <span class="text">팝업등록하기</span>
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


