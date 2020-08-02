<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<ul class="gnb_dp1_wrap">
	<!-- 고객메뉴 -->
	<li class="gnb_dp1 menu1"><span><a href="/sosoroder/homeSample"><i class="fa fa-cutlery" aria-hidden="true"></i> 메뉴</a></span></li>
	<!-- 내 주변 쿠폰 -->
	<li class="gnb_dp1 menu2"><span><a><i class="fa fa-map-marker" aria-hidden="true"></i> 내 주변 쿠폰</a></span></li>
	<!-- 호출 -->
	<li class="gnb_dp1 menu3">
		<span>
			<a href="/sosoroder/callInsertForm" onclick="window.open(this.href,'팝업창','width=400, height=200'); return false;">
				<i class="fa fa-bell" aria-hidden="true"></i> 호출
			</a>
		</span>
	</li>
</ul>