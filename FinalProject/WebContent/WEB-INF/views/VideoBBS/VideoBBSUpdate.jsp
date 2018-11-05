<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">
#id,#pwd,#name,#phone,#email,#birth{
	height: 30px
}

.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<div style="width: 520px; margin: auto;text-align: center">
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdateAf.do">
	<table>
		<tr align="center">
			<td><img src= ${getVideoBbs.thumbnail } width="100%" alt="Thumbnail" title="Thumbnail"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" readonly="readonly" value="${getVideoBbs.id }"></input></td>
		</tr>
		<tr>
			<td align="center"><input type="text" name="title" id="_title" value="${getVideoBbs.title }"></td>
		</tr>
		<tr>
			<td align="center"><span class="font-icon-eye">&nbsp;&nbsp;${getVideoBbs.readcount }</td>
		</tr>
		<tr>
			<td align="center"><textarea type="text" name="content" id="_content" style="text-align: center" cols="1" rows="7">${getVideoBbs.content }</textarea></td>
		</tr>
	</table>
	
	<c:if test="${getVideoBbs.id eq user.id}">
	<a href="#none" id="_btnUpdate" title="글수정하기">수정하기</a>
	</c:if>
</form>
</div>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdateAf.do?seq="+${getVideoBbs.video_seq } }).submit();
});
</script>




