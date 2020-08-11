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



	<h3>리오더 전송목록</h3>
	
	
	
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
   
	<ul class="btn_confirm write_div">
           <li class="btn_submit btn fr"><a href="mailwrite.do"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>리오더 메일 발송</a></li>
         </ul>
 
 
