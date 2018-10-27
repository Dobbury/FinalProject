<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<style>
h3{
	margin:0px;
	padding: 0px;
}
</style>
<script>
	// Initialize and add the map
	function initMap() {
		// The location of Uluru
		//var uluru = {lat: ${performCastBBSDto.lat}, lng: ${performCastBBSDto.lng}};
		var uluru = {
			lat : 1,
			lng : 1
		};

		// The map, centered at Uluru
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 12,
			center : uluru
		});
		// The marker, positioned at Uluru
		var marker = new google.maps.Marker({
			position : uluru,
			map : map
		});
	}
</script>
<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANm_LhhJlAxtWnzBHskkYxoHViNJhqiKw&callback=initMap">
	
</script>

<div class="container" style="background-color: #26292E; padding: 20px;">
		<table style="width: 100%">
			<col width="80%">
			<col width="20%">
			<tr>
				<th colspan="2">
					<h2>제목</h2>
				</th>
			</tr>
			<tr>
				<td>
					<table style="border: 1px gray solid; width: 100%; ">
						<tr>
							<td style="width: 30%">
							<img style="width: 218px; height: 280px;" src="">
							</td>
							<td style="width: 70%">
								<p>장소:</p>
								<p>날짜:</p> --------------------------줄
								<p>가격정보:</p> --------------------------줄
								<p>참가뮤지션:</p>
								<p>남은 티켓수:</p>
							</td>
						</tr>
					</table>
				</td>
				<td>결제창</td>
			</tr>
			<tr>
				<td>=======================굵은줄
					<h3>공연시간 정보</h3> 
					-----------------------줄
					<div class="perform_date">
					2018년 11월 5일 1시
					</div> 
					=======================굵은줄
					<h3>공연장소 위치</h3> 
					-----------------------줄
					<div class="place">
					kh정보교육원
					</div> =======================굵은줄
					<h3>알립니다</h3> -----------------------줄
					<div class="notice"></div> =======================굵은줄
					<h3>작품설명</h3> -----------------------줄
					<div class="perform_info"></div> =======================굵은줄
					<h3>기획사 정보</h3> -----------------------줄
					<div class="company_info"></div> =======================굵은줄
					<h3>상품관련 정보</h3> -----------------------줄
					<div class="item_info"></div>
				</td>

			</tr>
		</table>
	
</div>