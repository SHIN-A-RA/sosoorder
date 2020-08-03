<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       		}

 	</style>

	<div class ="all" style="width:100%; overflow:hidden;"> 
	
	<div class="test" style="float:left; width:48%;"></div>
    <input class="p_latitude" name="latitude" value="">
    <input class="p_longitude" name="longitude" value="">
 	<input type="hidden" name="m_marker" id="mar">
 
 	<!-- 지도 -->

 <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3VmoY7UaGpP-jb98kOQmdTnyqJkJgXfQ"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
    <script>
    
    
    //AIzaSyC7DI-uZiw7qkBTyXG-N-fKKEmwYes0s6M

    /*-----------------------------
    	현재위치찾기
    -------------------------------*/
    function getLocation() {
    	  if (navigator.geolocation) { // GPS를 지원하면
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
    	  }
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
			.append($("<h3>").addClass('locationCl').html(item.bizesNm))
		 	.append($("<div>").addClass('locDiv')
		 					.append($('<p>').text(item.rdnmAdr))
							  .append($('<p>').text(item.indsSclsNm))
							  .append($("<input>").addClass("lat").val(item.lat))
							  .append($("<input>").addClass("lon").val(item.lon))
			        ) 
		});//each
		locationCl();
	 	 $( ".test" ).accordion();
		
		var map_view = $('.p_latitude').val()  + "," + $('.p_longitude').val();// 지도 지정위치 
		// var map_marker = "37.554531,126.970663,서울역|37.554400,126.972263,서울역 1호선 1번출구"; //마커위치 구분자 "|" 로 구분 (좌표1,좌표2,마커이름)
		 var zoom = 17; //지도 확대,축소 , 숫자가 낮을수록 축소 1~21 , 기본 9설정
		 var map_id = "map";
		googleMap(map_view,data,zoom,map_id);	

		
	}	
		
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
 	 
/* 
	// var image= {  
	   url: "./resources/admin/img/icon.png", //마커이미지 
	   size: new google.maps.Size(18, 27),  //마커사이즈
	   origin: new google.maps.Point(0, 0),  
	   anchor: new google.maps.Point(9, 27)
	  }; //마커로 사용할 이미지 정의
	  */
	
	 var gmap = new google.maps.Map(
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
	  // icon: "./resources/admin/img/icon.png",
	   map:gmap, 
	   title:latlng[i][2]
	  });
	 }  

    }  
    
	$(document).ready(function(){
	 
 	 getLocation();

	
	});
	
	function locationCl(){
		$('.locationCl').on('click',function(){
			var lan = $(this).next(".locDiv").find(".lat").val();
			var lag = $(this).next(".locDiv").find(".lon").val();
			$('.p_latitude').val(lan);
		    $('.p_longitude').val(lag); 
			
		    getLocation();
		});
	}
 


	</script>
	<div id="map" style="width: 48%; float:right;" class="b"></div>
	
	 </div>
