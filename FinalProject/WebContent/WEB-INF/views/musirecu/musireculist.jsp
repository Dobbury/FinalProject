<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 카테고리를 유지 start -->
<%
	String category = (String) request.getAttribute("s_category");
	if (category == null)
		category = "";
%>

<script type="text/javascript">
var str='<%=category%>';
	$(document).ready(function() {
		document.frmForm1.s_category.value = str;

		// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
		if ($("#_s_keyword").val().trim() == "") {
			document.frmForm1.s_category.value = "";
		}
	});
</script>
<!-- 검색 카테고리를 유지 end -->


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
						<c:forEach items="${musiRecuList}" end="9" var="item"
							varStatus="status">
							<!-- Item Project and Filter Name -->
							<li class="item-thumbs span3 <c:choose>
										<c:when test="${item.edate >= now}">
											ing					
										</c:when>
										<c:otherwise>
											end
										</c:otherwise>
									</c:choose>">
								<a class="hover-wrap fancybox" data-fancybox-group="gallery" 
								href="musirecudetail.do?musi_recu_seq=${item.musi_recu_seq }"> 
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
									<span>제목:${item.title }</span><br>
									<span>모집기간:${item.sdate } ~ ${item.edate }</span><br>
								</div>
							</li>
							<!-- End Item Project -->

						</c:forEach>

					</ul>
				</section>
				<!-- 페이징 처리 -->
				<div id="paging_wrap" align="center">
					<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
						<jsp:param value="${pageNumber }" name="pageNumber" />
						<jsp:param value="${pageCountPerScreen }"
							name="pageCountPerScreen" />
						<jsp:param value="${recordCountPerPage }"
							name="recordCountPerPage" />
						<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
					</jsp:include>
				</div>
				<!--  -->

				<div class="box_border"
					style="margin-top: 5px; margin-bottom: 10px;" align="right">

					<form name="frmForm1" id="_frmFormSearch" method="post" action="">

						<table
							style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px; border: 0; padding: 0;">
							<tr>
								<td style="padding-left: 5px;"><select id="_s_category"
									name="s_category">
										<option value="" selected="selected">선택</option>
										<option value="title">제목</option>
										<option value="contents">내용</option>
										<option value="writer">작성자</option>
								</select></td>
								<td style="padding-left: 5px;"><input type="text"
									id="_s_keyword" name="s_keyword" value="${s_keyword}" /></td>
								<td style="padding-left: 5px;"><span class="button blue"><button
											type="button" id="_btnSearch">검색</button></span></td>
							</tr>
						</table>

						<input type="hidden" name="pageNumber" id="_pageNumber"
							value="${(empty pageNumber)?0:pageNumber}" /> <input
							type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
							value="${(empty recordCountPerPage)?10:recordCountPerPage}" />

					</form>
				</div>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">
	function goPage(pageNumber) {
		$("#_pageNumber").val(pageNumber);
		$("#_frmFormSearch").attr("target", "_self").attr("action",
				"musireculist.do").submit();
	}
</script>