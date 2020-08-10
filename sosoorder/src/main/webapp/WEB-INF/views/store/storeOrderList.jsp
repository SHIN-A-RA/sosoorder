<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div style="width: 100%; padding: 100px 0px 0px 0px;" class="slick_box order">
	<div style="width: 100%; box-sizing: border-box; height: 600px;" class="orderwrap">
 <c:set var="payNum" value="0"/>		
 <c:forEach items="${orderList}" var="list" varStatus="st">
 		 				
		<c:if test="${list.payNum != payNum and st.count > 1}">	 		 				
	 		</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
		 			<c:if test="${status == 0}">
		 				<button onclick="orderUpdate(${payNum},this)" style="background:#ff5722; padding: 10px;">조리시작</button>
		 			</c:if>
		 			<c:if test="${status == 1}">
		 				<button onclick="orderUpdate2(${payNum},this)" style="padding: 10px; background:#c3c3c3;">조리완료</button>
		 			</c:if>
	 			</div>
 			</div>
		</c:if> 
		
		<c:if test="${list.payNum != payNum}">
 			<div style="width: 30%; float: left; margin:10px; height: 580px; position: relative; background: #ececec; padding: 25px; border: 1px solid;">
	 			<div style="border-bottom: 2px solid #1f1d1d; padding: 20px; height: 25%;">
	 			<p>결제번호 ${list.payNum}</p>
	 				<c:if test="${list.seat != null}">
	 					<p style="color:red;">Table ${list.seat}</p>
	 				</c:if>
	 				<c:if test="${list.addr != null}">
	 					<p style="color:blue;">주소: ${list.addr}</p>
	 				</c:if>
	 				<c:if test="${list.payCheck == 2}">
	 					<p style="color:red; ">※현금결제※</p>
	 				</c:if>
	 			</div>
	 	   <!-- 주문메뉴부분 -->			
	 			<div style="border-bottom: 2px solid #1f1d1d; box-sizing: border-box; padding: 10px 10px;  height: 55%; overflow-y: scroll;">
	 				<div style="padding: 15px 60px 40px 60px;">
		 				<div style="float: left; box-sizing: border-box;">
		 				 	<h5>메뉴</h5>
		 				</div>
		 				<div style="float: right; box-sizing: border-box;">
		 					<h5>수량</h5>
		 				</div>
	 				</div> 				
	 	</c:if>		
	 				<div class="row">
	 					<div class="col" style="box-sizing: border-box;">
		 					<p>${list.menuName}</p>
		 				</div>
		 				<div class="col" style="box-sizing: border-box;">
		 					<p>${list.orderCount}</p>	 					
		 				</div>
					</div>	
		 				
		<c:if test="${fn:length(orderList) == st.count}">	 		 				
	 		</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
		 			<c:if test="${list.status == 0}">
		 				<button onclick="orderUpdate(${list.payNum},this)" style="background:#ff5722; padding: 10px;">조리시작1</button>
		 			</c:if>
		 			<c:if test="${list.status == 1}">
		 				<button onclick="orderUpdate2(${list.payNum},this)" style="padding: 10px; background:#c3c3c3;">조리완료1</button>
		 			</c:if>
	 			</div>
 			</div>
		</c:if> 				
	<c:set var="payNum" value="${list.payNum}"></c:set>	
	<c:set var="status" value="${list.status}"></c:set>	
  </c:forEach>
  </div>
	<!--<span class="prev" id="aro_prev2"><i class="fas fa-arrow-left"></i></span>
		<span class="next" id="aro_next2"><i class="fas fa-arrow-right"></i></span> -->
</div>

<script>
//웹소켓 통신
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

//수정 요청
function orderUpdate(p, e){
	//couponUpdate 요청
		$(e).text("조리완료").css("background",'#c3c3c3').attr("onclick", "orderUpdate2("+p+",this)");
	
		$.ajax({ 
		    url: "orderUpdate1",  
		    type: 'POST',  
		    dataType: 'json', 
		    data: {payNum: p},
		    success: function(response) {
		    	
		    } 
		 });  
	
}

function orderUpdate2(p, e){
	//couponUpdate 요청
		$(e).parent().parent().remove();	
	
		$.ajax({ 
		    url: "orderUpdate2",  
		    type: 'POST',  
		    dataType: 'json', 
		    data: {payNum: p},
		    success: function(response) {
		    	console.log(e)
		    } 
		 });  
	
}//
// 리로드
/* setTimeout(function(){
	location.reload();
},60000) */

/*슬릭*/
/*  $('.orderwrap').slick({
	autoplay : false,
	dots: false,
	speed : 300  이미지가 슬라이딩시 걸리는 시간 ,
	infinite: false,
	autoplaySpeed: 3000  이미지가 다른 이미지로 넘어 갈때의 텀 ,
	prevArrow: $('#aro_prev2'),
	nextArrow: $('#aro_next2'),
	arrows: true,
	slidesToShow: 3,
	slidesToScroll: 3,
	fade: false
});   */
</script>
