<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       		}
    </style>
 <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7DI-uZiw7qkBTyXG-N-fKKEmwYes0s6M
&callback=initMap"></script>
    <script>
    function getLocation() {
    	  if (navigator.geolocation) { // GPS를 지원하면
    	    navigator.geolocation.getCurrentPosition(function(position) {
    	      //alert(position.coords.latitude + ' ' + position.coords.longitude);
    	      $('.p_latitude').val(position.coords.latitude);
    	       $('.p_longitude').val(position.coords.longitude);
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
    	getLocation();
    </script>
    <script>
    function locationP(){
	var latitud = $('.p_latitud').val();
	var longitude = $('.p_longitude').val();
			$.ajax({ 
			    url: "sosoOrder", 
			    type: 'GET', 
			    dataType: 'json', 
			    data: JSON.stringify({ latitude: latitude, longitude:longitude}),
			    success: function(data) { 
			    	success:locationResult
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
	}
	</script>
	<script>
		function locationResult(){
			$.each(data,function(idx,item){
				$(".test")
				.append($("<div>").html(item.지원))
				.append($("<div>").html(item.지원))
				.append($("<div>").html(item.지원))
			});//each
		}	
	</script>
	<div class="test"></div>
    <input class="p_latitude" name="latitude" value="">
    <input class="p_longitude" name="longitude" value="">
