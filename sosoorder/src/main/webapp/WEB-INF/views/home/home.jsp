<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<c:if test="${not empty loginMsg}">
	<script>
	alert('${loginMsg}');
	</script>
</c:if>
<div id="toastAdd">장바구니에 추가되었습니다.</div>
<script>
//angularjs를 이용해서 storageSession에 메뉴정보를 저장한다.
var myApp = angular.module("myApp",[]);
myApp.controller("myAppCtrl", function($scope){
	var product = sessionStorage.getItem('cart');
	var number = '0';
	if(product == null)
		product = [];
	else
		product = JSON.parse(product);
	$scope.products = product;
	$scope.addItem = function(user){
		var pa = $(window.event.target).parent();
		var name = pa.find(".menuName").html();
		var num = pa.find(".menuNum").html();
		var price = pa.find(".menuPrice").html();
		var ordernum =${menuOrderNum.orderNum}+1;
		var count = 1; 
		
		//추가시 수 증가
	 	var values = $scope.products;
		angular.forEach(values, function(value, key){
			if (value.menuNum == num){
				var index = $scope.products.indexOf(value);
			    $scope.products.splice(index, 1);
				count = value.orderCount + 1;
			}
		});
		 
		$scope.products.push({menuName : name, menuNum : num, menuPrice : price, orderCount : count, orderNum : ordernum});
		sessionStorage.setItem('cart', JSON.stringify($scope.products));
		
		cartNum();
		totalPay();
		
	}
	
	/* delete버튼 클릭시 삭제 */
	$scope.deleteItem = function(user){
		var index = $scope.products.indexOf(user);
	    $scope.products.splice(index, 1);
	    sessionStorage.setItem('cart', JSON.stringify($scope.products)); 
	    
	    cartNum();
	    totalPay();
	}
	
	/* 장바구니의 +클릭시 수가 증가한다. */
	$scope.plusItem = function(user){
		var value = $scope.products.indexOf(user);
		var name = user.menuName;
		var num = user.menuNum;
		var ordernum = user.orderNum;
		var price = user.menuPrice;
		var count = user.orderCount + 1; 
		$scope.products[value] = {menuName : name, menuNum : num, menuPrice : price, orderCount : count, orderNum : ordernum};
		//$scope.products.push({menuName : name, menuNum : num, menuPrice : price, orderCount : count, orderNum : ordernum});
		//$scope.products.splice(value, 1);

		sessionStorage.setItem('cart', JSON.stringify($scope.products)); 
	    
	    cartNum();
	    totalPay();
	}
	
	/* 장바구니의 -클릭시 수가 감소한다. */
	$scope.minusItem = function(user){
		var value = $scope.products.indexOf(user);
		var name = user.menuName;
		var num = user.menuNum;
		var ordernum = user.orderNum;
		var price = user.menuPrice;
		var count = user.orderCount - 1; 
		if(count>0){
			$scope.products[value] = {menuName : name, menuNum : num, menuPrice : price, orderCount : count, orderNum : ordernum};
			//$scope.products.push({menuName : name, menuNum : num, menuPrice : price, orderCount : count, orderNum : ordernum});
			//$scope.products.splice(value, 1);
		}else if(count == 0){
			$scope.products.splice(value, 1);
		}
		sessionStorage.setItem('cart', JSON.stringify($scope.products)); 

	    cartNum();
	    totalPay();
	}
	
	
	/* 전체삭제 */
	$scope.deleteKey = function(){
		deleteMenu()
	    cartNum();
		totalPay();
	}
	function deleteMenu(){
		delete $scope.products;
		product = [];
		$scope.products = product;
	   	sessionStorage.setItem('cart', JSON.stringify($scope.products)); 
	}
	
	/*cart에 들어가는 숫자  */	
	cartNum();
	function cartNum(){
		var values = $scope.products;
		number = 0;
		angular.forEach(values, function(value, key){
			number += value.orderCount
		});
		
 		//number = $scope.products.length;
 		
		$(".shoping-cart-cnt").html(number);
	}
	
	/* 총금액 */
	totalPay();
	function totalPay(){
		var values = $scope.products;
		var total = 0;
		angular.forEach(values, function(value, key){
			total += value.orderCount * value.menuPrice;
		});
		total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		$(".totalPay").html(total);
	}
	
	var cartList = $scope.products;
	console.log(JSON.stringify(cartList));
	 $('.cart_sumit').on('click', function(){
		$.ajax({
			url: "/sosoroder/cartList",
			type: "POST",
			data: JSON.stringify(cartList),
			contentType: 'application/json'
        }).done(function(){
        	deleteMenu();
        	window.location.href = "/sosoroder/orderInsert?orderNum="+ ${menuOrderNum.orderNum+1}+"&seat="+${seat.seat} ;
        })
	}); 
	 toastAdd();
	 function toastAdd() {
        const toast = document.getElementById('toastAdd');  // id가 toast인 요소 div
        let isToastShown = false;
        // id가 toastButton인 요소를 클릭하면 아래 함수가 호출됨
        $('.btn-add').on('click', function () {
            if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면 함수를 끝냄
            isToastShown = true;
            toast.classList.add('reveal');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
            setTimeout(function () {
                // 2700ms 후에 show 클래스를 제거함
                toast.classList.remove('reveal');
           isToastShown = false;
            }, 2700);
        });
	}
	
});
</script>

