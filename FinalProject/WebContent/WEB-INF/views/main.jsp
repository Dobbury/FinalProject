<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<fmt:requestEncoding value="utf-8"/>

<!-- Our Work Section -->

<div class="container">
	<!-- Title Page -->
	<div class="row">
		<div class="span12">
			<div class="title-page">
				<h2 class="title">Our Work</h2>
				<h3 class="title-description">
					Check Out Our Projects on <a href="#">Dribbble</a>.
				</h3>
			</div>
		</div>
	</div>
	
	
	<!-- ComingList
	IngList
	videoList -->
	
	
	<c:forEach items="${ComingList}" var="cSchedule" varStatus="vs">${vs.count}-${cSchedule.sdate}</c:forEach>
	<c:forEach items="${IngList}" var="iSchedule" varStatus="vs">${vs.count}-${iSchedule.sdate}</c:forEach>
	<c:forEach items="${videoList}" var="video" varStatus="vs">${vs.count}-${video.title}</c:forEach> 
	
	
	<!-- End Title Page -->
	
	<c:if test="${empty videoList}">
	
		<h1>영상이 없음</h1>
		
	</c:if>
	
	<%-- <c:forEach items="${videoList}" var="video" varStatus="vs">
		<h1>${video.title}</h1>
	</c:forEach> --%>
	
	<!-- Portfolio Projects -->
	<div class="row">
		<div class="span3">
			<!-- Filter -->
			<nav id="options" class="work-nav">
				<ul id="filters" class="option-set" data-option-key="filter">
					<li class="type-work">Type of Work</li>
					<li><a href="#filter" data-option-value="*" class="selected">All
							Projects</a></li>
					<li><a href="#filter" data-option-value=".design">Design</a></li>
					<li><a href="#filter" data-option-value=".photography">Photography</a></li>
					<li><a href="#filter" data-option-value=".video">Video</a></li>
				</ul>
			</nav>
			<!-- End Filter -->
		</div>
		
		<!-- <div id="header" class="style-scope ytd-item-section-renderer"></div>
		<div><p class="navbar-text item-thumbs design">추천 장르 영상</p></div>
		<div><p class="navbar-text item-thumbs photography">활동 지역 영상</p></div>
		<div><p class="navbar-text item-thumbs video">랭킹별</p></div> -->
		
		<!-- <h5 id="pagination" class="page-header">
		<a class="anchorjs-link" href="#pagination"><span class="anchorjs-icon"></span></a></h5> -->
		
		<hr><hr>
		
		<% request.getAttribute("login"); %>
		<c:if test="${login ne ''}">
		
		<h1>${login.id}</h1>
		<h1>login ne</h1>
	
		<div class="span9">
			<div class="row">
				<section id="projects">
					<ul id="thumbs">
						<div><hr>
						<!-- Item Project and Filter Name -->
						
						<li class="item-thumbs span3 design">
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
						<li class="item-thumbs span3 design">
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
						<li class="item-thumbs span3 photography">
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
						</div>
						<!-- End Item Project -->
						<div><hr>
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 video">
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
						<li class="item-thumbs span3 photography">
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
						<li class="item-thumbs span3 photography">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="Clouds" href="_include/img/work/full/image-05-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-05.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->
						</div>
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 video">
							<!-- Fancybox Media - Gallery Enabled - Title - Link to Video -->
							<a class="hover-wrap fancybox-media" data-fancybox-group="video"
							title="Video Content From Vimeo" href="http://vimeo.com/50834315">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-09.jpg" alt="Video">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 design">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Dark" href="_include/img/work/full/image-06-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-06.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 design">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Beach" href="_include/img/work/full/image-07-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-07.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->
					</ul>
				</section>

			</div>
		</div>
		</c:if>
		<c:if test="${login.id eq ''}">
		<h1>login 없음</h1>
		<div class="span9">
			<div class="row">
				<section id="projects">
					<ul id="thumbs">

						<!-- Item Project and Filter Name -->
						
						<li class="item-thumbs span3 design">
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
						<li class="item-thumbs span3 design">
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
						<li class="item-thumbs span3 photography">
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
						<li class="item-thumbs span3 video">
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
						<li class="item-thumbs span3 photography">
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
						<li class="item-thumbs span3 photography">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="Clouds" href="_include/img/work/full/image-05-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-05.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 video">
							<!-- Fancybox Media - Gallery Enabled - Title - Link to Video -->
							<a class="hover-wrap fancybox-media" data-fancybox-group="video"
							title="Video Content From Vimeo" href="http://vimeo.com/50834315">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-09.jpg" alt="Video">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 design">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Dark" href="_include/img/work/full/image-06-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-06.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->

						<!-- Item Project and Filter Name -->
						<li class="item-thumbs span3 design">
							<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
							class="hover-wrap fancybox" data-fancybox-group="gallery"
							title="The Beach" href="_include/img/work/full/image-07-full.jpg">
								<span class="overlay-img"></span> <span
								class="overlay-img-thumb font-icon-plus"></span>
						</a> <!-- Thumb Image and Description --> <img
							src="_include/img/work/thumbs/image-07.jpg"
							alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
						</li>
						<!-- End Item Project -->
					</ul>
				</section>

			</div>
		</div>
		</c:if>
	</div>
	<!-- End Portfolio Projects -->
</div>

<!-- End Our Work Section -->