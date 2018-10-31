<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div style="width: 920px; margin: auto">
<div style="display: inline-block; width:auto; border-right: 1px solid gray; margin: auto">
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdate.do" style="margin: 20px">	
	<table>
		<tr align="center">
			<td>
				<video
					style="display: inline-block; width: 390px; height: 230px"
					src=${getVideoBbs.video } controls="controls">이 브라우저는 재생이 불가능합니다.
				</video>
			</td>
		</tr>
		<tr>
			<td><span class="font-icon-book">&nbsp;&nbsp;${getVideoBbs.title }</td>
		</tr>
		<tr>
			<td>
				<span class="font-icon-eye">&nbsp;&nbsp;${getVideoBbs.readcount }				
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${likecheck == true }">
					<a class="font-icon-heart" name="like" id="_like" onClick="fn_like()"/>
				</c:if>
				<c:if test="${likecheck == false }">
					<a class="font-icon-heart-line" name="like" id="_like" onClick="fn_like()"/>
				</c:if>	
			</td>
		</tr>
		
		<tr>
			<td><span class="font-icon-group">&nbsp;&nbsp;<a data-toggle="modal" href="#museDetailModal">${getVideoBbs.id }</a></td>
		</tr>
		<tr>
			<td><span class="font-icon-paste">&nbsp;&nbsp;${getVideoBbs.content }</td>
		</tr>
	</table>
	
	<c:if test="${getVideoBbs.id eq user.id}">
		<a href="#none" id="_btnUpdate" title="글수정하기">수정하기</a>
		<a href="#none" id="_btnDelete" title="삭제하기">삭제하기</a>
	</c:if>
</form>

<form name="commentfrm" id="commentfrm" method="post" style="margin: 20px">
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
                                <a onClick="fn_comment()" class="button button-mini" align="right">등록</a>
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

<div style="display: inline-block; vertical-align: top; margin-left: 50px">
<p align="center"><strong>뮤지션의 다른영상</strong></p>
	<c:set var = "thisvideo" value = "${getVideoBbs.id }"/>
  	<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
	<c:set var = "othervideo" value = "${bbs.id }"/>
  	<c:if test = "${thisvideo eq othervideo }">
	  	<img alt="썸네일" src=${bbs.thumbnail } width="150px" height="80px" ><br>	
	    <span class="font-icon-book">&nbsp;<a href="VideoBbsDetail.do?seq=${bbs.video_seq}">${bbs.title }</a><br>
		<span class="font-icon-eye">&nbsp;${bbs.readcount }<br>
		<span class="font-icon-calendar">&nbsp;${bbs.wdate }<br>
		<p></p>
	</c:if>
	</c:forEach>
</div>
</div>

	  		



<script type="text/javascript">
/* $(function(){
	alert("seq = " + ${getVideoBbs.video_seq});
	getCommentList();
	
}); */
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
            alert("내용을 입력해주세요");
       }
    });
}
    
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

function fn_like(){
	
	var seq = ${getVideoBbs.video_seq};
	var list = {
			"video_seq" : seq,
            };
	
    $.ajax({
        type:'POST',
        url : "like.do",
        data:list,
        async:true,
        success : function(data){
            if(data=="like")
            {
            	$('#_like').prop("class","font-icon-heart");
            }
            else if(data == "unlike")
            {
            	$('#_like').prop("class","font-icon-heart-line");
            }
        },
        error:function(request,status,error){
            alert("좋아요 실패");
       }
    });
}


$("#_btnUpdate").click(function() {	
	alert('글수정하기');		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdate.do?seq="+${getVideoBbs.video_seq} }).submit();
});
$("#_btnDelete").click(function() {	
	alert('삭제하기');	
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsDelete.do?seq="+${getVideoBbs.video_seq} }).submit();
});
</script>




