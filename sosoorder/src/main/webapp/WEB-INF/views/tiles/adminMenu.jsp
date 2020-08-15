<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">${sessionScope.storeId}</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        	
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item li_1">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>점포관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">점포관리:</h6>
            <a class="collapse-item" href="/sosoroder/storeSales">메뉴분석 및 매출관리</a>
			<a class="collapse-item" href="/sosoroder/storeMenuList">메뉴관리</a>
			<a class="collapse-item" href="/sosoroder/storeMemberList">회원목록</a>
			<a class="collapse-item" href="/sosoroder/storePopupListForm">좌석 및 팝업관리</a>
			<a class="collapse-item" href="/sosoroder/mailList">리오더관리</a>
			<a class="collapse-item" href="/sosoroder/storeCouponListForm">쿠폰관리</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item li_2">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>직원관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">직원관리:</h6>
            <a class="collapse-item" href="/sosoroder/empList">직원목록</a>
			<a class="collapse-item" href="/sosoroder/empSchList">근태관리</a>
			<a class="collapse-item" href="/sosoroder/empSalaryList">급여관리</a>
          </div>
        </div>
      </li>
      
      <!-- Nav Item - Tables -->
      <li class="nav-item li_3">
        <a class="nav-link" href="/sosoroder/storeOrderList">
          <i class="fas fa-fw fa-table"></i>
          <span>주문현황</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
    