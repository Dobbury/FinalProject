<%@page import="kh.com.a.model.PerformCastBBSDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%! 
int index = -1;
int perform_seq = -1;
%> 
<fmt:requestEncoding value="utf-8"/>

<h2 style="position: relative; margin-bottom: 100px; text-align: center;">castBbs.jsp..</h2>    


<!--
 
	*섭외 들어온 목록에 대한 게시판*
- 관리자가 목록들에 대한 상세내용들을 확인한다
- 공연에 대한 상세내용들을 확인한 후 승인 버튼을 눌러 INSERT INTO 뮤지션모집 TABLE
- 승인 완료된 목록들은 게시판에서 안보이도록 삭제

-->

<%-- <c:set var="start" value="8"></c:set>
<fmt:parseNumber var="sindex" type="number" value="${start}" />

<c:set var="end" value="14"></c:set>
<fmt:parseNumber var="eindex" type="number" value="${end}" />

 --%>
<div class="container">
<div class="span6">
            	<h3 class="spec">신청 목록</h3>
           <c:if test="${empty castbbslist}">
	    
				신청된 목록이 없습니다 
			
	        </c:if>      
            	<!-- Start Accordion -->
	
	   
	  <div class="accordion" id="accordionArea">
		<c:forEach items="${castbbslist}" var="castbbs" varStatus="vs">
	
			<div id="index${vs.count}" class="accordion-group">
				
				<div class="accordion-heading accordionize">
					<a class="accordion-toggle inactive collapsed" data-toggle="collapse"
						data-parent="#accordionArea" href="#Area${vs.count}">
						${castbbs.compname}<p align="right">${castbbs.wdate}</p><span class="font-icon-arrow-simple-down"></span>
					</a>
				</div>
				<div id="Area${vs.count}" class="accordion-body collapse" style="height: 0px;">
					<div class="accordion-inner">
						<div class="form-group">
							<label for="recipient-name" class="control-label">문의자 성함</label>
							<input type="text" class="form-control"
								value="${castbbs.name}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">회사(단체)명</label>
							<input type="text" class="form-control" 
								value="${castbbs.compname}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">이메일</label> <input
								type="text" class="form-control"
								value="${castbbs.email}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">연락처</label> <input
								type="text" class="form-control" value="${castbbs.phone}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">지역</label> <input
								type="text" class="form-control" value="${castbbs.location}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">공연장소</label> <input
								type="text" class="form-control" value="${castbbs.place}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">공연예산</label> <input
								type="text" class="form-control" value="${castbbs.price}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">공연날짜</label> <input
								type="text" class="form-control" value="${castbbs.perform_date}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">공연횟수</label> <input
								type="text" class="form-control" value="${castbbs.totalcount}" readonly="readonly">
						</div> 
						<div class="form-group">
							<label for="recipient-name" class="control-label">연령대</label> <input
								type="text" class="form-control" value="${castbbs.agegrade}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">문의사항</label>
							<textarea class="form-control" readonly="readonly">${castbbs.content}</textarea>
						</div>
						

						<div align="right">
						 <button style="display: none;" id="castBtn" onclick="approve(${castbbs.perform_seq}, index${vs.count})">승인</button>
						<a data-toggle="modal" href="#castModal" >승인</a>
						</div>
					</div>
				</div>
			</div>
			
		</c:forEach>
		
	</div>
	<!-- End Accordion -->
</div>


<!-- <div id="add">
<button id="addbtn" onclick="moreList();">더보기</button>
</div> -->
<c:if test="${!empty castbbslist}">
<%
List<PerformCastBBSDto> castbbslist = (List)request.getAttribute("castbbslist");

index = castbbslist.size()-1;
perform_seq = castbbslist.get(index).getPerform_seq();
%>
</c:if>

<div id="add2">
<button id="addbtn2" onclick="moreList2();">더보기</button>
</div>

</div>

<script>

