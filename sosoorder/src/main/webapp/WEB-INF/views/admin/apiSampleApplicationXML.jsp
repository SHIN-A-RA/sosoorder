<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="/js/jquery-1.8.3.min.js"></script>

<script language="javascript">
function getAddr(){
	// AJAX 주소 검색 요청
	$.ajax({
		url:"/sample/getAddrApi.do"									// 고객사 API 호출할 Controller URL
		,type:"post"
		,data:$("#form").serialize() 								// 요청 변수 설정
		,dataType:"xml"												// 데이터 결과 : XML
		,success:function(xmlStr){									// xmlStr : 주소 검색 결과 XML 데이터
			$("#list").html("");									// 결과 출력 영역 초기화
			var errCode= $(xmlStr).find("errorCode").text();		// 응답코드
			var errDesc= $(xmlStr).find("errorMessage").text();		// 응답메시지
			if(errCode != "0"){ 									// 응답에러시 처리
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr!= null){
					makeList(xmlStr);								// 결과 XML 데이터 파싱 및 출력
				}
			}
		}
		,error: function(xhr,status, error){
			alert("에러발생");										// AJAX 호출 에러
		}
	});
}

function makeList(xmlStr){
	var htmlStr = "";
	htmlStr += "<table>";
	// jquery를 이용한 XML 결과 데이터 파싱
	$(xmlStr).find("juso").each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.entX+"</td>";
		htmlStr += "<td>"+this.entY+"</td>";
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	// 결과 HTML을 FORM의 결과 출력 DIV에 삽입
	$("#list").html(htmlStr);
}	
</script>
</script>
<title>OPEN API 샘플 소스</title>
</head>
<body>
<form name="form" id="form" method="post">
    <input type="text" name="confmKey" value="TESTJUSOGOKR"/><!-- 요청 변수 설정 (승인키) -->
	<input type="text" name="admCd" value=""/> <!-- 요청 변수 설정 (행정구역코드) -->
	<input type="text" name="rnMgtSn" value=""/><!-- 요청 변수 설정 (도로명코드) --> 
	<input type="text" name="udrtYn" value=""/> <!-- 요청 변수 설정 (지하여부) -->
	<input type="text" name="buldMnnm" value=""/><!-- 요청 변수 설정 (건물본번) --> 
	<input type="text" name="buldSlno" value=""/><!-- 요청 변수 설정 (건물부번) --> 
	<input type="button" onClick="getAddr();" value="좌표검색하기"/>
	<div id="list" ></div><!-- 검색 결과 리스트 출력 영역 -->

</form>
</body>
</html>