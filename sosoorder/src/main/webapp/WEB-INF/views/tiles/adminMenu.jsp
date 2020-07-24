<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<ul class="gnb_dp1_wrap">
	<!-- 점포관리 -->
	<li class="gnb_dp1">
		<span>점포관리</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="#">일/월 매출 관리</a></li>
			<li class="gnb_dp2"><a href="#">메뉴분석</a></li>
			<li class="gnb_dp2"><a href="#">회원목록</a></li>
			<li class="gnb_dp2"><a href="#">팝업관리</a></li>
			<li class="gnb_dp2"><a href="#">테이블관리</a></li>
			<li class="gnb_dp2"><a href="#">리오더관리</a></li>
			<li class="gnb_dp2"><a href="storeCouponList">쿠폰관리</a></li>
		</ul>
	</li>
	<!-- 직원관리 -->
	<li class="gnb_dp1">
		<span>직원관리</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="employeesList">직원목록</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('gene02')">근태관리</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('gene02')">급여관리</a></li>
		</ul>
	</li>
</ul>