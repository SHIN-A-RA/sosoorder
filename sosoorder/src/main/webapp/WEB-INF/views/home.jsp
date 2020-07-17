<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach items="${menuList}" var="menu">
		${menu.menunum} <br>
	</c:forEach>

<!-- 메뉴 구분-->
<div class="slick_box menu_category">
	<div class="menu_bar">
		<div><a>떡볶이</a></div>
		<div><a>자장면</a></div>
		<div><a>떡볶이</a></div>
		<div><a>자장면</a></div>
		<div><a>떡볶이</a></div>
		<div><a>자장면</a></div>
	</div>
	
	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left"  aria-hidden="true"></i></span>
	<span class="next" id="aro_next1"><i class="fa fa-caret-right" aria-hidden="true"></i></span>

</div>

<!-- 메뉴 목록 -->
<div class="slick_box menu_list_wrap">
<div class="menu_list">
   <div class="col-item">
       <div class="photo">
           <img src="http://placehold.it/350x350" class="img-responsive" alt="a" />
       </div>
       <div class="info">
           <div class="row">
               <div class="price col-md-6">
                   <h5>햄버거</h5>
                   <h5 class="price-text-color">5,000 원</h5>
               </div>
               <div class="rating hidden-sm col-md-6">
                   <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                   </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                   </i><i class="fa fa-star"></i>
               </div>
           </div>
           <div class="separator clear-left">
               <p class="btn-add">
                   <i class="fa fa-shopping-cart"></i><a href="#" class="hidden-sm">Add to cart</a></p>
               <p class="btn-details">
                   <i class="fa fa-list"></i><a href="#" class="hidden-sm">More details</a></p>
           </div>
           <div class="clearfix">
           </div>
       </div>
   </div>
   
   
<!-- 
	<div class="ml">
		<div class="menu_img"></div>
		<div class="info">
			<div class="title">
				<p>매운맛5</p>
				<p>1,000</p>
			</div>
			<div class="detail">
				<i class="fas fa-search"></i>
			</div>
		</div>
	</div> -->
</div>

	<span class="prev" id="aro_prev2"><i class="fas fa-arrow-left"></i></span>
	<span class="next" id="aro_next2"><i class="fas fa-arrow-right"></i></span>

</div>



<!-- <div class="main_cart">
		<div class="cart_list">
			<h3 class="mb20">주문서</h3>
		    <div class="row">
		        <div class="col-sm-12 col-md-offset-1">
		            <table class="table table-hover">
		                <thead>
		                    <tr>
		                        <th>Product</th>
		                        <th>Quantity</th>
		                        <th class="text-center">Price</th>
		                        <th class="text-center">Total</th>
		                        <th> </th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td class="col">
		                        <div class="media">
		                            <div class="media-body">
		                                <h4 class="media-heading"><a href="#">Product name</a></h4>
		                            </div>
		                        </div></td>
		                        <td class="col-sm-1 col-md-1" style="text-align: center">
		                        <input type="email" class="form-control" id="exampleInputEmail1" value="3">
		                        </td>
		                        <td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
		                        <td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
		                        <td class="col-sm-1 col-md-1">
		                        <button type="button" class="btn btn-danger">
		                            <span class="glyphicon glyphicon-remove"></span> Remove
		                        </button></td>
		                    </tr>
		                 
		                    <tr>
		                        <td>   </td>
		                        <td>   </td>
		                        <td>   </td>
		                        <td><h3>Total</h3></td>
		                        <td class="text-right"><h3><strong>$31.53</strong></h3></td>
		                    </tr>
		                    <tr>
		                        <td>   </td>
		                        <td>   </td>
		                        <td>   </td>
		                        <td>
		                        <button type="button" class="btn btn-default">
		                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
		                        </button></td>
		                        <td>
		                        <button type="button" class="btn btn-success">
		                            Checkout <span class="glyphicon glyphicon-play"></span>
		                        </button></td>
		                    </tr>
		                </tbody>
		            </table>
		        </div>
		    </div>
		</div>

	<div class="cart_btn">
		<i class="fa fa-shopping-cart" aria-hidden="true"></i> 장바구니
	</div>
</div> -->
	
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
			fade: false
		}); 

	</script>
	
	
	<script>
	$(function(){
		$( '.menu1' ).addClass( 'active' );
	});
	
	</script>

	<div class="main_order_list">
  <a class="btn js-click-modal">장바구니</a>
  <div class="main_order">
    <div class="o_header">계산서</div>
    <div class="o_body">
    	<p>And here is all its contents.</p>
      <a class="btn js-close-modal">Close</a>
    </div>
  </div>
</div>

<script>
$(function(){
	$('.js-click-modal').click(function(){
		  $('.main_order_list').addClass('modal-open');
		});

		$('.js-close-modal').click(function(){
		  $('.main_order_list').removeClass('modal-open');
		});
})
</script>
	
	