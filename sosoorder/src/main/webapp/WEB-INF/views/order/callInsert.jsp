<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<style>
.callInsert_wrap{padding:30px}
.callInsert_wrap #seat{width:25%; height:45px;}
.callInsert_wrap #message{width:58%; height:45px;}
.callInsert_wrap #sendBtn{width:15%; height:45px;}
</style>
	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">호출</h1>
    </div>
 <div class="callInsert_wrap">   
	<select name="seat" id="seat">
    	<option value="">테이블 선택</option>
    	<c:forEach items="${seatListCall}" var="seat">
    			<option value="${seat.seat}"
    			<c:if test="${seat.seat == seatCheck.seat}">selected="selected"</c:if>
    			>테이블번호 : ${seat.seat}</option>
    		
    	</c:forEach>
	</select>
	<input type="text" id="message" placeholder="요청사항을 입력하세요"/>
	<input type="button" id="sendBtn" value="요청하기"/>
	<input type="hidden" id="msg"/>

</div>

<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost/sosoroder/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		msg = { seatNum : $("#seat").val(),
				callContents : $("#message").val() }
		sock.send(JSON.stringify(msg)); 
		
		$('#msg').val(JSON.stringify(msg));
		dbInsert();
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		console.log(msg);
		msg = JSON.parse(msg.data);
		var data = msg.seat + " table. "+ msg.msg;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
	
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
		    },
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	}//dbInsert
</script>