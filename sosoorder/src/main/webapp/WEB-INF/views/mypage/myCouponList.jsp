<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>

$(function() {
	myCouponDelete();

});
//삭제 요청
function myCouponDelete() {
	//삭제 버튼 클릭
	$('.table_wrap').on('click','.btnDelete',function(){
		var serialNum = $(this).attr("name");
		var result = confirm(serialNum +" 쿠폰을 정말로 삭제하시겠습니까?");
		if(result) {
			$.ajax({
				 url: "myCouponDelete/" + serialNum, 
				type:'DELETE',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					console.log("상태값 :" + status + " Http에러메시지 :"+msg);
				}, success:function(xhr) {
					location.reload();
				}
			});
		}//if
	}); //삭제 버튼 클릭
}//couponDelete

</script>



	<div class = "btn-group">
		<input type="button" class="btn btn-primary value="삭제" id="btnDelete"/>
	</div>


    <c:forEach items="${getCoupon}" var="coupon">
	     	<table border="1" style="width:50%; margin:auto;" class="table_wrap">
	     	<tr>
	     		<th style="background-color: #cc87d8; width: 30%; text-align: center;">
	 	    	    <p style="color: white">${coupon.discount}</p>
					<p style="color: white">할인쿠폰</p>						     		
	     		</th>
	     		<td style="padding: 10px 10px 10px 10px;">
	     			<p>${coupon.storeName}</p>
	     			<p>${coupon.expStart}</p>
	     			<p>${coupon.expEnd}</p>
	     			<p>${coupon.serialNum}</p>
	     			<button class="btnDelete" name="${coupon.serialNum}">삭제</button>
	     		</td>
	     	</tr>    
	     	<tr style="height: 20px;">
	     	</tr>  
	     	</table>	        		
      	 </c:forEach>  


