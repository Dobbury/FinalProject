<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
영상게시글 작성 페이지
	
<form action="VideoBBSWriteAf.do" method="post" enctype="multipart/form-data">
	ID : <input type="text" name="id" readonly="readonly" value="${user.id }"><br>
	TITLE :  <input type="text" name="title"><br>
	CONTENT : <input type="text" name="content"><br>
	VIDEO업로드 : <input type="file" name="videofile"><br><br>
	
	<input type="submit" value="작성완료">
</form>
</body>
</html>