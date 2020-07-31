<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
 <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7DI-uZiw7qkBTyXG-N-fKKEmwYes0s6M
&callback=initMap">
 
</script>
    <script>
    function getLocation() {
    	  if (navigator.geolocation) { // GPS를 지원하면
    	    navigator.geolocation.getCurrentPosition(function(position) {
    	      alert(position.coords.latitude + ' ' + position.coords.longitude);
    	      $('.p_latitude').val(position.coords.latitude)
    	       $('.p_longitude').val(position.coords.longitude)
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
    function location() {
	var latitud = $('.p_latitud').val();
	var longitude = $('.p_longitude').val();
			$.ajax({ 
			    url: latitud + longitude, 
			    type: 'GET', 
			    dataType: 'json', 
			    data: JSON.stringify({ latitud: latitud, longitude:longitude}),
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
		function locationResult(location){
			$('input:text[name="p_latitud"]').val(p_latitud);
			$('input:text[name="p_longitude"]').val(p_longitude);

		}
		
	</script>
  </head>
  <body>

    <h3>My Google Maps Demo</h3>

    <div id="map"></div>
    <div class="p_latitude"></div>
    <input type="text"  class="form-control" name="p_latitud" >
    <div class="p_longitude"></div>
    <input type="text"  class="form-control" name="p_longitude" >
  
  
  
  
    <script>

/* 
function initMap() {

  // The location of Uluru

  var uluru = {lat: -25.344, lng: 131.036};

  // The map, centered at Uluru

  var map = new google.maps.Map(

      document.getElementById('map'), {zoom: 4, center: uluru});

  // The marker, positioned at Uluru

  var marker = new google.maps.Marker({position: uluru, map: map});

} */

    </script>
 -->
    <!--Load the API from the specified URL

    * The async attribute allows the browser to render the page while the API loads

    * The key parameter will contain your own API key (which is not needed for this tutorial)

    * The callback parameter executes the initMap() function

    -->


  </body>

</html>