<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div style="display: table; margin: auto">
  	<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
	<div style="width: 300px; height: 300px; float: left; margin-right: 30px; margin-left: 70px">  	
	  	<div style="width: 300px; ">
	  		<img alt="썸네일" src=${bbs.thumbnail } width="100%" height="100%">
	  	</div>
	  	<div style="width: 300px; height: 140px;">
	  	<div align="center">
	  		<table>
	  	<tr>
	  		<td>
	  			<span class="font-icon-book">&nbsp;</span><a href="VideoBbsDetail.do?seq=${bbs.video_seq}">${bbs.title }</a><br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<span class="font-icon-group">&nbsp;${bbs.id }<br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<span class="font-icon-eye">&nbsp;${bbs.readcount }<br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<span class="font-icon-calendar">&nbsp;${bbs.wdate }
	  		</td>
	  	</tr>
	  	</table>
	  	</div>
	  	</div>
	</div>
	</c:forEach>
</div>

<form action="VideoBBSWrite.do" method="post" style="text-align: center">
	<c:set var = "auth" value = "${user.auth}"/>
	<c:if test="${auth == 1 || auth == 2}" >
		<input class="button button-small" type="submit" value="게시글 작성" style="margin-top: 30px">
	</c:if>
</form>


