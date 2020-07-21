<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>나의 주문내역</h2>
<head>
<style type="text/css">
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
</head>

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
<script>
$(function(){
$('.btnadd').on( "click", function() {
	   $('#myModal').modal('show');
	});
});
</script>
<script>
$(function(){
$('.btnadd2').on( "click", function() {
	   $('#myModal2').modal('show');
	});
});
</script>
</head>
<body>


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
		<c:forEach items="${myOrderList}" var="order">
			<tr>
				<td>${order.payDay}</td>
				<td>${order.storeName}</td>
				<td>${order.totalPay}</td>
				<td align='center'><input type=submit value="별점주기" style="width:50%" class="btnadd" ></td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="container">


  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">주문내역</h4>
          
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       
<table class="table table-white">
	<thead>
		<tr>
			<th scope="col">상세내역</th>
			<th scope="col">별점주기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${myOrderList}" var="order">
			<tr>
				<td>${order.payDay}</td>
					<td align='center'><input type=submit value="별점등록" style="width:50%" class="btnadd2" ></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
<div class="container">

  <!-- The Modal -->
  <div class="modal fade" id="myModal2">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">별점등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
      <form action="" method="post" >
               <input type="hidden" name="starC" id="starC">
               <div class="starRev">
                 <span class="starR on">별1</span>
                 <span class="starR">별2</span>
                 <span class="starR">별3</span>
                 <span class="starR">별4</span>
                 <span class="starR">별5</span>
               </div>
               <button class="btn2starBtn" style="margin-top:20px"data-dismiss="modal">등록</button>            
            </form>  
      </div>
    </div>
  </div>
  
</div>
</body>

	<ul class="sub_menu_box sub03 ">
         <li class="gnb_dp2 m1"><a href="myPointList">나의 적립금</a></li>
         <li class="gnb_dp2 m2"><a href="myCouponList">나의 쿠폰</a></li>
         <li class="gnb_dp2 m3"><a href="myOrderList">나의 주문내역(별점)</a></li>
	</ul>
	
<script>
$('.starRev span').click(function(){
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    return false;
  });
$('.btn2starBtn').click(function(){
  var onClass = $('.on').length;
   $('#starC').val(onClass);
})
</script>



<script>
	$(document).ready(function(){
		$('.sub_menu_tit').click(function(){
			$(' .sub_menu_box.sub03').slideToggle(200);
			if($(this).hasClass('on')){
				$(this).removeClass('on');
			}else{
				$(this).addClass('on');
			}	
		});
	});
</script>
