<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<iframe src="report.do?payNum=${receipt.paynum}"
style="width: 100%; height:500px; border:1px solid #333;">
	이 브라우저는 iframe을 지원하지 않습니다.
</iframe>
<p><a href="reportDown?payNum=${receipt.paynum}">영수증 다운 받기</a></p>