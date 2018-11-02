<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
#id,#pwd,#name,#phone,#email,#birth{
	height: 30px
}

.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- Our Work Section -->
<div class="container" align="center">
	<!-- Title Page -->
			<h2 class="title">Sign up</h2>
	<!-- End Title Page -->
</div>
<div align="center" class="content">

<input type="button" id="general" style="width: 250px; height: 250px" value="일반 회원">
&nbsp;&nbsp;&nbsp;
<input type="button" id="musition" style="width: 250px; height: 250px" value="뮤지션">

</div>

<div class="general" align="center" style="display: none;">
<form action="generalregi.do" method="post" id="contact-form">
<h5 class="title-description" style="margin: 0px">아이디</h5>
<input type="text" id="gid" name="id" placeholder="아이디을 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">비밀번호</h5>
<input type="password" id="gpwd" name="pwd" placeholder="비밀번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">이름</h5>
<input type="text" name="name" placeholder="이름을 입력하세요">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">생년월일</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">성별</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<input type="date" id="gbirth" name="birth" style="width: 150px">
		</td>
		<td align="center">
			<div class="btn-group" data-toggle="buttons">
			
				<label class="btn btn-success active">
					<input type="radio" name="gender" autocomplete="off" value="남" checked>
					<span class="glyphicon glyphicon-ok"></span>
				</label>
	
				<label class="btn btn-primary">
					<input type="radio" name="gender" autocomplete="off" value="여">
					<span class="glyphicon glyphicon-ok"></span>
				</label>
			</div>
		</td>
	</tr>
</table>

<br>
<h5 class="title-description" style="margin: 0px">연락처</h5>
<input type="text" name="phone" maxlength="13" oninput="autoHypenPhone(this)" placeholder="핸드폰 번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">이메일</h5>
<input type="text" name="email" placeholder="이메일을 입력하세요">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">좋아하는 장르</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">거주지</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<select style="width: 150px" name="genre">
				<c:forEach items="${genreList}" var="genreitem" varStatus="status">
					<option>${genreitem.genre }</option>
				</c:forEach>
			</select>
		</td>
		<td align="center">
			<select style="width: 150px" name="location">
				<c:forEach items="${locationList}" var="locationitem" varStatus="status">
					<option>${locationitem.location }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<br>
<input type="submit" value="회원가입">
</form>
</div>

<div class="musition" align="center" style="display: none;" >
<form action="musitionregi.do" id="contact-form" method="post" enctype="multipart/form-data">
<table>
<tr>
<td align="center">
<img alt="파일 없슴" src="" id="profileImg" style="height: 300px; width: 300px">
<br><br>
<input type="file" style="display: none;" id="upload" name="profileImgUpload" >
<input type="button" value="파일 업로드" id="uploadBtn">
</td>

<td style="width: 100px"></td>

<td align="center">
<h5 class="title-description" style="margin: 0px">아이디</h5>
<input type="text" id="mid" name="id" placeholder="아이디을 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">비밀번호</h5>
<input type="password" id="mpwd" name="pwd" placeholder="비밀번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">이름</h5>
<input type="text" name="name" placeholder="이름을 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">팀명</h5>
<input type="text" name="teamname" placeholder="팀명을 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">Position</h5>
<select style="width: 150px" name="position">
	<c:forEach items="${positionList}" var="positionitem" varStatus="status">
		<option>${positionitem.position }</option>
	</c:forEach>
</select>
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">생년월일</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">성별</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<input type="date" name="birth" style="width: 150px">
		</td>
		<td align="center">
			<div class="btn-group" data-toggle="buttons">
			
				<label class="btn btn-success active">
					<input type="radio" name="gender" value="남" autocomplete="off" checked>
					<span class="glyphicon glyphicon-ok"></span>
				</label>
	
				<label class="btn btn-primary">
					<input type="radio" name="gender" value="여" autocomplete="off">
					<span class="glyphicon glyphicon-ok"></span>
				</label>
			</div>
		</td>
	</tr>
</table>

<br>
<h5 class="title-description" style="margin: 0px">연락처</h5>
<input type="text" name="phone" maxlength="13" oninput="autoHypenPhone(this)" placeholder="핸드폰 번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 0px">이메일</h5>
<input type="text" name="email" placeholder="이메일을 입력하세요">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">좋아하는 장르</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 0px">거주지</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<select style="width: 150px" name="genre">
				<c:forEach items="${genreList}" var="genreitem" varStatus="status">
					<option>${genreitem.genre }</option>
				</c:forEach>
			</select>
		</td>
		<td align="center">
			<select style="width: 150px" name="location">
				<c:forEach items="${locationList}" var="locationitem" varStatus="status">
					<option>${locationitem.location }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<br>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="회원가입">
</td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
$("#general").click(function () {
	$(this).parent().hide(1000);
	$(".general").show(1000);
});

$("#musition").click(function () {
	$(this).parent().hide(1000);
	$(".musition").show(1000);
});


</script>

<script type="text/javascript">
	
function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var cellPhone = document.getElementsByName('phone');
cellPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}

$("#uploadBtn").click(function () {
	$("#upload").click();
});

$("#upload").on('change', function () {
	var reader = new FileReader();
	var tmppath="";
    reader.onload = function (e) {
    	
    	$("#profileImg").attr('src', e.target.result);
    }
    reader.readAsDataURL($(this)[0].files[0]);
    
});



</script>

