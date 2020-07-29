<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SOSORDER</title>
  
  
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
   <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
  <!-- slick -->
  
  <script src="${pageContext.request.contextPath}/resources/admin/js/slick/slick.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/admin/js/slick/slick.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/js/slick/slick.min.js" rel="stylesheet">
  
  
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
<!--   <script src="resources/admin/vendor/chart.js/Chart.min.js"></script>
 -->
  <!-- Page level custom scripts -->
 <!--  <script src="resources/admin/js/demo/chart-area-demo.js"></script>
  <script src="resources/admin/js/demo/chart-pie-demo.js"></script> -->
  
  <!-- addcss -->
  <link href="${pageContext.request.contextPath}/resources/admin/scss/addcss/common.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/scss/addcss/layout.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/admin/scss/addcss/basic.js"></script>

  <link href="${pageContext.request.contextPath}/resources/admin/scss/addcss/jw.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/scss/addcss/hw.css" rel="stylesheet">
</head>

<body>
	<tiles:insertAttribute name="content"/>
</body>
</html>