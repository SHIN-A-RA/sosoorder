<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--by아라 -->

<head>
<style type="text/css">
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}

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
.btn-group .button:visited{
          color: white;
            }

</style>

</head>
<body>
<div class="mypagelist">
	<ul class="mypagebtn_ul">
		<li><a href="myPointsList">나의 적립금</a>
		<li><a href="myCouponList">나의 쿠폰함</a>
		<li class="active"><a href="myOrderList">나의 주문내역</a>
	</ul>
</div>
<script>
	$(function(){
		$( '.menu4' ).addClass( 'active' );
		$('.menu0 span a').html($('.active').attr('name'));
	});
	
</script>

	<table class="table table-white">
		<thead>
			<tr>
				<th scope="col">주문일</th>
				<th scope="col">상호명</th>
				<th scope="col">주문메뉴</th>
				<th scope="col">별점누르기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myOrderList}" var="order">
				<tr>
					<td>${order.payDay}</td>
					<td>${order.storeName}</td>
					<td>${order.menuName}</td>
					<td align='center'><input type=submit name="${order.payNum}"
						value="상세보기/별점" style="width: 50%" class="btnadd"></td>

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
									<th scope="col">주문메뉴</th>
									<th scope="col">주문수량</th>
									<th scope="col">별점</th>
								</tr>
							</thead>
							<tbody id="starOrderListTBody">
							</tbody>
						</table>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
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

					<table class="table table-white">
						<thead>
							<tr>
								<th scope="col">별점</th>
							</tr>
						</thead>
						<tbody id="starOrderListTBody2">
						</tbody>
					</table>
					<!-- Modal body -->
					<form action="starOrderList" method="post">
						<input type="hidden" name="orderStar" id="starC"> <input
							type="hidden" name="menuOrderNum" id="menuOrderNum"><input
							type="hidden" name="payNum" id="payNum">
						<div class="starRev">
							<span class="starR on">별1</span> 
							<span class="starR">별2</span> <span
								class="starR">별3</span> <span class="starR">별4</span> <span
								class="starR">별5</span>
						</div>
						<button class="btn2starBtn" style="margin-top: 20px"
							data-dismiss="modal">등록</button>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>


<script>
	$(function() {
		star();
		starinsert();
	});
		function star() {
			$('.starRev > span').click(function() {
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				var onClass = $('.on').length;
				$('#starC').val(onClass);
				  return false;
			});
		}
		function starinsert(){
			$('.btn2starBtn').click(function() {
				var orderStar =$('input:hidden[name="orderStar"]').val();
				var menuOrderNum =$('input:hidden[name="menuOrderNum"]').val();
				var payNum = $('input:hidden[name="payNum"]').val();
			$.ajax({
				url : 'orderStarUpdate',
				type : 'PUT',
				contentType:'application/json;charset=utf-8',
				data: JSON.stringify({orderStar: orderStar, menuOrderNum: menuOrderNum}),
				dataType : 'json',
				success: function(){
					orderList(payNum);
				}
			});
		});
	}
</script>

<script>
	$(function() {
		starOrderList();
		$('.btnadd').on('click', function() {
			$('#myModal').modal('show');
		});
	});
</script>
<script>
	$(function() {
		$('.btnadd2').on('click', function() {
			$('#myModal2').modal('show');
		});
	});
</script>

<script>
	$(document).ready(function() {
		$('.sub_menu_tit').click(function() {
			$(' .sub_menu_box.sub03').slideToggle(200);
			if ($(this).hasClass('on')) {
				$(this).removeClass('on');
			} else {
				$(this).addClass('on');
			}
		});
	});
	function test(payNum) {
		$('.btnadd2').on('click', function() {
			var num = $(this).attr("name");
			$('#menuOrderNum').val(num);
			$('#payNum').val(payNum);
		});
	}
	//조회 요청
	function starOrderList() {
		$('.btnadd').on('click', function() {
			var payNum = $(this).attr("name");
			orderList(payNum);
			
		});//조회 버튼 클릭
	}//starOrderList
	
	function orderList(payNum){
		$("#starOrderListTBody").empty();
		$.ajax({
			url : 'StarOrderList?payNum=' + payNum,
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : starOrderListResult
		});
	}
	//주문내역 조회 응답
	function starOrderListResult(myOrder) {
	
		$.each(myOrder,function(idx, item) {
							$('<tr>')
									.append($('<td>').html(item.menuName))
									.append($('<td>').html(item.orderCount))
									.append($('<td>').addClass("s_"+item.orderStar+" starbtntd").html("<button name='"+ item.menuOrderNum+"' type='button' class='btn btn-primary btnadd2 mcheck_" + item.menuCheck + "' data-toggle='modal' data-target='#myModal2'>별점등록</button>"))
									.append($('<td>').addClass("s_"+item.orderStar+" startd"))
									.appendTo("#starOrderListTBody");
						});
		$('.starR').removeClass('on');
		test(myOrder[0].payNum);
		$(".s_1").html("★☆☆☆☆");
		$(".s_2").html("★★☆☆☆");
		$(".s_3").html("★★★☆☆");
		$(".s_4").html("★★★★☆");
		$(".s_5").html("★★★★★");
	}//success:starOrderListResult
</script>