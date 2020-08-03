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
	<div id="messageArea">
	
	</div>
</div>

<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost/sosoroder/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// �޽��� ����
	function sendMessage() {
		
		msg = { cmd : "msg",
				seat : $("#seat").val(),
				msg : $("#message").val()
			 	}
		sock.send(JSON.stringify(msg)); 
			
	}
	// �����κ��� �޽����� �޾��� ��
	function onMessage(msg) {
		console.log(msg);
		msg = JSON.parse(msg.data);
		var data = msg.seat + " table. "+ msg.msg;
		$("#messageArea").append(data + "<br/>");
	}
	// ������ ������ ������ ��
	function onClose(evt) {
		$("#messageArea").append("���� ����");

	}
</script>