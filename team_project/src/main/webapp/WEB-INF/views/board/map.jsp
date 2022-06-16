<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="/resources/js/mapcontrol.js" charset="utf-8"></script>
<script>

</script>
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:800px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79d59ffd11309e2ab5d84255287e1d1d"></script>
	<div class="rightcolumn" id="map">
		<script>
			var mapContainer = document.getElementById('map'), mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 12
			// 지도의 확대 레벨
			};
			var map = new kakao.maps.Map(mapContainer, mapOption),
			 	customOverlay = new kakao.maps.CustomOverlay({}),
			 	infowindow = new kakao.maps.InfoWindow({removable: true});
			Initialization(map);
			DrawPolygon();
			
			
			
		</script>
	</div>
</body>
</html>