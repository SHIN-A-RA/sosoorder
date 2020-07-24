<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		

<head>
<title>내 쿠폰함</title>
</head>
<body>

      <c:forEach items="${getCoupon}" var="coupon">
	     	<table border="1" style="width:50%;">
	     	<tr>
	     		<th style="background-color: #cc87d8; width: 30%; text-align: center;">
	 	    	    <p style="color: white">${coupon.discount}</p>
					<p style="color: white">할인쿠폰</p>						     		
	     		</th>
	     		<td style="padding: 10px 10px 10px 10px;">
	     			<p>${coupon.storeName}</p>
	     			<p>${coupon.expStart}</p>
	     			<p>${coupon.expEnd}</p>
	     			<p>${coupon.serialNum}</p><button>삭제</button>
	     		</td>
	     	</tr>    
	     	<tr style="height: 20px;">
	     	</tr>  
	     	</table>	        		
      	 </c:forEach>  

</body>
