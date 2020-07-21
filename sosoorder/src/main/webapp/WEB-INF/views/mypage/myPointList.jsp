<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>적립금 리스트</h2>
<style>
.btn-group .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
}

.btn-group .button:hover {
  background-color: #3e8e41;
}
</style>
</head>
<body>

<div class="slick_box menu_category">
	<div class="list_bar">
		<c:forEach items="${MyStoreList}" var="point">
			<div>
				<a>${point.storeName}</a>
			</div>
		</c:forEach>
	</div>
	</div>
<table class="table table-white">
	<thead>
		<tr>
			<th scope="col">주문일</th>
			<th scope="col">상호명</th>
			<th scope="col">결제금액</th>
			<th scope="col">별점누르기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${myPointsList}" var="point">
			<tr>
				<td>${point.storeName}</td>
				<td>${point.pointDate}</td>
				<td>${point.point}</td>
				<td>${point.pointCheck}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>

	<ul class="sub_menu_box sub02 ">
         <li class="gnb_dp2 m1"><a href="myPointList">나의 적립금</a></li>
         <li class="gnb_dp2 m2"><a href="myCouponList">나의 쿠폰</a></li>
         <li class="gnb_dp2 m3"><a href="myOrderList">나의 주문내역(별점)</a></li>
	</ul>
	
<script>
	$('.list_bar').slick({
		autoplay : false,
		dots : false,
		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
		infinite : false,
		autoplaySpeed : 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		prevArrow : $('#aro_prev1'),
		nextArrow : $('#aro_next1'),
		arrows : true,
		slidesToShow : 5,
		slidesToScroll : 5,
		fade : false
	});
</script>

<script>
	$(document).ready(function(){
		$('.sub_menu_tit').click(function(){
			$(' .sub_menu_box.sub01').slideToggle(200);
			if($(this).hasClass('on')){
				$(this).removeClass('on');
			}else{
				$(this).addClass('on');
			}	
		});
	});
</script>
    