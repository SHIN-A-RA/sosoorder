<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<ul class="gnb_dp1_wrap">
	<!-- 점포관리 -->
	<li class="gnb_dp1">
		<span>점포관리</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="/sosoroder/storeSales">메뉴분석 및 매출관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/storeMenuList">메뉴관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/storeMemberList">회원목록</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/storePopupListForm">팝업관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/seatInsertForm">좌석관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/mailList">리오더관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/storeCouponListForm">쿠폰관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/storeOrderList">주문현황</a></li>
		</ul>
	</li>
	<!-- 직원관리 -->
	<li class="gnb_dp1">
		<span>직원관리</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="/sosoroder/empList">직원목록</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/empSchList">근태관리</a></li>
			<li class="gnb_dp2"><a href="/sosoroder/empSalaryList">급여관리</a></li>
		</ul>
	</li>
</ul>