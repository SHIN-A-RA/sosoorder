<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
.container-fluid{width:100% !important; padding:0;}
</style>
<div id="callListWrap" class="col-3">
<jsp:include page="/WEB-INF/views/order/callList.jsp"/>
</div>
<div class="slick_box order col-9">
	<div class="orderwrap">
 <c:set var="payNum" value="0"/>		
 <c:forEach items="${orderList}" var="list" varStatus="st">
 		 				
		<c:if test="${list.payNum != payNum and st.count > 1}">	 		 				
	 		</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
		 			<c:if test="${status == 0}">
			 			<button type="button" class="btn_upt1" data-paynum="${payNum}">조리시작</button>
		 			</c:if>
		 			<c:if test="${status == 1}">
		 				<button onclick="orderUpdate2(${payNum},this)" class="btn_upt2" >조리완료</button>
		 			</c:if>
	 			</div>
 			</div>
		</c:if> 
		
		<c:if test="${list.payNum != payNum}">
 			<div class="listItem">
	 			<div  style="border-bottom: 1px solid #c7bebe; padding: 10px; height: 20%; ">
	 			<p style="padding-botton:10px; font-size:20px; font-weight:bold;">주문번호 ${list.payNum}</p>
	 				<c:if test="${list.seat != null}">
	 					<p style="color:red; font-size: 18px;">Table ${list.seat}</p>
	 				</c:if>
	 				<c:if test="${list.addr != null}">
	 					<p style="color:blue; font-size: 18px;">배달</p>
	 					<%-- <p style="color:blue;">${list.addr}</p> --%>
	 				</c:if>
	 				<c:if test="${list.payCheck == 0}">
	 					<p>※계좌이체※</p>
	 				</c:if>
	 				<c:if test="${list.payCheck == 1}">
	 					<p>※카드결제※</p>
	 				</c:if>
	 				<c:if test="${list.payCheck == 2}">
	 					<p>※현금결제※</p>
	 				</c:if>
	 			</div>
	 	   <!-- 주문메뉴부분 -->			
	 			<div class="menuList" style="box-sizing: border-box; padding: 10px 10px;  height: 60%;">
		 			<div class="row">
		 				<div class="fl col-6">
		 				 	<h5>메뉴</h5>
		 				</div>
		 				<div class="fl col-6">
		 					<h5>수량</h5>
		 				</div>
		 			</div>
	 	</c:if>		
	 				<div class="row">	 					
		 				<span class="fl col-6 menuName">${list.menuName}</span>		 				
		 				<span class="fl col-6 orderCount">${list.orderCount}</span>	
					</div>	
		 				
		<c:if test="${fn:length(orderList) == st.count}">	 		 				
	 		</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
		 			<c:if test="${list.status == 0}">
		 				<button type="button" class="btn_upt1"data-payNum="${list.payNum}">조리시작</button>
		 			</c:if>
		 			<c:if test="${list.status == 1}">
		 				<button onclick="orderUpdate2(${list.payNum},this)" class="btn_upt2" >조리완료</button>
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
 			<div class="listItem">
	 			<div style="border-bottom: 1px solid #c7bebe; padding: 10px; height: 20%; ">
	 					<p class="payNum" style="padding-botton:10px; font-size:20px; font-weight:bold;"> </p>
	 					<p class="seat" style="color:red; font-size: 18px;"> </p>
	 					<p class="addr" style="color:blue; font-size: 18px;"> 
	 				<p class="payCheck"> </p>
	 			</div>
	 			<div class="menuList" style="box-sizing: border-box; padding: 10px 10px;  height: 60%;"">
	 				<div class="row">
		 				<div class="fl col-6">
		 				 	<h5>메뉴</h5>
		 				</div>
		 				<div class="fl col-4">
		 					<h5>수량</h5>
		 				</div>
	 				</div>
	 	
	 			</div>
	 			<div style="padding: 30px; height: 20%; text-align: -webkit-center;">
	 				<button  type="button" class="btn_upt1">조리시작</button>
	 			</div>
 			</div>
 	</div>	
 	

<script>

function orderInsert(orderMap){
	
	var empty = $("#orderTem").children().first().clone();
	$(".orderwrap").prepend(empty);
	
	for(i=0; i<orderMap.orderList.length; i++){
		var menu =	'<div class="row">'+					
					'<span class="fl col-6 menuName">'+ orderMap.orderList[i].menuName +'</span>'+		 				
					'<span class="fl col-6 orderCount">'+ orderMap.orderList[i].orderCount +'</span>'	
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
	/* 	empty.find(".addr").text("주소:"+orderMap.payInfo.addr); */
		empty.find(".addr").text("배달");
	 } 
	 
	 if(orderMap.payInfo.payCheck == 0){
		empty.find(".payCheck").text("※계좌이체※"); 
	 } else if(orderMap.payInfo.payCheck == 1) {
		 empty.find(".payCheck").text("※카드결제※"); 
	 } else if(orderMap.payInfo.payCheck == 2) {
		 empty.find(".payCheck").text("※현금결제※"); 
	 }

	
}

//조리시작
$(".orderwrap").on("click",".btn_upt1", function(){
	var p = $(this).data("paynum")
	//couponUpdate 요청
	$(this).text("조리완료").addClass("btn_upt2").attr("onclick", "orderUpdate2("+p+",this)");

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

<script>
	$(function(){
		$( '.navbar-nav li.li_3 a.nav-link' ).css( 'color', '#fff' );
	});
</script>
