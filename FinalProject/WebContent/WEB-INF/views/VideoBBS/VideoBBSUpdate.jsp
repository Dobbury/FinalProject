<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
게시글 수정=====

${getVideoBbs.title }
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdateAf.do">
	<table border="solid">
	<tr>
		<th>THUMBNAIL</th>
		<th>ID</th>
		<th>TITLE</th>
		<th>READCOUNT</th>
		<th>CONTENT</th>
		<th>VIDEO</th>
	</tr>
	
	<tr align="center">
		<td><img src= ${getVideoBbs.thumbnail } width="200" height="150" alt="Thumbnail" title="Thumbnail"></td>
		<td>${getVideoBbs.id }</td>
		<td><input type="text" name="title" id="_title" value="${getVideoBbs.title }"></td>
		<td>${getVideoBbs.readcount }</td>
		<td style="text-align: left"><textarea rows="10" cols="50" 
			name='content' id="_content">${getVideoBbs.content }</textarea></td>
		<td>
			<video
				style="margin: 45px; display: inline-block; width: 80%; height: 250px"
				src=${getVideoBbs.video } controls="controls">이 브라우저는 재생이 불가능합니다.
			</video>
		</td>
	</tr>
	</table>
	
	<c:if test="${getVideoBbs.id eq user.id}">
	<a href="#none" id="_btnUpdate" title="글수정하기">수정하기</a>
	</c:if>
</form>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdateAf.do?seq="+${getVideoBbs.video_seq } }).submit();
});
</script>




