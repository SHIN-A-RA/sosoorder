<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#popupWrap{}
	.pop_box{position: absolute; left: 50%; top: 50%; z-index: 8; background: #fff;
    border: 1px solid #c5c5c5; border-radius: 9px; transform:translate(-50%, -50%); z-index: 9;}
    .pop_box.popcheck_0{display:none !important;}
	@media all and (max-width:600px) {
		.pop_box{width:90%; margin:0 auto; left:5% !important; top: 50px !important}
		.pop_box img{width:100% !important}
	}
	.btnPopup{width:100%; height:45px; line-height:45px; background:#333;}
	.btnPopup div{color:#FFF; padding:0px 20px; background:#1d1d1d; cursor:pointer;}
	.poptit{padding: 9px; border-bottom: 1px solid #eee; font-size: 18px;}
</style>

<div id="popupWrap"></div>


<script>

 $(function(){
	    getPopup();
	    
	});
	 
//사용자 목록 조회 요청
	function getPopup() {
		$.ajax({
			url:'/sosoroder/storePopupListPro', //팝업 프로시저 ( 팝업 호출 + 팝업 사용 유무 업데이트 ) 
			type:'GET',
			dataType:'json',
			success:popupResult,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			}
	})//userList
	}
	//팝업 조회 응답
	function popupResult(data) {
		$("#popupWrap").empty();
		$.each(data,function(idx,item){
			$('<div>').addClass('pop_box').addClass('popNum_' + item.popNum).addClass('popcheck_' +item.popCheck).html(
				"<div class='poptit'>" +item.popTitle + "</div>" +
    			"<img src='${pageContext.request.contextPath}/resources/download/"+ item.popImage+"' />"+
    			"<div class='popcontents'>"+ item.popContents+"</div>"+
    			"<div class='btnPopup'>"+
    			"<div class='fl setCookie' name ='" + item.popNum + "'>하루동안 열지않기</div>"+
    			"<div class='fr closeWin'>닫기</div> ").appendTo('#popupWrap');
			closeWin();
			cookieClose();
			getCookieMobile('popNum_' + item.popNum);

		});//each
	}//popupResult
	
	
	//팝업 닫기
	function closeWin(){
		$('.closeWin').on("click", function(){
			$(this).parents('.pop_box').hide();
		});
	}
	
	//하루보지 않기를 클릭시 쿠키에 클릭한 popNum이 저장된다.
	function cookieClose(){
		$('.setCookie').on("click", function(){
			var popupYN = 'popNum_' + $(this).attr('name');
			setCookie(popupYN, "N", 1);
			$(this).parents('.pop_box').hide();
		});
	}
	
	function setCookie(name, value, expiredays) {
        var date = new Date();
        date.setDate(date.getDate() + expiredays);
        document.cookie = escape(name) + "=" + escape(value) + "; expires=" + date.toUTCString();
    }
	
	//쿠키에 저장된 값이 있으면 화면에 안보여주기
	function getCookieMobile (popNum_n) {
	    var cookiedata = document.cookie;
	    if ( cookiedata.indexOf(popNum_n + "=N") < 0 ){
	         $("."+popNum_n).show();
	    }
	    else {
	        $("."+popNum_n).hide();
	    }
	}
	
	
	
	

    

	





</script>


