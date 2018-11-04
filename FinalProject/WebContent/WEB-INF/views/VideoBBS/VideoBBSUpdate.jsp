<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div style="width: 520px; margin: auto;text-align: center">
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdateAf.do">
	<table>
	<tr align="center">
		<td><img src= ${getVideoBbs.thumbnail } width="100%" alt="Thumbnail" title="Thumbnail"></td>
		</tr>
		<tr>
			<td align="center"><span class="font-icon-group">&nbsp;&nbsp;${getVideoBbs.id }</td>
		</tr>
		<tr>
			<td align="center"><span class="font-icon-book">&nbsp;&nbsp;<input type="text" name="title" id="_title" value="${getVideoBbs.title }"></td>
		</tr>
		<tr>
			<td align="center"><span class="font-icon-eye">&nbsp;&nbsp;${getVideoBbs.readcount }</td>
		</tr>
		<tr>
			<td style="text-align: center"><span class="font-icon-paste">&nbsp;&nbsp;<textarea rows="10" cols="100" 
			name='content' id="_content">${getVideoBbs.content }</textarea></td>
		</tr>
		<tr>
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
</div>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdateAf.do?seq="+${getVideoBbs.video_seq } }).submit();
});
</script>