<!-- 메뉴 구분-->
<div class="slick_box menu_category">
	<div class="menu_bar"></div>
	<script>
	      var jbString = "${menuCategory.storeMenu}" ;
	      var jbSplit = jbString.split("|");
	      for ( var i in jbSplit ) {
	    	  $(".menu_bar").append("<div><a class='MCategory'>" + jbSplit[i] + "</a></div>" );
	      }
	 </script>
	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left"  aria-hidden="true"></i></span>
	<span class="next" id="aro_next1"><i class="fa fa-caret-right" aria-hidden="true"></i></span>
</div>

<!-- 메뉴 목록 -->
<div ng-app="myApp">
<div ng-controller="myAppCtrl">

<div class="slick_box menu_list_wrap">
	<div class="menu_list">
	<c:forEach items="${menuList}" var="menu">
		<div class="col-item categoryIf ${menu.menuCategory}">
	       <div class="photo" 
	       style="background-image:url( '${pageContext.request.contextPath}/resources/download/${menu.menuImage}');">
	       </div>
	       <div class="info">
	           <div class="row">
	               <div class="price col-md-6">
	                   <h5>${menu.menuName}</h5>
	                   <h5 class="price-text-color">
	                   <fmt:formatNumber value="${menu.menuPrice}" pattern="#,###"/></h5>
	               </div>
	               <div class="rating hidden-sm col-md-6">
	               		<c:if test="${menu.orderStarAll != null}">
		               		<c:forEach begin="1" end="${menu.orderStarAll}" >
			                   <i class="price-text-color fa fa-star"></i>
		               		</c:forEach>
		               		<c:forEach begin="${menu.orderStarAll}" end="4">
			                   <i class="fa fa-star"></i>
		               		</c:forEach>
	               		</c:if>
	               </div>
	           </div>
	           <div class="separator clear-left">
	           		<div class="btn-add cartInsertBtn" ng-click="addItem()">
	           			<span class="menuName none">${menu.menuName}</span>
	           			<span class="menuPrice none">${menu.menuPrice}</span>
	           			<span class="menuNum none">${menu.menuNum}</span>
	           			<i class="fa fa-shopping-cart"></i> Add to cart
	           		</div>
	           	
	               <p class="btn-details">
	                   <i class="fa fa-list"></i>
	                   <a>More details</a>
	               </p>
	           </div>
	           <div class="clearfix">
	           </div>
	       </div>
	   </div>
	</c:forEach>
	</div>
	<span class="prev" id="aro_prev2"><i class="fas fa-arrow-left"></i></span>
	<span class="next" id="aro_next2"><i class="fas fa-arrow-right"></i></span>

