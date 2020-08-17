<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800 insertTitle">호출 <i class="fa fa-times insert_ex_dtn" aria-hidden="true"></i></h1>
    </div>
 <div class="callInsert_wrap row">   
	<select name="seat" id="seat" class="input-group fl col-12">
    	<option value="" class="fi">테이블 선택</option>
	</select>
	<input type="text" id="message" class="input-group fr col-12" placeholder="요청사항을 입력하세요"/>
	<input type="button" id="sendBtn" class="btn btn-primary fr col-12 " value="요청"/>
	
	<input type="hidden" id="msg" class="input-group"/>
	<!-- <div id="messageArea"></div> -->

</div>

<script type="text/javascript">
	$("#sendBtn").click(function() {
		msg = { cmd :'callInsert', 
			    seatNum : $("#seat").val(),
				callContents : $("#message").val(), 
				storeId: '${sessionScope.storeInfo}'}
		$('#msg').val(JSON.stringify(msg));
		
		dbInsert();
		$('#message').val('')
	});

	
	// 메세지 db에 저장
	function dbInsert(){
		//등록 버튼 클릭
		var msg = $('#msg').val();
		console.log(msg);
		$.ajax({ 
		    url: "/sosoroder/callInsert",  
		    type: 'POST',  
		    dataType: 'json', 
		    data: msg,
		    contentType:'application/json',
		    success: function(data) { 
		    	msg = { cmd :'callInsert', 
					    seatNum : $("#seat").val(),
						msg : $("#message").val(), 
						store: '${sessionScope.storeInfo}'}
		    	sendMessage(msg);
		    },
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	}//dbInsert
	
	// 좌석
	$(function(){
		seatList();
	})
	
	function seatList(){
		$.ajax({ 
		    url: "/sosoroder/seatList",  
		    type:'GET',
			contentType:'application/json',
			dataType:'json',
		    success:seatListResult,
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	}//seatList
	//call 목록 조회 응답
    			
    			
	function seatListResult(data) {
		$.each(data,function(idx,item){
			$('#seat').find('.fi')
			.after('<option class="seat_' + item.seat + '" value="' + item.seat + '"' +
						'<c:if test="${param.seat==' + item.seat + '}">selected="selected"</c:if>>' +
					    '테이블번호 :'+ item.seat + '</option>');
			
			$('#seat .seat_${sessionScope.seat}').attr('selected', 'selected');
			
		});//each
	}//seatListResult
</script>