<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<fmt:requestEncoding value="utf-8"/>

<!-- Our Work Section -->


<!-- 
model.addAttribute("videoRankList", videoRank);
model.addAttribute("followingList", followingList);
model.addAttribute("performScheduleList", scheduleList);
model.addAttribute("latelyVideoList", latelyVideoList); 
-->


	

	<!-- End Title Page -->
 				
		
		
		<%
		MemDto loginDto = (MemDto)session.getAttribute("user");
		
		if(loginDto != null){
					
		%>
	<div class="container">
	<!-- Title Page -->
	<div class="row">
		<div class="span12">
			<div class="title-page">
				<h2 class="title">MusiCulture</h2>
				<h3 class="title-description">
					<!-- Check Out Our Projects on <a href="#">Dribbble</a>. -->
				</h3>
			</div>
		</div>
	</div>	
	<!-- Portfolio Projects -->
	<div class="row">
		<div class="span3">
			<!-- Filter -->
			<nav id="options" class="work-nav">
				<ul id="filters" class="option-set" data-option-key="filter">
					<li class="type-work">MusiCulture</li>
					
					<li><a href="#filter" data-option-value=".lately">개인영상(최신순)</a></li>
					<li><a href="#filter" data-option-value=".like">개인영상(인기순)</a></li>
					<li><a href="#filter" data-option-value=".following">팔로잉 영상</a></li>
					<li><a href="#filter" data-option-value=".schedule">기부공연 행사일정</a></li>
				</ul>
			</nav>
			<!-- End Filter -->
		</div>
	
	<%-- 
	<c:forEach items="${ComingList}" var="cSchedule" varStatus="vs">${vs.count}-${cSchedule.sdate}</c:forEach>
	<c:forEach items="${IngList}" var="iSchedule" varStatus="vs">${vs.count}-${iSchedule.sdate}</c:forEach> --%>
		
<%-- 	
	<c:forEach items="${videoRankList}" var="rank" varStatus="vs"></c:forEach>
	<c:forEach items="${followingList}" var="followings" varStatus="vs">${vs.count}-${followings.id}</c:forEach> 
	<c:forEach items="${performScheduleList}" var="latelySchedule" varStatus="vs"></c:forEach>
	<c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs"> 
--%>		

	       
		<div class="span9">
			<div class="row">	
				<section id="projects">
				
				
				
					<ul id="thumbs">						
						<!-- Item Project and Filter Name -->
						<%-- <c:forEach items="${videoRankList}" var="Vrank" varStatus="vs" begin = "1" end = "9"> --%>
						<c:if test="${empty videoRankList}">
						<li style="margin: 30px;" class="item-thumbs span3 like">
						<div>인기순</div>
						<h3>인기 영상이 없습니다</h3>
						</li>
						</c:if>
						
						<c:if test="${!empty videoRankList}">
						<c:forEach items="${videoRankList}" var="Vrank" varStatus="vs" end="3">
						
						<li class="item-thumbs span3 like">
						
						<c:if test="${vs.count eq 1 }">
						<font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">인기순</font>
						</c:if>
						<hr style="border: none; border: 5px double #0066cc;">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="${Vrank.title}" href="VideoBbsDetail.do?seq=${Vrank.video_seq}">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="${Vrank.thumbnail}"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
							<div>
									<span>제목: ${Vrank.title }</span><br>
									<span>뮤지션: ${Vrank.id }</span><br>
								</div>
						</li>
						</c:forEach>
						<c:if test="${fn:length(videoRankList) eq 2}">
						<li class="item-thumbs span3">                  	
                        </li>
                        </c:if>
						<c:if test="${fn:length(videoRankList) eq 1}">
						<li class="item-thumbs span3">                  	
                        </li>
                        <li class="item-thumbs span3">
                        </li>
						</c:if>
						</c:if>
						
						
					<!-- </ul>
					</section> -->
					
					<!-- End Item Project -->
					
					<!-- <section id="projects2">
					<ul id="thumbs"> -->
					
					
						<!-- Item Project and Filter Name -->
						<c:if test="${empty followingList}">
						<li class="item-thumbs span3 following">
						<div>팔로잉</div>
						<h3>팔로잉 대상이 없습니다</h3>
						</li>
						</c:if>
						
						<c:if test="${!empty followingList}">
						<c:forEach items="${followingList}" var="followings" varStatus="vs" end="3">
						
						<li class="item-thumbs span3 following">
						<c:if test="${vs.count eq 1 }">
						<font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">팔로잉</font>
						</c:if>
						<hr style="border: none; border: 5px double #0066cc;">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="${followings.title}" href="VideoBbsDetail.do?seq=${followings.video_seq}">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="${followings.thumbnail }"
							alt="">
						</li>
						</c:forEach>
						<c:if test="${fn:length(followingList) eq 2}">
						<li class="item-thumbs span3">                  	
                        </li>
                        </c:if>
						<c:if test="${fn:length(followingList) eq 1}">
						<li class="item-thumbs span3">                  	
                        </li>
                        <li class="item-thumbs span3">
                        </li>
						</c:if>
						</c:if>
					
						<!-- End Item Project -->
				
				<!-- <section id="projects3">
					<ul id="thumbs"> -->
				
				
						<!-- Item Project and Filter Name -->
						<c:if test="${empty latelyVideoList}">
						<li class="item-thumbs span3 lately">
						<div>최신순</div>
						<h3>최신 영상이 없습니다</h3>
						</li>
						</c:if>
						
						<c:if test="${!empty latelyVideoList}">
					    <c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs" end="2">
					    
					 
						<li class="item-thumbs span3 lately">
						<c:if test="${vs.count eq 1 }">
						<font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">최신순</font>
						</c:if>
						
						<hr style="border: none; border: 5px double #0066cc;">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="${lateVideo.title}"
							href="VideoBbsDetail.do?seq=${lateVideo.video_seq}"> <span
								class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="${lateVideo.thumbnail}"
							alt="">
							
						</li>
						</c:forEach>
						<c:if test="${fn:length(latelyVideoList) eq 2}">
						<li class="item-thumbs span3">                  	
                        </li>
                        </c:if>
						<c:if test="${fn:length(latelyVideoList) eq 1}">
						<li class="item-thumbs span3">                  	
                        </li>
                        <li class="item-thumbs span3">
                        </li>
						</c:if>
						</c:if>
						
						<!-- </ul>
						</section> -->
						<!-- End Item Project -->
					
					<!-- <section id="projects4">
					<ul id="thumbs"> -->
					
						<!-- Item Project and Filter Name -->
						<c:if test="${empty performScheduleList}">
						<li class="item-thumbs span3 schedule">
						
						<h3>최신 공연행사가 없습니다</h3>
						</li>
						</c:if>
						
						<c:if test="${!empty performScheduleList}">
						<c:forEach items="${performScheduleList}" var="lateSchedule" varStatus="vs" end="3">
						
						<li class="item-thumbs span3 schedule">
						<c:if test="${vs.count eq 1 }">
						<font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">공연/행사</font>
						<hr style="border: none; border: 5px double #0066cc;">
						</c:if>
						<c:otherwise>
							
							<hr style="border: none; border: 5px double #0066cc;">
						</c:otherwise>
						
						
						
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="${lateSchedule.title}"
							href="perform_scheduledetail.do?seq=${lateSchedule.perform_schedule_seq}"> <span
								class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="${lateSchedule.new_consertIMG}"
							alt="">
						</li>
						</c:forEach>
						<c:if test="${fn:length(performScheduleList) eq 2}">
						<li class="item-thumbs span3">                  	
                        </li>
                        </c:if>
						<c:if test="${fn:length(performScheduleList) eq 1}">
						<li class="item-thumbs span3">                  	
                        </li>
                        <li class="item-thumbs span3">
                        </li>
						</c:if>
						</c:if>
						
						<!-- End Item Project -->
						</ul>
						</section>				
					</div>
						
						

			</div>
		</div>
	</div>
	
		<%-- </c:if> --%>
		<%-- <c:if test="${login.id eq '' || login.id eq null}"> --%>
		<% }else{ %>
		
<div class="container">
	<!-- Title Page -->
	<div class="row">
		<div class="span12">
			<div class="title-page">
				<h2 class="title">MusiCulture</h2>
				<h3 class="title-description">
					<!-- Check Out Our Projects on <a href="#">Dribbble</a>. -->
				</h3>
			</div>
		</div>
	</div>	
		<h1>Log Off</h1>
		
		<!-- Portfolio Projects -->
	<div class="row">
		<div class="span3">
			<!-- Filter -->
			<nav id="options" class="work-nav">
				<ul id="filters" class="option-set" data-option-key="filter">
					<li class="type-work">MusiCulture</li>
					<li><a href="#filter" data-option-value=".lately">개인영상(최신순)</a></li>
					<li><a href="#filter" data-option-value=".like">개인영상(인기순)</a></li><!-- data-option-value=".design" -->
					<li><a href="#filter" data-option-value=".following">팔로잉 영상</a></li><!-- data-option-value=".photography" -->
					<li><a href="#filter" data-option-value=".schedule">기부공연 행사일정</a></li><!-- data-option-value=".video" -->
				</ul>
			</nav>
			<!-- End Filter -->
		</div>
		
		<div class="span9">
			<div class="row">
			
			<h3>인기순</h3>
			
				<section id="projects">
				<div class="wrappers">
				   <h3>인기순</h3>
				</div>    		
						<ul>
						<!-- Item Project and Filter Name -->
                        	<li class="item-thumbs span3">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Beach" href="_include/img/work/full/image-07-full.jpg">
                                	<span class="overlay-img"></span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img src="_include/img/work/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                            </ul>
                        	<!-- End Item Project -->
                    
                     <div class="wrappers">
                      		<ul>
							<!-- Item Project and Filter Name -->
                        	<li class="item-thumbs span3">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Beach" href="_include/img/work/full/image-07-full.jpg">
                                	<span class="overlay-img"></span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img src="_include/img/work/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                            </ul>
                        	<!-- End Item Project -->
                  </div>
                  <h3>인기순</h3>
                  <div class="wrappers">
                  <ul>
                          <!-- Item Project and Filter Name -->
                        	<li class="item-thumbs span3">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Beach" href="_include/img/work/full/image-07-full.jpg">
                                	<span class="overlay-img"></span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img src="_include/img/work/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                      
                  </ul>
                  </div>
                  <h3>인기순</h3>  
                         <div class="wrappers">
                         <ul>
							<!-- Item Project and Filter Name -->
                        	<li class="item-thumbs span3">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Beach" href="_include/img/work/full/image-07-full.jpg">
                                	<span class="overlay-img"></span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img src="_include/img/work/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                            </ul>
                            </div>
                        	<!-- End Item Project -->
                            
							

						
						
					
				</section>
				
			</div>
		</div>
		<% } %>
		<%-- </c:if> --%>
	</div>
	<!-- End Portfolio Projects -->

</div>


<script>


</script>
<!-- End Our Work Section -->