<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<!-- 메뉴 구분-->
<div class="slick_box menu_category">
	<div class="menu_bar"></div>
	<script>
		var jbString = "${menuCategory.storeMenu}";
		var jbSplit = jbString.split("|");
		for ( var i in jbSplit) {
			$(".menu_bar").append(
					"<div><a class='MCategory'>" + jbSplit[i] + "</a></div>");
		}
	</script>
	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left"
		aria-hidden="true"></i> </span> <span class="next" id="aro_next1"><i
		class="fa fa-caret-right" aria-hidden="true"></i></span>
</div>
<script>
	$(function() {
		//목록
		var otable = $('#table_id').DataTable({});
		
	});
</script>
<script>
	$('.menu_bar').slick({
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