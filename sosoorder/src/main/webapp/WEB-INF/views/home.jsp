<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>
var myApp = angular.module("myApp",[]);
myApp.controller("myAppCtrl", function($scope){
	var product = sessionStorage.getItem('cart');
	var number;
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
		var count = 1; 
		
		var values = $scope.products;
		angular.forEach(values, function(value, key){
			if (value.menuNum == num)
		    	$scope.products.splice(index, 1);
				count = value.orderCount + 1; 
		});
		
		$scope.products.push({menuName : name, menuNum : num, menuPrice : price, orderCount : count});
		sessionStorage.setItem('cart', JSON.stringify($scope.products));
		
		number = $scope.products.length;
		$(".shoping-cart-cnt").html(number);

	}
	$scope.deleteItem = function(user){
		var index = $scope.products.indexOf(user);
	    $scope.products.splice(index, 1);
	    sessionStorage.setItem('cart', JSON.stringify($scope.products)); 
	    
	    number = $scope.products.length;
		$(".shoping-cart-cnt").html(number);

	}
	
	
	number = $scope.products.length;
	$(".shoping-cart-cnt").html(number);
	console.log(number);
	
	
});
</script>

<input type="hidden" name="hidden_storeId" id="hidden_storeId" value="${storeId}"> <br>
<!-- 메뉴 구분-->
<div class="slick_box menu_category">
	<div class="menu_bar"></div>
	<script>
	      var jbString = "${menuCategory.storeMenu}" ;
	      var jbSplit = jbString.split("|");
	      for ( var i in jbSplit ) {
	    	  $(".menu_bar").append("<div><a>" + jbSplit[i] + "</a></div>" );
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
		<div class="col-item">
	       <div class="photo">
	           <img src="http://placehold.it/350x350" class="img-responsive" alt="${menu.menuImage}" />
	       </div>
	       <div class="info">
	           <div class="row">
	               <div class="price col-md-6">
	                   <h5>${menu.menuName}</h5>
	                   <h5 class="price-text-color">${menu.menuPrice}</h5>
	               </div>
	               <div class="rating hidden-sm col-md-6">
	                   <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
	                   </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
	                   </i><i class="fa fa-star"></i>
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
	                   <a href="javascript:ViewLayer();" class="hidden-sm">More details</a>
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
  	<div class="shoping-cart-cnt">1</div>
  	<i class="fa fa-shopping-cart" aria-hidden="true"></i>
  </div>
  <!-- Title -->
  <div class="title">
    Shopping Bag
  </div>
  <!-- Product #1 -->
  <div class="item" ng-repeat="row in products track by $index">
    <div class="buttons">
      <span class="delete-btn" ng-click="deleteItem(row)"><i class="fa fa-times" aria-hidden="true"></i></span>
    </div>
 
    <div class="description">
      <span>{{row.menuName}}</span>
      <span>{{row.menuPrice}} 원</span>
      <span class="none">{{row.menuNum}}</span>
    </div>
 
    <div class="quantity">
      <button class="plus-btn" type="button" name="button">
        <i class="fa fa-plus" aria-hidden="true"></i>
      </button>
      <input type="text" name="name" value="1">
      <button class="minus-btn" type="button" name="button">
        <i class="fa fa-minus" aria-hidden="true"></i>
      </button>
    </div>
 
    <div class="total-price">$549</div>
  </div> 
  <!-- Product #1 -->
  <div class="cart_btn_wrap">
  	<div class="cart_sumit">결제하기</div>
  	<div class="cart_remove">삭제하기</div>
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
			slidesToShow: 4,
			slidesToScroll: 4,
			arrows: true,
			fade: false,
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 960, //화면 사이즈 960px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3 
					} 
				},
				{ 
					breakpoint: 768, //화면 사이즈 768px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2 
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