<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
	window.onload = function() {
		var myLatlng = new google.maps.LatLng(37.5790646,126.890691);
		var mapOptions = {
			zoom : 17,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : "Broadwave"
		});
		var infowindow = new google.maps.InfoWindow(
				{
					content : "누리꿈스퀘어 R&D타워 1009호",
					maxWidth : 300
				});
		infowindow.open(map, marker);
	}
</script>
</head>
<body>
	
	<div id="map_canvas" style="width: 100%; height: 50%;"></div>
	<a href="mail.mail"><font size="50" color="red">메일 보내기</font></a>
</body>
</html>
