<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* ### ### ### 05 */
.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 230px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}
.button_base:hover {
    cursor: pointer;
}

.b05_3d_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}

.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 51px;
    padding: 10px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b05_3d_roll div:nth-child(1) {
    color: #ffffff;
    background-color: #ffffff;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll div:nth-child(2) {
    color: #ffffff;
    background-color: #26292E;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll:hover div:nth-child(1) {
    color: #26292E;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b05_3d_roll:hover div:nth-child(2) {
    background-color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}


</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<form action="VideoBBSWriteAf.do" id="contact-form" method="post" class="generalForm" enctype="multipart/form-data">
<table style="margin: auto">
<tr>
<td align="center">
<input type="file" name="videofile" id="videofile" style="display: none">

<div class="button_base b05_3d_roll" id="uploadBtn" style="width: 100%">
	<div>파일 업로드</div>
    <div>파일 업로드</div>
</div>
</td>

<td style="width: 100px"></td>

<td align="center" width="40%">
<h5 class="title-description" style="margin:15 0 0 0">아이디</h5>
<table style="margin: auto; width: 100%">
	<tr>
		<td style="width: 100%">
			<input type="text" name="id" readonly="readonly" value="${user.id }">
		</td>
	</tr>
</table>
<span class="id_check_label"></span>
<br>
<h5 class="title-description" style="margin: 15 0 0 0">제목</h5>
	<input type="text" name="title"><br>
<br>
<h5 class="title-description" style="margin: 15 0 0 0">내용</h5>
<input type="text" name="content"><br>
<br>
</table>
<table style="margin: auto">
<tr>
<td colspan="3" align="center">
<div class="button_base b05_3d_roll" id="writeBtn">
	<div>작성완료</div>
	<div>작성완료</div>
</div>
</td>
</tr>
</table>
</form>

<script type="text/javascript">
$("#uploadBtn").click(function () {
	$("#videofile").click();
});

$("#writeBtn").click(function () {
	alert($("#videofile").val());
	$(".generalForm").attr("target", "_self").submit();
});
</script>