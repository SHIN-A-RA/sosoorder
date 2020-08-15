<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //by아라 -->
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       		}
	  .button:hover {
	  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
		}
 	</style>
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3VmoY7UaGpP-jb98kOQmdTnyqJkJgXfQ"></script>
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
	 <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">쿠폰관리</h1>
    </div>
    
	<div class ="all" style="width:100%; overflow:hidden;"> 
		<div class="col-xl-6 fr">
			<div id="map" class="b"></div>
			<div class="tbWrap mt11"></div>	
		</div>
	
		<form action="couponInsert" class="col-xl-6 fl" method="post"> 
			<div class="test"></div>
		</form>
		<div class="aa col-xl-6 fl"></div>
   		<input type="hidden" class="p_latitude" name="latitude" value="">
    	<input type="hidden" class="p_longitude" name="longitude" value="">
    
    <script>
    var gmap;
    //AIzaSyC7DI-uZiw7qkBTyXG-N-fKKEmwYes0s6M
    /*-----------------------------
    	현재위치찾기
    -------------------------------*/
    
    function getLocation() {
    	var apiGeolocationSuccess = function(position) {
    	    alert("API geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
    	};

    	var tryAPIGeolocation = function() {
    	    jQuery.post( "http://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyC7DI-uZiw7qkBTyXG-N-fKKEmwYes0s6M", function(success) {
    	        apiGeolocationSuccess({coords: {latitude: success.location.lat, longitude: success.location.lng}});
    	    })
    	    .fail(function(err) {
    	        alert("API Geolocation error! \n\n"+err);
    	    });
    	};

    	var browserGeolocationSuccess = function(position) {
    	    //alert("Browser geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
    		$('.p_latitude').val(position.coords.latitude);
 	        $('.p_longitude').val(position.coords.longitude); 
 	       locationP();
    	};

    	var browserGeolocationFail = function(error) {
    	    switch (error.code) {
    	        case error.TIMEOUT:
    	            alert("Browser geolocation error !\n\nTimeout.");
    	            break;
    	        case error.PERMISSION_DENIED:
    	            if(error.message.indexOf("Only secure origins are allowed") == 0) {
    	                tryAPIGeolocation();
    	            }
    	            break;
    	        case error.POSITION_UNAVAILABLE:
    	            alert("Browser geolocation error !\n\nPosition unavailable.");
    	            break;
    	    }
    	};

    	var tryGeolocation = function() {
    	    if (navigator.geolocation) {
    	        navigator.geolocation.getCurrentPosition(
    	                browserGeolocationSuccess,
    	                browserGeolocationFail,
    	                {maximumAge: 50000, timeout: 20000, enableHighAccuracy: true});
    	    }
    	};

    	tryGeolocation();


    	
    	
    	
    	
    	
    	/*  if (navigator.geolocation) { // GPS를 지원하면
    	    navigator.geolocation.getCurrentPosition(function(position) {
    	      //alert(position.coords.latitude + ' ' + position.coords.longitude);
    	     	$('.p_latitude').val(position.coords.latitude);
 	      		$('.p_longitude').val(position.coords.longitude); 
    	       locationP();
    	    }, function(error) {
    	      console.error(error);
    	    }, {
    	      enableHighAccuracy: false,
    	      maximumAge: 0,
    	      timeout: Infinity
    	    });
    	 } else {
    	    alert('GPS를 지원하지 않습니다');
    	 } */
    }
    
    
    
    /*-----------------------------
	 반경 1km 주변 상점 불러오기 ajax 호출
	-------------------------------*/
    function locationP(){
		var latitude = $('.p_latitude').val();
		var longitude = $('.p_longitude').val();
		//var m_marker = item.latitude + item.longitude;
			$.ajax({ 
			    url: "sosoOrder", 
			    type: 'GET', 
			    dataType: 'json', 
			    async : false,
			    data:{latitude: latitude, longitude: longitude},
			    success:locationResult,
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});			
	} 
    
    /*-----------------------------
	 반경 1km 주변 상점 불러오기 ajax 콜백
	-------------------------------*/
	function locationResult(data){
		 $.each(data.data,function(idx,item){
		 	$(".test")
			.append($("<h3>").addClass('couponBtn').addClass(item.bizesNm).html(item.bizesNm))
		 	.append($("<div>").addClass('locDiv')
		 					  .append($('<p>').text(item.rdnmAdr))
							  .append($('<p>').text(item.indsSclsNm))
							  .append($("<input type='hidden'>").addClass("lat").val(item.lat))
							  .append($("<input type='hidden'>").addClass("lon").val(item.lon))
		 		) 
		 		 
		});//each
		$.each(data.sosoList,function(idx,item){
			 $("."+item.storeName).attr('name', item.storeId).css('display', 'block')
		}); 
		
	 	 $( ".test" ).accordion({
	 		  activate: function( event, ui ) {
	 			var lat = ui.newPanel.find(".lat").val();
	 			var lon = ui.newPanel.find(".lon").val();
	 			var center = new google.maps.LatLng(lat, lon);
	 			gmap.panTo(center);
	 		  }
	 	});
		
		var map_view = $('.p_latitude').val()  + "," + $('.p_longitude').val();// 지도 지정위치 
		// var map_marker = "37.554531,126.970663,서울역|37.554400,126.972263,서울역 1호선 1번출구"; //마커위치 구분자 "|" 로 구분 (좌표1,좌표2,마커이름)
		 var zoom = 18; //지도 확대,축소 , 숫자가 낮을수록 축소 1~21 , 기본 9설정
		 var map_id = "map";
		googleMap(map_view,data,zoom,map_id);	
    }
    
    /*-----------------------------
	선택한 상점의 쿠폰 값 조회 요청
	-------------------------------*/
   $(function(){
	   couponInsert();   
       $('.test').on('click','.couponBtn', function(){
    	   var storeId = $(this).attr('name');
         $.ajax({
              url:'gps2',
              type:'GET',
              data: {storeId : storeId},
              contentType:'application/json;charset=utf-8',
		      dataType:'json',
		      error:function(xhr,status,msg){
				/* alert("상태값 :" + status + " Http에러메시지 :"+msg); */
				sosoResult();
			},
			success:sosoResult
	     });
     });
   });

   /*-----------------------------
	선택한 상점의 쿠폰 값 조회 콜백
	-------------------------------*//* border="1" style="width: 50%; margin: auto;" */
    function sosoResult(data) {
		$(".tbWrap").empty();
		$.each(data,function(idx,item){
			$('<table>').addClass('tb_style_jw')
						.html(
						'<tr>' +
							'<th>' +
								'<p><span>' + item.discount +'</span>원 할인쿠폰</p>'+
								'<p>' + item.serialNum  + '</p>'+
							'</th>'+
							'<td>'+
								 '<p> 쿠폰기한 :' + item.expStart + ' ~ '+ item.expEnd + '</p>'+
								'<p>' + item.discount + '원 할인</p>'+
							'</td>'+
							'<td>'+
							 '<button class ="btnInsert"  class="button" name="' + item.serialNum + '">쿠폰저장</button>' +
						'</td>'+
						'</tr>'+
						'<tr style="height: 20px;"></tr>'
							
			).appendTo('.tbWrap');
			

		});//each
		couponInsert();
	}//sosoResult
	
	function couponInsert(){
		//등록 버튼 클릭
		$('.btnInsert').on('click',function(){
 			var serialNum = $(this).attr('name');
			$.ajax({ 
			    url: "couponInsert",  
			    type: 'POST', 
			    dataType: 'json', 
			    contentType: 'application/json',
			    data:JSON.stringify({serialNum:serialNum}),
			    success: function(response) {
						alert('쿠폰이 저장되었습니다.');
			    }, 
			    error:function(xhr, status, message) { 
			        alert('로그인이 필요한 서비스입니다.');
			        location.href="memberLoginForm";
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert

/* 	$(function(){
	       $('.test').on('click','.couponBtn', function(){
	    	   var storeId = $(this).attr('name');
	         $.ajax({
	              url:'gps2',
	              type:'GET',
	              data: {storeId : storeId},
	              contentType:'application/json;charset=utf-8',
			      dataType:'json',
			      error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg); 
				},
				success:sosoResult
		     });
	     });
	   }); */
	
    /*-----------------------------
	 	지도 그리기 
	-------------------------------*/	
	function googleMap(map1,map2,map3,id){
	 var tmp_map1 = map1.split(",");
	 var tmp_map2 = map2.data;
	 var mymap=document.getElementById(id);
	 var gcenter = [[tmp_map1[0],tmp_map1[1],4]]; //지도의 중앙
	 var latlng = new Array(); //마커를 위해 위치 객체 생성(배열가능)
	 for(var i=0;i < tmp_map2.length;i++){
		  latlng[i] = [tmp_map2[i].lat,tmp_map2[i].lon,tmp_map2[i].rdnmAdr];		  
	 }
	 console.log(latlng); 

	 var image= {  
	   url: "./resources/admin/img/icon5.png", //마커이미지 
	   size: new google.maps.Size(32, 38),
       scaledSize: new google.maps.Size(32, 38),
       labelOrigin: new google.maps.Point(10, -8),
	 	fillColor: '#000000'
	  }; //마커로 사용할 이미지 정의
	
	
	 gmap = new google.maps.Map(
	 mymap,{  zoom:map3,  //줌
			  left:new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			  center:new google.maps.LatLng(gcenter[0][0], gcenter[0][1]),
			  //icon:"./resources/admin/img/icon.png",
			  mapTypeId:google.maps.MapTypeId.ROADMAP} //맵타입
	 );
	 var marker, i;
 	 for (i = 0; i < latlng.length; i++) { //미커를 여러개 찍을때 사용
	  marker=new google.maps.Marker({
	   position: new google.maps.LatLng(latlng[i][0], latlng[i][1]),
	   icon: image,
	   map:gmap, 	
	   label:tmp_map2[i].bizesNm,
	  });
	  
	}
}

    /*-----------------------------
 		상점 선택시 중심값 이동
	-------------------------------*/	
	$(document).ready(function(){
 	 getLocation();
	});
	 function moveToLocation(lat, lng){
		var center = new google.maps.LatLng(lat, lng);
		gmap.panTo(center);
	}
	</script>
	
	<script>
	$(function(){
		$( '.menu2' ).addClass( 'active' );
	});
	
</script>
	
	</div>
