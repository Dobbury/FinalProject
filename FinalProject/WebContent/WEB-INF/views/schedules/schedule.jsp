<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

	<div>
		<div style="width: 100%; margin: 20%; margin-top: 0">
			<div>
				<div
					style="vertical-align : top; display: inline-block; width: 30%; height: 100%">
					<h2>버스킹 일정</h2>
					<c:set var = "auth" value = "${user.auth}"/>
					<c:if test="${auth == 0 || auth == 2}" >
					<button id="btnAdd" class="button button-small">
						<a href="AddSchedule.do">일정추가</a>
					</button>
					</c:if>
					 <br><br>
					<div style="vertical-align : top; display:  inline-block;" >
					
					<c:forEach items="${schedulelist }" var="bbs" varStatus="vs">
					<table style="border-top: 1px solid">
						<tr>
							<td>팀명 : <a id="profBtn" onclick="fn_profile('${bbs.teamname }')">${bbs.teamname }</a></td>
						</tr>
						<tr>
							<td>지역 : ${bbs.location} </td>
						</tr>
						<tr> 
							<td>장소 : ${bbs.place } </td>
						</tr>
						<tr>
							<td>날짜: ${bbs.scheduledate} </td>
						</tr>
						<tr>
							<td>시간: ${bbs.buskingTime} </td>
						</tr>
						<tr>
							<td><a href="scheduleDetail.do?seq=${bbs.schedule_seq }">상세정보</a></td>
						</tr>
						<tr><td><p></p></td></tr> 
					</table>
					</c:forEach>
					
					</div>
				</div>

				<!-- 
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
				 -->
				 
				 <div
					style="display: inline-block; /* border: 1px solid black; */ width: 30%; height: 100%">
						<table>
							<tr>
								<td colspan="2" align="center"><h2>뮤지션 프로필</h2></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><img alt="profImg" src="_include/img/profile/default-profile.png" id="profImg"  style="width: 70%; height: auto; margin: 10px"></td>		
							</tr>
							<tr>
								<td align="right">팀명</td>
								<td align="center"><input type="text" id="team-name" readonly="readonly"></input></td>
							</tr>
							<tr>
								<td align="right">장르</td>
								<td align="center"><input type="text" id="genre" readonly="readonly"></input></td>
							</tr>
							<tr>
								<td align="right">주 활동지역</td>
								<td align="center"><input type="text" id="location" readonly="readonly"></input></td>
							</tr>
							<!-- <tr>
								<td align="right">뮤지션 소개</td>
								<td align="center"><input type="text" id="team-profile" readonly="readonly"></input></td>
							</tr> -->
						</table>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

$('#team-name').prop("value", "");
$('#genre').prop("value", "");
$('#location').prop("value", "");

function fn_profile(tname) {
	
	$.ajax({
		type : 'POST',
		url : "getProfile.do",
		data : {
			"teamname" : tname
        },
		async:true,
		success : function(data) {
			$('#profImg').prop("src", data.new_profilIMG);
			$('#team-name').prop("value", data.teamname);
			$('#genre').prop("value", data.genre);
			$('#location').prop("value", data.location);
			/*$('#team-profile').prop("value", "팀소개 넣어야됨");*/
			
		},
        error:function(request,status,error){
        	
       	}
		
	});
	
}
/* 
function fn_profile(){
	alert(tname);
	var list = {
			"tname" : tname,
            };
	
    $.ajax({
        type:'POST',
        url : "getProfile.do",
        data: list,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            var html = "";
            var profImg = data.getNew_profilIMG();
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	$('#profImg').prop("src",profImg);
                }
                
            },
        error:function(request,status,error){
        	alert("프로필 ajax실패");
       	}
   	}
});
} */
</script>
