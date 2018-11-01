<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<fmt:requestEncoding value="utf-8"/>

<!-- Our Work Section -->


<!-- 
model.addAttribute("videoRankList", videoRank);
model.addAttribute("followingList", followingList);
model.addAttribute("performScheduleList", scheduleList);
model.addAttribute("latelyVideoList", latelyVideoList); 
-->

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
	

	<!-- End Title Page -->
 
	
	
		
		
		<hr><hr>
		
		<%
		MemDto loginDto = (MemDto)session.getAttribute("user");
		
		if(loginDto != null){
					
		%>
	
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
	
	<%-- 
	<c:forEach items="${ComingList}" var="cSchedule" varStatus="vs">${vs.count}-${cSchedule.sdate}</c:forEach>
	<c:forEach items="${IngList}" var="iSchedule" varStatus="vs">${vs.count}-${iSchedule.sdate}</c:forEach> --%>
		
<%-- 	
	<c:forEach items="${videoRankList}" var="rank" varStatus="vs"></c:forEach>
	<c:forEach items="${followingList}" var="followings" varStatus="vs">${vs.count}-${followings.id}</c:forEach> 
	<c:forEach items="${performScheduleList}" var="latelySchedule" varStatus="vs"></c:forEach>
	<c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs"> 
--%>		

		
		<h1>${user.id}</h1>
		<h1>Log On</h1>
	   
	    
	    
	    
	    
	    
		<div class="span9">
			<div class="row">
				<section id="projects">
					<ul id="thumbs">
						<div>
						<!-- Item Project and Filter Name -->
						<%-- <c:forEach items="${videoRankList}" var="Vrank" varStatus="vs" begin = "1" end = "9"> --%>
						<div class="item-thumbs span3 like">
						<c:if test="${empty videoRankList}"><h3>인기 영상이 없습니다</h3></c:if>
						</div>
						<c:if test="${!empty videoRankList}">
						<c:forEach items="${videoRankList}" var="Vrank" varStatus="vs">
						<li class="item-thumbs span3 like">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="${Vrank.title}" href="VideoBbsDetail.do?seq=${Vrank.video_seq}">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="${Vrank.thumbnail}"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						</c:forEach>
						</c:if>
						
						
						<!-- Item Project and Filter Name -->
						<div class="item-thumbs span3 following">
						<c:if test="${empty followingList}"><h3>팔로잉 대상이 없습니다</h3></c:if>
						</div>
						<c:if test="${!empty followingList}">
						<c:forEach items="${followingList}" var="followings" varStatus="vs">
						<li class="item-thumbs span3 following">
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
						</c:if>
						<!-- End Item Project -->

				
						
						<!-- Item Project and Filter Name -->
						<div class="item-thumbs span3 lately">
						<c:if test="${empty latelyVideoList}"><h3>최신 영상이 없습니다</h3></c:if>
						</div>
						<c:if test="${!empty latelyVideoList}">
					    <c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs">
					    <p>${latelyVideo.title }</p>
					    <img alt="" src="${latelyVideo.thumbnail}">  
						<li class="item-thumbs span3 lately">
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
						</c:if> 
						<!-- End Item Project -->
						
						
						<!-- Item Project and Filter Name -->
						<div class="item-thumbs span3 schedule">
						<c:if test="${empty performScheduleList}"><h3>최신 공연행사가 없습니다</h3></c:if>
						</div>
						<c:if test="${!empty performScheduleList}">
						<c:forEach items="${performScheduleList}" var="lateSchedule" varStatus="vs">
						
						<li class="item-thumbs span3 schedule">
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
						</c:if>
						</div>
						<!-- End Item Project -->
						
						
					</ul>
				</section>

			</div>
		</div>
		<%-- </c:if> --%>
		<%-- <c:if test="${login.id eq '' || login.id eq null}"> --%>
		<% }else{ %>
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
				<section id="projects">
					<ul id="thumbs">
					
						<!-- Item Project and Filter Name -->
						
						<li class="item-thumbs span3 lately">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The City" href="_include/img/work/full/image-01-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-01.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 lately">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Office"
							href="_include/img/work/full/image-02-full.jpg"> <span
								class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-02.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 lately">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Mountains"
							href="_include/img/work/full/image-03-full.jpg"> <span
								class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-03.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 rank">
							<!-- Fancybox Media - Gallery Enabled - Title - Link to Video -->
							<a class="hover-wrap fancybox-media" data-fancybox-group="video"
							title="Video Content From Vimeo" href="http://vimeo.com/51460511">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-08.jpg" alt="Video">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 rank">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Sea" href="_include/img/work/full/image-04-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-04.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<c:forEach begin="1" end="9">
						<li class="item-thumbs span3 schedule">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="Clouds" href="_include/img/work/full/image-05-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-05.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						</c:forEach>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<c:forEach begin="1" end="9">
						<li class="item-thumbs span3 schedule">
							<!-- Fancybox Media - Gallery Enabled - Title - Link to Video -->
							<a class="hover-wrap fancybox-media" data-fancybox-group="video"
							title="Video Content From Vimeo" href="http://vimeo.com/50834315">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-09.jpg" alt="Video">
						</li>
						</c:forEach>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<c:forEach begin="1" end="9">
						<li class="item-thumbs span3 like">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Dark" href="_include/img/work/full/image-06-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-06.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						</c:forEach>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<c:forEach begin="1" end="9">
						<li class="item-thumbs span3 like">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Beach" href="_include/img/work/full/image-07-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-07.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						</c:forEach>
						<!-- End Item Project -->
					</ul>
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