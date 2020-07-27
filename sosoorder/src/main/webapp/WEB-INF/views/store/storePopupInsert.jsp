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
	    <form	class="pd30 pd_t0 pd_b0" id="storePopupInsert" enctype="multipart/form-data" 
	    		action="storePopupInsert" method="post">
			<div class="row">
				<div class="checkbox-container">
					<label for="is-subscription">사용유무
						<input type="checkbox" name="popCheck" value="1" id="is-subscription" checked>
					</label>
				</div>
			</div>
			<div class="row">
				<div class="input-group mb11">
					<div class="input-group-prepend">
						<span class="input-group-text">제&nbsp;&nbsp;목</span>
					</div>
					<input type="text" name="popTitle" class="form-control popTitle" aria-label="" aria-describedby="basic-addon1" value="${popupOne.popTitle}">
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb11 col pd_l0">
					<div class="input-group-prepend">
						<span class="input-group-text">시작일</span>
					</div>
					<input type="text" name="startDay" class="form-control datetimepicker startDay" aria-label="" aria-describedby="basic-addon1" value="${popupOne.startDay}">
				</div>
			
				<div class="input-group mb11 col pd_r0">
					<div class="input-group-prepend">
						<span class="input-group-text">종료일</span>
					</div>
					<input type="text" name="endDay" class="form-control datetimepicker endDay" aria-label="" aria-describedby="basic-addon1" value="${popupOne.endDay}">
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb11" id="">
					<div class="input-group-prepend">
						<span class="input-group-text">내&nbsp;&nbsp;용</span>
					</div>
					<textarea cols="30" rows="10"
					name="popContents" class="form-control popContents"
					aria-label="" aria-describedby="basic-addon1" 
					>${popupOne.popContents} </textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group" id="">
					<div class="custom-file">
						<div class="input-group-prepend">
							<span class="input-group-text">이미지</span>
						</div>
						<input type="file" name="uploadFile" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<p>현재파일:<span>${popupOne.popImage} </span>
					<input type="hidden" name="updateFile" value="${popupOne.popImage}">
				</p>
			</div>
			
			
			<input type="hidden" name="popNum" value="${popupOne.popNum}">
			<button type="submit" class="btn btn-success btn-icon-split fr" id="btnInsert">
	          <span class="icon text-white-50"><i class="fas fa-check"></i></span>
	          <span class="text">팝업등록하기</span>
	        </button>
	    </form>
	</div> 
</div> 

<!-- datetimepicker -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>

$(function() {
	$('.datetimepicker').appendDtpicker({
		'locale' : 'ko', // 한글화
		'autodateOnStart' : false, // 초기값 x
		'timelistScroll' : false, // 시간 자동 스크롤 x
		'closeOnSelected' : true, // 선택하면 선택창 x
		'minuteInterval' : 30 // 시간 간격 조절 (m)
	});
});


</script>


