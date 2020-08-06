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
	 				<button style="padding: 10px;">조리시작</button>
	 				<button style="padding: 10px;">조리완료</button>
	 			</div>
 			</div>
		</c:if> 
		
		<c:if test="${list.payNum != payNum}">
 			<div style="width: 30%; float: left; margin:10px; height: 580px; position: relative; background: #ececec; padding: 25px; border: 1px solid;">
	 			<div style="border-bottom: 2px solid #1f1d1d; padding: 20px; height: 20%;">
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
	 			<div style="border-bottom: 2px solid #1f1d1d; box-sizing: border-box; padding: 10px 10px;  height: 60%;">
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
	 				<button style="padding: 10px;">조리시작</button>
	 				<button style="padding: 10px;">조리완료</button>
	 			</div>
 			</div>
		</c:if> 				
	<c:set var="payNum" value="${list.payNum}"></c:set>		
  </c:forEach>
  </div>
   	<span class="prev" id="aro_prev2"><i class="fas fa-arrow-left"></i></span>
	<span class="next" id="aro_next2"><i class="fas fa-arrow-right"></i></span>
</div>

<script>
$('.orderwrap').slick({
	autoplay : false,
	dots: false,
	speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
	infinite: false,
	autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
	prevArrow: $('#aro_prev2'),
	nextArrow: $('#aro_next2'),
	arrows: true,
	slidesToShow: 3,
	slidesToScroll: 3,
	fade: false
}); 
</script>
