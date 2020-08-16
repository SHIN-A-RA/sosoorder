<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<ul class="gnb_dp1_wrap">
	<li class="gnb_dp1 menu0"><span><a></a></span></li>
	<!-- 고객메뉴 -->
	<li class="gnb_dp1 menu1" name="메뉴"><span><a href="/sosoroder/homeSample"><i class="fa fa-cutlery" aria-hidden="true"></i> 메뉴</a></span></li>
	<!-- 내 주변 쿠폰 -->
	<li class="gnb_dp1 menu2" name="내 주변 쿠폰"><span><a href="/sosoroder/gps"><i class="fa fa-map-marker" aria-hidden="true"></i> 내 주변 쿠폰</a></span></li>
	<!-- 호출 -->
	<li class="gnb_dp1 menu3" name="호출">
		<span>
			<a class="call_insert_btn">
				<i class="fa fa-bell" aria-hidden="true"></i> 호출
			</a>
		</span>
	</li>
	<!-- 마이페이지 -->
	<li class="gnb_dp1 menu4"><span><a href="/sosoroder/myPointsList"><i class="fa fa-id-card-o" aria-hidden="true"></i> 마이페이지</a></span></li>
</ul>

<script>
$(function(){
	$('.call_insert_btn').on("click", function(){
		$("#callInsert").removeClass("disnon");
		$(".callInsrt_bg").removeClass("disnon");
	})
	
	$('.insert_ex_dtn, .callInsrt_bg').on("click", function(){
		$("#callInsert").addClass("disnon");
		$(".callInsrt_bg").addClass("disnon");
	})
})
</script>
<script>
$(function(){
	if($(window).width() <800) {
		$('ul.gnb_dp1_wrap').css('overflow', 'hidden');
		$("ul.gnb_dp1_wrap").hover(function(){
			$(this).css('overflow', 'visible');
		}, function(){
			  $(this).css('overflow', 'hidden');
		});
	}
})
</script>