</div>

<div class="shopping-cart cart-close">
  <div class="shoping-cart-btn">
  	<div class="shoping-cart-cnt">
  		
  	</div>
  	<i class="fa fa-shopping-cart" aria-hidden="true"></i>
  </div>
  <!-- Title -->
  <div class="title gd_bg1">
    Shopping Bag
    <c:if test="${seat.seat != 0}" >
    	<span class="fr">테이블 번호 : ${seat.seat}</span>
    </c:if> 
  </div>
  <!-- Product #1 -->
  <div class="item" ng-repeat="row in products track by $index">
    <div class="buttons">
      <span class="delete-btn" ng-click="deleteItem(row)"><i class="fa fa-times" aria-hidden="true"></i></span>
    </div>
 
    <div class="description">
      <span>{{row.menuName}}</span>
      <span>{{row.menuPrice | number}} 원</span>
    </div>
 
    <div class="quantity">
      <div class="plus-btn" name="button" ng-click="plusItem(row)">
        <i class="fa fa-plus" aria-hidden="true"></i>
      </div>
      <input type="text" name="name" value="{{row.orderCount}}">
      <div class="minus-btn" name="button" ng-click="minusItem(row)">
        <i class="fa fa-minus" aria-hidden="true"></i>
      </div>
    </div>
 
    <div class="total-price">{{row.menuPrice*row.orderCount | number}}</div>
  </div> <!-- repeat -->
  <!-- Product #1 -->
  <div class="cart_btn_wrap">
  	<div style="width:30%">총 결제금액 </div><div class="totalPay" style="width:70%"></div>
  	<div class="cart_sumit">결제하기</div>
  	<div class="cart_remove" ng-click="deleteKey()">삭제하기</div>
  </div>
</div>

<!--  -->
 </div>
 </div>
             		
<script>
	 $('.menu_bar').slick({
		autoplay : false,
		dots: false,
		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
		infinite: false,
		autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		prevArrow: $('#aro_prev1'),
		nextArrow: $('#aro_next1'),
		arrows: true,
		slidesToShow: 5,
		slidesToScroll: 5,
		fade: false
	}); 
	 
	 $('.menu_list').slick({
			autoplay : false,
			dots: false,
			speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
			infinite: true,
			autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
			prevArrow: $('#aro_prev2'),
			nextArrow: $('#aro_next2'),
			slidesToShow: 5,
			slidesToScroll: 5,
			arrows: true,
			fade: false,
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 1660, 
					settings: {
						slidesToShow:3 
					} 
				},
				{ 
					breakpoint: 1028,
					settings: {	
						slidesToShow:2 
					} 
				},
				{ 
					breakpoint: 800,
					settings: {	
						slidesToShow:1 
					} 
				},
				{ 
					breakpoint: 100,
					settings: {	
						slidesToShow:1 
					} 
				}
			]
		}); 

	</script>
	
<script>
	$(function(){
		$( '.menu1' ).addClass( 'active' );
	});
	
</script>
	
<script>
/*장바구니 열기, 닫기*/
$(function(){
	$('.shoping-cart-btn').click(function(){
		if($('.shopping-cart').hasClass('cart-open')){
			$('.shopping-cart').removeClass('cart-open');
			$('.shopping-cart').addClass('cart-close');
		}else{
			$('.shopping-cart').addClass('cart-open');
			$('.shopping-cart').removeClass('cart-close');
		}
	});
})


</script>
<script>
$(function(){
	
	$('.MCategory').on('click', function(){
		category = $(this).html();
		location.href = "/sosoroder/homeSample?menuCategory=" + category;
	});
	
	
})
</script>
<%-- <jsp:include page="/WEB-INF/views/store/storePopup.jsp"/> --%>
<%@include file="/WEB-INF/views/store/storePopup.jsp" %>
