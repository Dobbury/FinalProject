<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div style="width: 1200px; margin: 0 auto;vertical-align: middle; border: 1px solid white" >
<div style="display: inline-block; border-right: 1px solid gold;">
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdate.do" style="margin: 20px">	
	<table border="solid">
		<tr align="center">
			<td>
				<video
					style="display: inline-block; width: 390px; height: 230px"
					src=${getVideoBbs.video } controls="controls">이 브라우저는 재생이 불가능합니다.
				</video>
			</td>
		</tr>
		<tr>
			<td>영상제목 : ${getVideoBbs.title }</td>
		</tr>
		<tr>
			<td>조회수 : ${getVideoBbs.readcount }<button>좋아요</button></td>
		</tr>
		<tr>
			<td>팀명 : ${getVideoBbs.id }<%-- <button id="followB" onclick="Follow(${user.id}, ${getVideoBbs.id})">Follow</button> --%></td>
		</tr>
		<tr>
			<td>영상내용 : ${getVideoBbs.content }</td>
		</tr>
	</table>
	
	<c:if test="${getVideoBbs.id eq user.id}">
		<a href="#none" id="_btnUpdate" title="글수정하기">수정하기</a>
		<a href="#none" id="_btnDelete" title="삭제하기">삭제하기</a>
	</c:if>
</form>

<form name="commentfrm" id="commentfrm" method="post" style="margin: 20px">
	<br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 370px" rows="1" cols="30" id="comment" name="_comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a onClick="fn_comment()" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${getVideoBbs.video_seq }" />
</form>
<form id="commentListForm" name="commentListForm" method="post" style="margin: 20px">
    <div id="commentList" style="display: inline-block">
    </div>
</form>
</div>

<c:if test="${user.id ne getVideoBbs.id}">
<button id="followB" onclick="Follow()">Follow</button>
</c:if>

<div style="display: inline-block; vertical-align: top">
<p align="center"><strong>뮤지션의 다른영상</strong></p>
	<table style="margin: 20px">
	  <tr>
	    <th>썸네일</th>
	    <th>제목</th>
	    <th>조회수</th>
	    <th>작성일</th>
	  </tr>
  	<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
  	
  	<!-- 해당 뮤지션의 영상 조건문 -->
  	<%-- <c:if test = "${getVideoBbs.video_seq } == ${bbs.video_seq }"> --%>
	  	<tr align="center" style="margin: 10px">
			<td>
				<img alt="썸네일" src=${bbs.thumbnail} width="150px" height="80px">
			</td>
	    	<td><a href="VideoBbsDetail.do?seq=${bbs.video_seq}">${bbs.title}</a></td>
			<td>${bbs.readcount }</td>
			<td>${bbs.wdate }</td>
		</tr>
		<tr>
			<td><br></td>
			<td><br></td>
			<td><br></td>
			<td><br></td>
		</tr>
	<%-- </c:if> --%>
	</c:forEach>
</table>
</div>
</div>


<script type="text/javascript">
/* $(function(){
	getCommentList();
	
}); */

/* var seq = ${getVideoBbs.video_seq};
var list = {
		"video_seq" : seq,
        };

$.ajax({
    type:'POST',
    url : "commentList.do",
    data: list,
    contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    success : function(data){
        var html = "";
        var cCnt = data.length;
        
        if(data.length > 0){
            
            for(i=0; i<data.length; i++){
                html += "<div>";
                html += "<div><table class='table'><h6><strong>"+data[i].id+"</strong></h6>";
                html += data[i].vcomment + "<tr><td></td></tr>";
                html += "</table></div>";
                html += "</div>";
            }
            
        } else {
            html += "<div>";
            html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
            html += "</table></div>";
            html += "</div>";
        }
        
        $("#cCnt").html(cCnt);
        $("#commentList").html(html);
    },
    error:function(request,status,error){
    	alert("댓글불러오기 안돼");
   }
    
}); */




/* 

function fn_comment(code){
	
	var seq = ${getVideoBbs.video_seq};
	var _comment = $("#comment").val();
	
	var list = {
			"video_seq" : seq,
            "comment" : _comment
            };
	
    $.ajax({
        type:'POST',
        url : "addComment.do",
        data:list,
        async:true,
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            alert("댓글달기 안돼");
       }
    });
} */
    function Follow() {
		
		var following_id = "${getVideoBbs.id}";
		var follower = "${user.id}";
		
		$.ajax({
			
			url : "ClickFollow.do",
			async : true,
			type : 'POST',
			cache : false,
			data : "follower="+follower+"&following="+following_id,
			dataType : 'json',
			success : function(data) {
				alert(data);
				if (data == 1) {
					alert("팔로잉 하셨습니다");
					$("#followB").attr( "color", "red" );
				}else if (data == 0) {
					alert("팔로잉을 취소하셨습니다");
					$("#followB").attr( "color", "white" );
				}
					
			
			}, error : function (xhr, status, error) {
				alert("ajax 에러 발생");
			}
			
		});
	}
/*     
    function getCommentList(){
    	var seq = ${getVideoBbs.video_seq};
    	var list = {
    			"video_seq" : seq,
                };
    	
        $.ajax({
            type:'POST',
            url : "commentList.do",
            data: list,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            success : function(data){
                var html = "";
                var cCnt = data.length;
                
                if(data.length > 0){
                    
                    for(i=0; i<data.length; i++){
                        html += "<div>";
                        html += "<div><table class='table'><h6><strong>"+data[i].id+"</strong></h6>";
                        html += data[i].vcomment + "<tr><td></td></tr>";
                        html += "</table></div>";
                        html += "</div>";
                    }
                    
                } else {
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
                $("#cCnt").html(cCnt);
                $("#commentList").html(html);
                
            },
            error:function(request,status,error){
            	alert("댓글불러오기 안돼");
           }
            
        });
    }




$("#_btnUpdate").click(function() {	
	alert('글수정하기');		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdate.do?seq="+${getVideoBbs.video_seq}}).submit();
});
$("#_btnDelete").click(function() {	
	alert('삭제하기');	
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsDelete.do?seq="+${getVideoBbs.video_seq}}).submit();
}); */
</script>




