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
			 			<button type="button" class="btn_upt1" style="background:#ff5722; padding: 10px;" data-paynum="${payNum}">조리시작</button>
		 			</c:if>
		 			<c:if test="${status == 1}">
		 				<button onclick="orderUpdate2(${payNum},this)" style="padding: 10px; background:#c3c3c3;">조리완료</button>
		 			</c:if>
	 			</div>
 			</div>
		</c:if> 
		
		<c:if test="${list.payNum != payNum}">
 			<div style="width: 30%;  margin:10px; height: 580px; display:inline-block; background: #ececec; padding: 25px; border: 1px solid;">
	 			<div  style="border-bottom: 1px solid #c7bebe; padding: 20px; height: 20%;">
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
	 			<div class="menuList scrollbar style-4" style="border-bottom: 2px solid #1f1d1d; box-sizing: border-box; padding: 10px 10px;  height: 60%;">
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
		 					<span class="menuName">${list.menuName}</span>		 				
		 					<span class="orderCount">${list.orderCount}</span>	
					</div>	
		 				
		<c:if test="${fn:length(orderList) == st.count}">	 		 				
	 		</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
		 			<c:if test="${list.status == 0}">
		 				<button type="button" class="btn_upt1" style="background:#ff5722; padding: 10px;" data-payNum="${list.payNum}">조리시작</button>
		 			</c:if>
		 			<c:if test="${list.status == 1}">
		 				<button onclick="orderUpdate2(${list.payNum},this)" style="padding: 10px; background:#c3c3c3;">조리완료</button>
		 			</c:if>
	 			</div>
 			</div>
		</c:if> 				
	<c:set var="payNum" value="${list.payNum}"></c:set>	
	<c:set var="status" value="${list.status}"></c:set>	
  </c:forEach>
  </div>
  
  	
</div>
<!--주문탬플릿  -->
<div id="orderTem" style=" display:none;">
 			<div style="width: 30%;  margin:10px; height: 580px; display:inline-block; background: #ececec; padding: 25px; border: 1px solid;">
	 			<div style="border-bottom: 2px solid #1f1d1d; padding: 20px; height: 25%;">
	 					<p class="payNum"> </p>
	 					<p class="seat"> </p>
	 					<p class="addr"> </p>
	 				<p class="payCheck"> </p>
	 			</div>
	 			<div class="menuList" style="border-bottom: 2px solid #1f1d1d; box-sizing: border-box; padding: 10px 10px;  height: 55%; overflow-y: scroll;">
	 				<div style="padding: 15px 60px 40px 60px;">
		 				<div style="float: left; box-sizing: border-box;">
		 				 	<h5>메뉴</h5>
		 				</div>
		 				<div style="float: right; box-sizing: border-box;">
		 					<h5>수량</h5>
		 				</div>
	 				</div>
	 	
	 			</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
	 				<button  type="button" class="btn_upt1" style="background:#ff5722; padding: 10px;" >조리시작</button>
	 			</div>
 			</div>
 	</div>	
 	<jsp:include page="/WEB-INF/views/order/callList.jsp"/>

<script>

function orderInsert(orderMap){
	
	var empty = $("#orderTem").children().first().clone();
	$(".orderwrap").prepend(empty);
	
	for(i=0; i<orderMap.orderList.length; i++){
		var menu =	'<div class="row">'+					
					'<span class="menuName" style="display:inline-block; width:100px;">'+ orderMap.orderList[i].menuName +'</span>'+		 				
					'<span class="orderCount" style="display:inline-block; width:100px;">'+ orderMap.orderList[i].orderCount +'</span>'	
		+'</div>';
	
		//메뉴리스트 뿌리기
		empty.find(".menuList").append(menu);	
		
	}
	
	empty.find(".btn_upt1").data("paynum",orderMap.payInfo.payNum);
	
	//내용넣기
	empty.find(".payNum").text("주문번호" + orderMap.payInfo.payNum);
	 if(orderMap.payInfo.seat > 0){
		empty.find(".seat").text("Table:"+orderMap.payInfo.seat);		 
	 } else if(orderMap.payInfo.addr != null){
		empty.find(".addr").text("주소:"+orderMap.payInfo.addr);
	 } 
	 
	 if(orderMap.payInfo.payCheck == 0){
		empty.find(".payCheck").text("계좌이체"); 
	 } else if(orderMap.payInfo.payCheck == 1) {
		 empty.find(".payCheck").text("카드결제"); 
	 } else if(orderMap.payInfo.payCheck == 2) {
		 empty.find(".payCheck").text("현금결제"); 
	 }

	
}

//조리시작
$(".orderwrap").on("click",".btn_upt1", function(){
	var p = $(this).data("paynum")
	//couponUpdate 요청
	$(this).text("조리완료").css("background",'#c3c3c3').attr("onclick", "orderUpdate2("+p+",this)");

	$.ajax({ 
	    url: "orderUpdate1",  
	    type: 'POST',  
	    data: {payNum: p},
	    success: function(response) {
	    	var msg = {cmd: 'startCook','member':p,'store':'${storeId}',msg:'조리가 시작되었습니다.'}
	    	console.log(msg)
	    	sendMessage(msg);
	    } 
	 });  

})


function orderUpdate2(p, e){
	//couponUpdate 요청
		$(e).parent().parent().remove();	
	
		$.ajax({ 
		    url: "orderUpdate2",  
		    type: 'POST',  
		    data: {payNum: p},
		    success: function(response) {
		    	var msg = {cmd: 'endCook','member':p,'store':'${storeId}',msg:'조리가 완료되었습니다.'}
		    	console.log(msg)
		    	sendMessage(msg);
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
