<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<%-- <%
System.out.println("시작");
String []command = {"cmd", "C:\\Users\\jackb\\Desktop\\thumbnail\\bin\\ffmpeg.exe",
		"-i " + cfile + " -ss 00:00:30 -vcodec png -vframes 1 " + oname + "_%2d.png"};
Process p = new ProcessBuilder();

String command = "C:\\Windows\\thumbnail\\bin\\ffmpeg.exe -i C:\\Users\\jackb\\eclipse-workspace\\springSample\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\upload\\1539751958465.mp4 -ss 00:00:30 -vcodec png -vframes 1 bandicam.mp4_%2d.png";
Process process = Runtime.getRuntime().exec(command);
BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
Runtime.getRuntime().exec("C:\\windows\\explorer.exe");
System.out.println("끝");
%> --%>

<table>
  <tr>
    <th>썸네일</th>
    <th>제목</th>
    <th>작성자</th>
    <th>조회수</th>
    <th>작성일</th>
  </tr>
  
  	<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
  	<tr align="center">
		<td>
			<img alt="썸네일" src=${bbs.thumbnail } width="150px" height="80px" >
		</td>
    	<td><a href="VideoBbsDetail.do?seq=${bbs.video_seq}">${bbs.title }</a></td>
		<td>${bbs.id }</td>
		<td>${bbs.readcount }</td>
		<td>${bbs.wdate }</td>
	</tr>
	<br><br>
	</c:forEach>
</table>

<br>
<form action="VideoBBSWrite.do" method="post">
	<input type="submit" value="게시글 작성">
</form>
