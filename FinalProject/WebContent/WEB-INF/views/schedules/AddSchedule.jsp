<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>일정 추가</title>
</head>
<body>

<form action="AddScheduleAf.do" method="post">
       공연 시작 - <input type="date" name="sdate"><br>
       공연 종료 - <input type="date" name="edate"><br>
       지역 - <select name="location">
       			<option>서울</option>
       			<option>부산</option>
       			<option>경기도</option>
       			<option>충청도</option>
       			<option>전라도</option>
       			<option>경상도</option>
       			<option>강원도</option>
       			<option>제주도</option>
       		</select><br>
       장소 - <input type="text" name="place"><br>
       공연 횟수 - <input type="text" name="count"><br>
       티켓 값 - <input type="text" name="price"><br>
       <!-- 버스킹 팀 - <input type="text" name="name" readonly="readonly"> -->
       <br>
       <input type="submit" value="일정추가">
</form>


</body>
</html>