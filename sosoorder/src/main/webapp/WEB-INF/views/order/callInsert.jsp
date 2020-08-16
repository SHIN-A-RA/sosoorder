<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800 insertTitle">호출 <i class="fa fa-times insert_ex_dtn" aria-hidden="true"></i></h1>
    </div>
 <div class="callInsert_wrap">   
	<select name="seat" id="seat" class="input-group fl">
    	<option value="">테이블 선택</option>
    	<c:forEach items="${seatListCall}" var="seat">
    			<option value="${seat.seat}"
    			<c:if test="${seat.seat == seatCheck.seat}">selected="selected"</c:if>
    			>테이블번호 : ${seat.seat}</option>
    		
    	</c:forEach>
	</select>
	<input type="text" id="message" class="input-group fr" placeholder="요청사항을 입력하세요"/>
	<input type="button" id="sendBtn" class="btn btn-primary fr" value="요청"/>
	
	<input type="hidden" id="msg" class="input-group "/>
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
		    url: "callInsert",  
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
</script>