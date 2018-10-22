<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
 
<fmt:requestEncoding value="utf-8"/>

<h2 style="position: relative; margin-bottom: 100px; text-align: center;">castBbs.jsp</h2>    


<div align="center" class="box_border" style="margin-top:5px; margin-bottom: 10px;">

</div>

 
<table id="list_table" class="list_table" style="width:85%;">
	<colgroup>
		<col style="width:70px;" />
		<col style="width:auto;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>순서</th> <th>회사(단체)명</th> <th>장소</th> <th>신청날짜</th>
	</tr>
</thead>

<tbody>	
	<c:if test="${empty castbbslist}">
	<tr>
		<td colspan="3">신청 목록이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${castbbslist}" var="castbbs" varStatus="vs">
	
	<tr class="_hover_tr">
		<td>${vs.count}</td>
		
		<!-- 문의자성함/연락처/이메일/지역/연령대/공연횟수/예산/기타 문의사항 -->
		
		<td style="text-align: left"><%-- <jsp:getProperty property="arrow" 
			name="ubbs"/> --%>
			<%-- <c:if test="${bbs.del == 0 }"> --%>
				<a href='castbbsdetail.do?seq=${castbbs.perform_seq}'>
				${castbbs.compname}
				</a>
			<%-- </c:if> --%>
			<%-- <c:if test="${bbs.del == 1 }">
				이 글은 작성자에 의해서 삭제 되었습니다
			</c:if> --%>
		</td>
		
		<td>${castbbs.place}</td>
		<td>${castbbs.wdate}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>
<div id="add">
<button id="addbtn" onclick="moreList();">더보기</button>
</div>
<script>
	function moreList(){
		alert("alram");
		
	    $.ajax({
	        url : "<%=application.getContextPath() %>/moreList.do",
	        async:true,
	        type : "GET",
	        cache : false,
	        dataType: 'json',
	        /* data : "compname="+compname */
	        success : function(data){
	            //console.log(data);
	            alert("success");
	            var content="";
	            var btn="";
	            
	           
	            if (data != null) {
	            	
				alert("dataList 도착");
				
	            for(var i=0; i<data.length; i++){
	                content +=
	                "<tr class='_hover_tr'>"+
	                	"<td>"+"count"+"</td>"+
	                    "<td>"+data[i].compname+"</td>"+
	                    "<td>"+data[i].place+"</td>"+
	                    "<td>"+data[i].wdate+"</td>"+
	                "</tr>";
	            }
	            
	            }
	            btn="<button id='addbtn' onclick='moreList();'>더보기</button>";
	            $('#addbtn').remove();//remove btn
	            $(content).appendTo("#list_table");
	            $(btn).appendTo("#add");
	        }, error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
	    }); 
	};
</script>
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



