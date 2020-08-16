<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<style>
#callList{position: fixed; right: 0; bottom: 0; background: #fff;
    height: 93%; width: 22%;}
.callInsert_wrap{padding:30px; }
.callInsert_wrap #messageArea ul{overflow:hidden;}
.callInsert_wrap #messageArea ul li:nth-child(1){float:left; margin-right:30px;}
.callInsert_wrap #messageArea ul li:nth-child(2){float:right; }
.callInsert_wrap #messageArea ul li a{}
</style>
<div id="callList">
	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">호출</h1>
    </div>
 <div class="callInsert_wrap">   
	<div id="messageArea">
		
	</div>
</div>
</div>
<script type="text/javascript">
	
	$(function(){
		callList();
	});
	
	// callList
	function callList(){
		$.ajax({ 
		    url: "callList",  
		    type:'GET',
			contentType:'application/json',
			dataType:'json',
		    success:callListResult,
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	}//callList
	
	//완료 클릭 시
	function callUpdate() {
		$('.btnUpdate').on('click',function(){
			var callNum = $(this).attr('name');
			console.log(callNum);
			$.ajax({ 
			    url: "callUpdate", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({ callNum: callNum}),
			    contentType: 'application/json',
			    success:function(data){
			    	callList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});
	}//callUpdate
	
	//call 목록 조회 응답
	function callListResult(data) {
		$("#messageArea").empty();
		$.each(data,function(idx,item){
			$('<ul>')
			.append($('<li>').html(item.seatNum + '.table  ' + item.callContents))
			.append($('<li>').html('<a class="btnUpdate" name="' + item.callNum + '">완료</a>'))
			.appendTo('#messageArea');
		});//each
		callUpdate();
	}//callListResult
	
	
</script>