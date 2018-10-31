<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemDto dto = (MemDto)session.getAttribute("user");
%>

<!-- 아이디 저장 -->
<%
	Cookie[] cookie = request.getCookies();
	String id = "";
	if(cookie != null){
		for(int i = 0 ; i < cookie.length ; i++){
			if(cookie[i].getName().trim().equals("id")){
				System.out.println(cookie[i].getValue());
				id = cookie[i].getValue();
			}
		}
	}

%>

<style>
.modal-body {
	vertical-align: middle;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- Header -->
<div class="sticky-nav">

	<div id="logo">
		<a id="goUp" href="#home-slider"
			title="Brushed | Responsive One Page Template">Brushed Template</a>
	</div>

	<nav id="menu">
		<ul id="menu-nav">
			<%if(dto!=null){ %>
			<li><a href="myPage.do" class="external">My page</a></li>
			<%} %>
			<li class="current"><a href="#home-slider">Home</a></li>
			<li><a href="main.do" class="external">Main</a></li>
			<li class="afterloginOK"><%if(dto !=null){ %>
										<a href="musireculist.do"  class="external">뮤지션 모집</a>
									<%}else{ %>
										<a data-toggle="modal" href="#myModal" >뮤지션 모집</a>
									<%} %>
										</li><!-- 로그인이 필요한 경우  -->
			<!--  
                <li><a href="#contact">Contact</a></li>
				<li><a href="shortcodes.html" class="external">Shortcodes</a></li> -->
			<li><a class="external" href="aboutus.do">About our site</a></li>
         	<li><a class="external" href="videoBbs.do">뮤지션's 버스킹</a></li>
            <li><a class="external" href="schedule.do">공연일정</a></li>
            <li><a class="external" href="contact.do">공연섭외문의</a></li>
			<li><a href="VideoBBS.do" class="external">영상게시판</a></li>
			<%if(dto==null){ %>
				<li><a data-toggle="modal" href="#myModal">Login</a></li>
			<%}else{ %>
				<li><a href="logoff.do" class="external">LogOff</a></li>
			<%} %>
		</ul>
	</nav>

</div>
<!-- End Header -->

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog"
	style="background-color: #26292E; width: 20%; height: 40%;">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" ><font color="white">x</font></button>
				<h4 class="modal-title"
					style="font-family: Icons; font-size: 40; font-weight: bold; margin: 0">로그인</h4>
			</div>
			<div class="modal-body" align="center" style="background-color: #2F3238; height: 60%">
				<br> 
				<input type="text" style="height: 20%" placeholder="아이디 입력" name="id" id="id">
				<br><br> 
				<input type="password" style="height: 20%" placeholder="비밀번호 입력" name="pwd" id="pwd">
				<br>
				<div align="right" style="padding-right: 13%">
					ID 저장&nbsp;<input type="checkbox" style="margin-bottom: 1px;" name="id_rem" id="id_rem"
							<% if(id.length() > 1) out.println("checked"); %>/>
				</div>
			</div>
			<div class="modal-footer" style="background-color: #26292E;">
				<a href="regi.do" class="external">Sign up</a>
				<button type="button" class="btn btn-default" id="login">로그인</button>
			</div>
		</div>

	</div>
</div>

<div class="modal fade" id="museDetailModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content" style="text-align: center">
        아이디 : ${meminfo.id }
        <br><br>
        소속그룹 / 멤버 : ${meminfo.teamname }
        <br><br>
        이메일 : ${meminfo.email }
        <br><br>
        연락처 : ${meminfo.phone }
        <br><br>
        장르 : ${meminfo.genre }
        <br><br>
        지역 : ${meminfo.location }
        <br><br>
        팔로워 수 : 
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
               닫기
            </button>
         </div>
      </div> 
   </div> 
</div>

<script type="text/javascript">
$("#login").on('click',function(){
	$.ajax({
		url:"login.do",
		data:{
			id: $("#id").val(),
			pwd:$("#pwd").val(),
			id_rem:$("#id_rem").val()
		},
		dataType:"json",
		success:function(data){
			if(data.result != "success"){
				alert(data.result);
				
			}else{
				alert($("#id").val()+"님 반갑습니다.");
				location.href="main.do";
			}
		},
		error:function(){
			
		}
	});

});

$("ul li").click(function () {
	<%
	if(session.getAttribute("user") == null){
	%>
		if( $(this).hasClass("afterloginOK") ==true ){
			alert("로그인 후 가능합니다.");	
			location.href="#home-slider";
		}
	<%
	}
	%>
});
</script>
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<fmt:requestEncoding value="utf-8"/>
 
<span class="accordion-heading togglize">
                            <a class="accordion-toggle inactive collapsed" data-toggle="collapse" data-parent="#" href="#castbbs">
                                	관리
                                <span class="font-icon-plus"></span>
                                <span class="font-icon-minus"></span>
                            </a>
                        </span> 

<!-- Header -->
    <div class="sticky-nav">
    	<a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
    	
    		
        <!-- <ul>
        <li style="line-height: 20px; margin: 15px; list-style: none; cursor: pointer;"> -->
       	<a href="castbbs.do" class="font-icon-cog" style="font-size: 32px;"></a>
        <!-- </li>
        </ul> -->
        <!-- <a id="pcmenu" href="#" class="font-icon-align-justify" style="font-size: 30px;"></a> -->	     
 	        
        <!-- <div id="logo">
        	<a id="goUp" href="#home-slider" title="Brushed | Responsive One Page Template">Brushed Template</a>
        </div>
         -->
        
    </div>
    
    <div id="castbbs"><font color="#ffffff"><a href="castbbs.do">섭외신청목록</a></font></div>
<!-- End Header -->