var vs = 5;
var perform_seq = <%= perform_seq %>
var startindex = 1;
var endindex = 7;

	function approve(seq_approve, id){
		
		
		var divId = id;
		
		$.ajax({
	        url : "<%=application.getContextPath() %>/approveAf.do",
	        async: true,
	        type : "GET",
	        cache : false,
	        data : {
	        	"seq_approve":+seq_approve,
	        	"title":$("#_title").val(),
	        	"edate":$("#_edate").val(),
	        	"content":$("#_content").val()
	        }, /* +"&perform_seq="+perform_seq, */
	        // datatype: code200 error : 뭣모르고 데이터타입 json으로 했다가 리턴값도 없는데 에러만 주구장창 걸렸음, 기억할것...
	        success : function(){
	        	
	            btn="<button id='addbtn2' onclick='moreList2();'>더보기2</button>";
	            $('#addbtn2').remove();//remove btn
	            $(divId).remove();
	            $(btn).appendTo("#add2");
	           
	        }, error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
	    }); 
	}
	
	function moreList2(){
		startindex += 7;
		endindex += 7;
		
		
	    $.ajax({
	        url : "<%=application.getContextPath() %>/moreList.do",
	        async:true,
	        type : "GET",
	        cache : false,
	        data : "perform_seq="+perform_seq+"&sindex="+startindex+"&eindex="+endindex,
	        dataType: 'json',
	        success : function(data){
	            //console.log(data);	          	            
	            var content="";
	            var btn="";
	            var index = -1;
	            
	            
	            if (data == null || data == "") {
					alert("더 이상 목록이 없습니다.");
					return;
				}
	         
	            if (data != null) {
	            index = data.length-1;
	            perform_seq = data[index].perform_seq; // 더보기 누를 때마다 매번 달라지는 
	            									   //lastIndex값의 시퀀스가 업데이트됨  
				alert("After success, data[lastindex].perform_seq = "+ data[index].perform_seq);  
				var j = data[0].perform_seq; // id를 Area[sequence]로 지정, accordian slidedown href가 sequence에 맞는 데이터에 찾아감.
				var setSnum="";
				var setEnum="";
				
	            for(var i=0; i<data.length; i++){
	                vs += 1; 
	                content +=
	                	"<div id='index"+j+"' class='accordion-group'>"+
	                	"<div class='accordion-heading accordionize'>"+
	                	"<a class='accordion-toggle inactive collapsed' data-toggle='collapse'"+
	                	"data-parent='#accordionArea' href='#Area"+j+"'>"+
	                	data[i].compname + "<p align='right'>"+data[i].wdate+"</p><span class='font-icon-arrow-simple-down'></span></a></div>"+
	                	"<div id='Area"+j+"' class='accordion-body collapse' style='height: 0px;'>"+
	                	"<div class='accordion-inner'>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>문의자 성함</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].name+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>회사(단체)명</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].compname+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>이메일</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].email+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>연락처</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].phone+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>지역</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].location+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>공연장소</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].place+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>공연예산</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].price+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>공연날짜</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].perform_date+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>공연횟수</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].totalcount+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>연령대</label>"+
	                	"<input type='text' class='form-control' id='recipient-name' value="+data[i].agegrade+"></div>"+
	                	"<div class='form-group'>"+
	                	"<label for='recipient-name' class='control-label'>문의사항</label>"+
	                	"<textarea class='form-control' id='recipient-name'>"+data[i].content+"</textarea></div>"+
	                	"<div align='right'>"+
						"<button onclick='approve("+data[i].perform_seq+", index"+j+")'>승인</button>"+
						"</div>"+
	                	"</div></div></div>";
	                	/* 더이상 신청 목록이 없습니다 */
	                	
	                	j++;
	                		                	
	            	}
	            
	            }else if(data.length == 0){
	            	alert("더이상 신청 목록이 없습니다");
	            	return;
	            }
	            btn="<button id='addbtn2' onclick='moreList2();'>더보기2</button>";
	            $('#addbtn2').remove();//remove btn
	            $(content).appendTo("#accordionArea");
	            $(btn).appendTo("#add2");
	        }, error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
	    }); 
	}
	
</script>






