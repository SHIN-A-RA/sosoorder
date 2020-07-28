<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$('.empCategory').on('click', function(){
		category = $(this).html();
		location.href = "storeMenuList?menuCategory=" + category;
	});
})
</script>
<script>
	$('.emp_bar').slick({
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
	var empBarList = "${empBar.EMPNAME}" ;
    for ( var i in jbString ) {
  	  $(".emp_bar").append("<div><a class='empCategory'>" + empBarList[i] + "</a></div>" );
    }
</script>

<!-- <script>
	$(function() {
		//목록
		var otable = $('#table_id').DataTable({});
		$('#table_id tbody').on('click', 'tr', function() {
			var col1 = $(this).attr("name");
			//var data = otable.row(this).data();
			//var col1 = data[1].;
			location.href = "storeMenuInsert?menuNum=" + col1
		});

	});
</script> -->


<!-- 직원 구분-->
<div class="slick_box menu_category">
	<div class="emp_bar"></div>
	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left" aria-hidden="true"></i>
	</span> <span class="next" id="aro_next1"><i class="fa fa-caret-right" aria-hidden="true"></i></span>
</div>



<div class="emp_bar"></div>

<table class="display">
	<thead>
		<tr>
			<th>출근요일</th>
			<th>출근날짜</th>
			<th>출근시간</th>
			<th>퇴근시간</th>
			<th>합계</th>
		</tr>
	</thead>
	<tbody>
		<%-- <c:forEach items="${empBarList}" var="emp">
			<tr>
				<td>${menu.menuCategory}</td>
				<td></td>
				<td>${menu.menuPrice}원</td>
				<td></td>
			</tr>
		</c:forEach> --%>
	</tbody>
</table>



