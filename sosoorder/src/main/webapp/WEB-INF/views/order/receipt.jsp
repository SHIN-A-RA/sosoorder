<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<iframe src="report.do?payNum=${receipt.paynum}"
style="width: 100%; height:500px; border:1px solid #333;">
	�� �������� iframe�� �������� �ʽ��ϴ�.
</iframe>
<p><a href="reportDown?payNum=${receipt.paynum}">������ �ٿ� �ޱ�</a></p>