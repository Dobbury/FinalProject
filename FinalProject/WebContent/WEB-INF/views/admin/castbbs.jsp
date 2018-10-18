<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
 
<fmt:requestEncoding value="utf-8"/>

<h2 style="position: relative; margin-bottom: 100px; text-align: center;">castBbs.jsp</h2>    


<div align="center" class="box_border" style="margin-top:5px; margin-bottom: 10px;">

</div>

 
<table class="list_table" style="width:85%;">
	<colgroup>
		<col style="width:70px;" />
		<col style="width:auto;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>순서</th> <th>제목</th> <th>작성자</th> 
	</tr>
</thead>

<tbody>	
	<c:if test="${empty bbslist}">
	<tr>
		<td colspan="3">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
	
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		
		
		<td style="text-align: left"><%-- <jsp:getProperty property="arrow" 
			name="ubbs"/> --%>
			<%-- <c:if test="${bbs.del == 0 }"> --%>
				<a href='castbbsdetail.do?seq=${bbs.perform_seq}'>
				${bbs.content}
				</a>
			<%-- </c:if> --%>
			<%-- <c:if test="${bbs.del == 1 }">
				이 글은 작성자에 의해서 삭제 되었습니다
			</c:if> --%>
		</td>
		
		<td>${bbs.name}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>

<!-- 페이징 처리 -->
<%-- <div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
</div> --%>

<!--  -->

<div id="buttons_wrap">
	<span class="button blue">
	<button type="button" id="_btnAdd">글쓰기</button></span>
</div>
