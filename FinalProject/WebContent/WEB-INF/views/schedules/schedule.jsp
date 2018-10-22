<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <title>일정관리</title>
	<div>
		<div style="width: 1200px; margin: 0 auto">
			<div>
				<div
					style="vertical-align : top; display: inline-block; width: 59%; height: 1600px">
					<h2>버스킹 일정</h2>
					<button id="btnAdd">
						<a href="./AddSchedule.do">일정추가</a>
					</button>
					
					<!-- 삭제 만들어야 함-->
				<!-- 	<button id="btnDelete">
						<a href="./DeleteSchedule.do">일정삭제</a>
					</button> -->
					
					<button id="btnDetail">
						<a href="./scheduleDetail.do">디테일</a>
					</button>
					
					 <br><br>
					<div style="vertical-align : top; display:  inline-block; border-top: 1px solid"; >
					<c:forEach items="${schedulelist }" var="bbs" varStatus="vs">
						<tr align="center">
							<td>지역 : ${bbs.location} </td> 
							<td>장소 : ${bbs.place } </td>
							<td>날짜 시간 : ${bbs.sdate} </td>
							 
							<%-- <td>종료일 : ${bbs.edate} </td> --%> 
							<%-- <td>공연횟수 : ${bbs.count }</td><br> --%>
							<%-- <td>티켓값 : ${bbs.price }</td><br> --%>
							<%-- <td><a href="schedule.do?seq=${bbs.MEM_SEQ}">${bbs.title}</a></td> --%>
						</tr>
						<br>
					</c:forEach>
					</div>
				</div>


				<div
					style="display: inline-block; /* border: 1px solid black; */ width: 40%; height: 1600px">
						<video
							style="margin: 45px; display: inline-block; width: 80%; height: 250px"
							src="test!.mp4" controls="controls">이 브라우저는 재생이 불가능합니다.
						</video><br>
						<h3 align="center">당신의 공간에 즐거움을 채워보세요</h3>
						<h4 align="center">버스킹존 제휴를 통해 <br> 새로운 문화공간으로 만들어보세요.</h4><br>
						<video style="margin: 45px; display: inline-block; width: 80%; height: 250px"
							src="test.mp4" controls="controls">이 브라우저는 재생이 불가능합니다.</video>
						
				</div>


			</div>
			</div>
		</div>
	</div>


</body>
</html>
