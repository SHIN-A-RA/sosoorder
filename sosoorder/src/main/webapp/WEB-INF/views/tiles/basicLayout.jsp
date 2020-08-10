<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
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
   <link href="${pageContext.request.contextPath}/resources/admin/scss/addcss/ara.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/scss/addcss/gr.css" rel="stylesheet">
    
    <script type="text/javascript">

		let sock = new SockJS("http://localhost/sosoroder/echo/");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		
		// 메시지 전송
		function sendMessage(msg) {					
			sock.send(JSON.stringify(msg)); 
		}
		
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			
			 msg = JSON.parse(msg.data);
			if(msg.cmd == 'callInsert') {
				callList();	
			} else if(msg.cmd == 'orderInsert'){
				
			} else if(msg.cmd == 'startCook'){
				
			} else if(msg.cmd == 'endCook'){
				
			} 
					
			
			
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#messageArea").append("연결 끊김");
		
		}
		
	</script>
    
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
		<!-- top -->
		<header id="hd_wrap" class="over hd-up">

			<div id="hd_gnb" class="gnb_pc">
				<div id="gnb_menu" class="hd_gnb_menu">
					<c:if test="${sessionScope.storeId != null}"><span></span></c:if>	
				</div>
				
				
				<tiles:insertAttribute name="menu"/>
				<script>
				function removeSession(){
					location.href="/sosoroder/removeSession";
				};
				</script>
				
				<div class="nav-item dropdown no-arrow" style="position: absolute; right: 0; top: 0; z-index: 9;" >
	              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	               
	              		<c:if test="${empty sessionScope.phone && empty sessionScope.storeId}">
							<span class="mr-2 d-none d-lg-inline" style="font-size: 21px;" onclick="location.href='/sosoroder/memberLoginForm'">로그인</span>
	              		</c:if>
		               	<c:if test="${not empty sessionScope.phone}">
			               	  <script>
				               	$(function(){
					                var sar = ${sessionScope.phone};
					                var members = sar.toString().slice(-4);
					                $('.mr-phone').html(members+"님");
					                $('.gb_ub').html(members+"님");
								});		               	
			               	  </script>
		               	  	<span class="mr-2 d-none d-lg-inline mr-phone" style="font-size: 21px;"></span>
		               	</c:if>
	               		<c:if test="${sessionScope.storeId != null}">
	               			  <script>
				               	$(function(){
					                $('.mr-storeId').html("${sessionScope.storeId} 사장님");
					                $('.gb_ub').html("${sessionScope.storeId} 사장님");
								});		               	
			               	  </script>
	             			<span class="mr-2 d-none d-lg-inline mr-storeId" style="font-size: 21px;"></span>
	             		</c:if>
	               <i class="fa fa-user-circle-o gb_click" aria-hidden="true" style="font-size: 47px; vertical-align: middle;"></i>
	               
	              </a>
              </div>
            <c:if test="${not empty sessionScope.phone || not empty sessionScope.storeId}">		
       		<div class="gb_jb">
  				<div class="gb_tb gb_ub"></div>
  				<c:if test="${not empty sessionScope.phone}">
   					<input type="button" class="myUpdate" onclick='' value="정보수정"/>
   				</c:if>
   				<input type="button" class="logout" onclick='removeSession()' value="Logout"/>
      		</div>
      		</c:if>
      		<script>
      			$(function(){
      				$('.gb_jb').hide();
      				$('.gb_click').on("mouseenter", function(){
      			        $('.gb_jb').show();
      			    });
      			  $('.gb_jb').on("mouseleave", function(){
    			        $('.gb_jb').hide();
    			    });
      			});
      		</script>
				<!--  -->
<!--===============================================================================================================
			End of 로그인/로그아웃 
=============================================================================================================== -->
			</div>
			<!-- hd_gnb -->
			<div class="hd_bg"></div>
		</header>
		
		<div id="gnb_menu_box" class="gnb_mo_menu">
			<tiles:insertAttribute name="adminMenu"/>
			<ul class="con">
				<li><%= request.getAttribute("s_storeName") %></li>
				<li><%= request.getAttribute("s_storeAddr") %></li>
			</ul>
		</div>
		<!-- top End-->
		
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <!-- <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div> -->
          
          



       <!-- 컨텐츠 영역 -->
       	<tiles:insertAttribute name="content"/>
       <!-- 컨텐츠 영역 -->
       
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; SOSORDER 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

 
</body>

</html>
