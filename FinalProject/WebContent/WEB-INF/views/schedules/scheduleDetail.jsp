<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=7jDiA2eGlnohjqqS_ELa&submodules=geocoder"></script>
<head>
<style type="text/css">
#map_v3 {
	height:600px;
	margin:0 auto;
	max-width:100%;
	width:900px;
}

.iw_inner {padding:10px}
.iw_inner h3 {font-size: 18px; padding-bottom: 7px}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div>
		<div style="width: 1200px; margin: 0 auto">
			<div>
				<div style="display: inline-block; border: 1px solid black; width: 59%; height: 1600px">
					<h4>지도 공연장소(글로)</h4>
					<!-- <div id="map" style="width:100%; height:360px;"></div> -->
					<div id="map_v3"></div>
					
					<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
						<tr align="center">
							<td>장소 : ${bbs.place }</td>
						</tr>
						<br>
					</c:forEach>
					
				</div>


				<div
					style="display: inline-block; border: 1px solid black; width: 40%; height: 1600px">
					<h2>정보랑 티켓</h2>

				</div>
			</div>
		</div>
	</div>

<script>

	// div 에 설정된 id 값을 이용해서 지도를 생성합니다.
		new naver.maps.Map('map_v3', { // map_v3 사용
		center : new naver.maps.LatLng(37.498206, 127.027610), // 지도위치 설정. 위도, 경도를 입력합니다.
		zoom : 10, // 지도 줌 상태. 값은 1 ~ 14 이고 클수록 지도가 확대됩니다. (줌인)
		mapTypeControl : true // 일반, 위성 컨트롤 버튼 보이기
	});
	
		var map = new naver.maps.Map('map_v3', {
		    center: new naver.maps.LatLng(37.498206, 127.027610),
		    zoom: 10
		});

		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(37.498206, 127.027610),
		    map: map
		});
		

</script>


</body>
</html>