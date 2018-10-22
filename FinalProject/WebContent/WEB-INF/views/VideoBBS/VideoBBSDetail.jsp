<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<video>
	<source src="${getVideoBbs.video }">
</video>

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
	<td><img src="${getVideoBbs.thumbnail }" width="200px" height="150px"></td>
	<td>${getVideoBbs.id }</td>
	<td>${getVideoBbs.title }</td>
	<td>${getVideoBbs.readcount }</td>
	<td>${getVideoBbs.content }</td>
	<td><video src="${getVideoBbs.video }"/></td>
</tr>
</table>


