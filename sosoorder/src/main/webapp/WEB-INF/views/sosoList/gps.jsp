<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       		}
    </style>
 <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7DI-uZiw7qkBTyXG-N-fKKEmwYes0s6M"></script>
    <script>
    $(function(){
    	getLocation();
    	locationP();
	});
    
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
	var latitude = $('.p_latitude').val();
	var longitude = $('.p_longitude').val();
			$.ajax({ 
			    url: "sosoOrder", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({latitude: latitude, longitude: longitude}),
			    contentType: 'application/json',
			    success:locationResult,
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
			
			
			
	}
    
/*     {"bldSlno":"","rdnm":"대구광역시 중구 경상감영길","indsMclsCd":"Q12",
   "ctprvnNm":"대구광역시","bizesId":10296647,"lon":128.590105784246,
   "lnoCd":2711014400200780001,"indsLclsNm":"음식",
   "lnoAdr":"대구광역시 중구 서문로1가 78-1번지","rdnmCd":271104223003,
   "bldMnno":48,"newZipcd":41919,"dongNo":"",
   "rdnmAdr":"대구광역시 중구 경상감영길 48, (서문로1가)","bizesNm":"현",
   "adongCd":2711057500,"oldZipcd":700251,"plotSctNm":"대지","hoNo":"",
   "ldongNm":"서문로1가","indsSclsCd":"Q12A01","signguNm":"중구",
   "flrNo":"","lat":35.8713348279286,"ksicCd":"I56220","indsMclsNm":"커피점/카페",
   "ldongCd":2711014400,"bldMngNo":"2711014400100780001005702","indsLclsCd":"Q",
   "bldNm":"","ctprvnCd":27,"plotSctCd":1,"adongNm":"성내2동",
   "lnoMnno":78,"brchNm":"","indsSclsNm":"커피전문점/카페/다방",
   "signguCd":27110,"ksicNm":"비알콜 음료점업","lnoSlno":1} */
    
    
	function locationResult(data){
		 	$.each(data.data,function(idx,item){
			$("<div>")
			.append($("<div>").html(item.rdnm))
			.appendTo(".test");
		});//each
	}	 
	</script>
	<div class="test"></div>
    <input class="p_latitude" name="latitude" value="">
    <input class="p_longitude" name="longitude" value="">
