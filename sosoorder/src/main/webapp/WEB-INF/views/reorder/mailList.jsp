<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script>

    $(document).ready(function() {
        $('#table_id').DataTable( {
            "order": [[ 3, "desc" ]]
        } );
    } );
    </script>    



<!-- Page Heading -->
<div
	class="d-sm-flex align-items-center justify-content-between mb-4 pd15 mt30"
	style="border-bottom: 1px solid #d2d2d2">
	<h1 class="h3 mb-0 text-gray-800">점포관리 - 리오더 전송목록</h1>
</div>
	
	<table id="table_id" class="display">
          <thead>
              <tr>
                  <th>번호</th> 
                  <th>발송내역</th>
                  <th>발송건수</th>
                  <th>날짜</th>
              </tr>
          </thead>
          <tbody>
         <c:forEach items ="${mailList}" var="reorder">
		 	<tr>
		 		<td>${reorder.reorderNum }</td> 
		 		<td> ${reorder.title }</td>
		 		<td> ${reorder.memberNum }</td>
		 		<td> ${reorder.reorderDate }</td>
		 	</tr>	
		 </c:forEach>
		 
          </tbody>
      </table>
   
	<ul class="btn_confirm write_div btn btn-primary fr">
           <li class="btn_submit btn"><a href="mailwrite.do" style="color:#fff"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 리오더 메일 발송</a></li>
         </ul>
 <script>
	$(function(){
		if($(window).width() >768) { 
			$( '.navbar-nav li.li_1 a.nav-link' ).removeClass( 'collapsed' );
			$( '.navbar-nav li.li_1 a.nav-link' ).attr("aria-expanded", "true");
			$( '.navbar-nav li.li_1 #collapseTwo' ).addClass("show");
			$('.navbar-nav li.li_1 #collapseTwo .collapse-item:nth-child(6)').css("backgroundColor", "#eaecf4")
		}
	});
</script>
 
