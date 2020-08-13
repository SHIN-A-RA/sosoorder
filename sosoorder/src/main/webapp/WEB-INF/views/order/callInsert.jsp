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
      <h1 class="h3 mb-0 text-gray-800">ȣ��</h1>
    </div>
 <div class="callInsert_wrap">   
	<select name="seat" id="seat">
    	<option value="">���̺� ����</option>
    	<c:forEach items="${seatListCall}" var="seat">
    			<option value="${seat.seat}"
    			<c:if test="${seat.seat == seatCheck.seat}">selected="selected"</c:if>
    			>���̺��ȣ : ${seat.seat}</option>
    		
    	</c:forEach>
	</select>
	<input type="text" id="message" placeholder="��û������ �Է��ϼ���"/>
	<input type="button" id="sendBtn" value="��û�ϱ�"/>
	<input type="hidden" id="msg"/>
	<div id="messageArea"></div>

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

	let sock = new SockJS("http://localhost/sosoroder/echo/");
	sock.onclose = onClose;
	// �޽��� ����
	function sendMessage(msg) {
		sock.send(JSON.stringify(msg)); 
	}
	// ������ ������ ������ ��
	function onClose(evt) {
		$("#messageArea").append("���� ����");

	}
	
	// �޼��� db�� ����
	function dbInsert(){
		//��� ��ư Ŭ��
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