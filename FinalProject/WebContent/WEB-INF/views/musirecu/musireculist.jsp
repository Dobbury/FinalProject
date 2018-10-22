<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<!-- Title Page -->
	<div class="row">
		<div class="span12">
			<div class="title-page">
				<h2 class="title">뮤지션 모집</h2>
				<h3 class="title-description">재능기부할 뮤지션 모집함</h3>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="span3">
			<!-- Filter -->
			<nav id="options" class="work-nav">
				<ul id="filters" class="option-set" data-option-key="filter">
					<li class="type-work">Type of Work</li>
					<li><a href="#filter" data-option-value="*" class="selected">All
							Projects</a></li>
					<li><a href="#filter" data-option-value=".ing">Ing</a></li>
					<li><a href="#filter" data-option-value=".end">End</a></li>
					
				</ul>
			</nav>
			<!-- End Filter -->
		</div>
		
		<div class="span9">
			<div class="row">
				<section id="projects">
					<ul id="thumbs">

						<!-- 여기 for문 돌리면 됨 -->
						<c:forEach items="${musiRecuList}" var="item" varStatus="status">
							<!-- Item Project and Filter Name -->
							<li class="item-thumbs span3 <c:choose>
										<c:when test="${item.edate >= now}">
											ing					
										</c:when>
										<c:otherwise>
											end
										</c:otherwise>
									</c:choose>">
								<a class="hover-wrap fancybox" data-fancybox-group="gallery" href="main.do"> 
									<span class="overlay-img"></span> 
									<span class="overlay-img-thumb font-icon-plus"></span>
								</a> 
								<!-- Thumb Image and Description --> 
									<c:choose>
										<c:when test="${item.edate < now}">
											<img src="_include/img/work/thumbs/end.jpg">					
										</c:when>
										<c:otherwise>
											<img src="_include/img/work/thumbs/ing.jpg">
										</c:otherwise>
									</c:choose>
								<div>
									<p>지역:${item.location }</p>
									<p>장소:${item.place }</p>
									<p>공연일정:${item.perform_date }</p>
									<p>모집기간:${item.sdate } ~ ${item.edate }</p>
								</div>
							</li>
							<!-- End Item Project -->

						</c:forEach>

					</ul>
				</section>
				<input type="button" style="width: 100%" value="더보기" id="more">
			</div>
		</div>
		
	</div>
	<div>
	</div>
</div>

<script type="text/javascript">
$("#more").on("click",function (){
	$("#thumbs").append("<li class='item-thumbs span3 ing isotope-item' style='position: absolute; left: 0px; top: 0px; transform: translate3d(600px, 420px, 0px);'><a class='hover-wrap fancybox' data-fancybox-group='gallery'"+
			"title='The Beach' href='_include/img/work/full/image-07-full.jpg'>"+
				"<span class='overlay-img'></span> <span class='overlay-img-thumb font-icon-plus'></span>"+
		"</a><img src='_include/img/work/thumbs/image-07.jpg'"+
			"alt='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.'>"+
		"</li>");
});
</script>