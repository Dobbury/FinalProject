<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Contact Section -->

<div id="contact" class="page">
<div class="container">
    <!-- Title Page -->
    <div class="row">
        <div class="span12">
            <div class="title-page">
                <h2 class="title">공연 섭외 문의</h2>
                <h6 class="title-description">공연문의 내용을 이메일이나 핸드폰 메세지를 남겨주시면 빠른연락 드리겠습니다.</h6>
            </div>
        </div>
    </div>
    <!-- End Title Page -->
    
    <!-- Contact Form -->
    <form id="contact-form" class="contact-form" method="post" action="castSchedule.do">
    <div class="row">
    	<div class="span9">
        
        	<!-- <form id="contact-form" class="contact-form" method="post" action="castSchedule.do"> -->
            	<p class="contact-name">
            		<input id="contact_name" type="text" placeholder="문의자 성함" value="" name="name" />
                </p>
                <p class="contact-company">
            		<input id="contact_company" type="text" placeholder="기업 또는 단체명" value="" name="compname" />
                </p>
                <p class="contact-email">
            		<input id="contact_email" type="text" placeholder="이메일 주소" value="" name="email" />
                </p>
                <p class="contact-phone">
                	<input id="contact_phone" type="text" placeholder="연락처 ('-'제외하고 입력)" value="" name="phone"/>
                </p>
                <p class="contact-place">
                	<input id="contact_place" type="text" placeholder="주소" value="" name="place"/>
                </p>
                <select style="margin-bottom: 1px;" name="location">
                	<option value="지역" style="text-shadow: background;">지역</option>
  					<option value="서울">서울</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="부산">부산</option>
				</select>
                <select  style="margin-bottom: 1px;" name="price">
                	<option value="init" style="text-shadow: background;">예상 섭외 예산(최소 50만원 이상)</option>
  					<option value="50-100">50-100만원</option>
					  <option value="100-150">100-150만원</option>
					  <option value="150-200">150-200만원</option>
					  <option value="200-250">200-250만원</option>
				</select>
				
				<select style="margin-bottom: 1px;" name="totalcount">
                	<option value="0" style="text-shadow: background;">공연 횟수</option>
  					<option value=1>1일1회 공연</option>
					<option value=2>1일2회 공연</option>
				</select>
				
				
                <p class="contact-comment">
                	<textarea id="contact-comment" placeholder="문의 사항" name="content" rows="15" cols="40"></textarea>
                </p>              
                	 <input id="sending" type="submit" value="문의하기" style="background: #5e0404">
                	
                <div id="response">
                
                </div>
         <!-- </form> -->
        </div>
        
        <div class="span3">
        	<div class="contact-details">
        		<p style="font-family: fantasy; color: #7da5e8">공연을 관람하는 대상, 연령별 선택 <br>(중복선택 가능)<font color="red">*</font></p>
        		<span id="ch7" style="width: auto;">
				<span id="ch1" style="width: 78%" class="wpcf7-list-item first"><input type="checkbox" name="agegrade" value="중,고등학생"><span class="wpcf7-list-item-label">중,고등학생</span></span>
				<span id="ch2" style="width: 78%" class="wpcf7-list-item first"><input type="checkbox" name="agegrade" value="대학생"><span class="wpcf7-list-item-label">대학생</span></span>
				<span id="ch3" style="width: 78%" class="wpcf7-list-item first"><input type="checkbox" name="agegrade" value="성인남녀"><span class="wpcf7-list-item-label">성인남녀</span></span>
				<br>
				<span id="ch4" style="width: 78%" class="wpcf7-list-item first"><input type="checkbox" name="agegrade" value="고령자"><span class="wpcf7-list-item-label">고령자</span></span>
				<span id="ch5" style="width: 78%" class="wpcf7-list-item first"><input type="checkbox" name="agegrade" value="장애인"><span class="wpcf7-list-item-label">장애인</span></span>
				<span id="ch6" style="width: 78%" class="wpcf7-list-item first"><input type="checkbox" name="agegrade" value="외국인"><span class="wpcf7-list-item-label">외국인</span></span>
				</span>
                
            </div>
        </div>       
    </div>
     </form>   
    <!-- End Contact Form -->
</div>
</div>

<!-- End Contact Section -->

<!-- Twitter Feed -->
<div id="twitter-feed" class="page-alternate">
	<div class="container">
    	<div class="row">
            <div class="span12">
                <div class="follow">
                    <a href="https://twitter.com/Bluxart" title="Follow Me on Twitter" target="_blank"><i class="font-icon-social-twitter"></i></a>
                </div>
                    
                <div id="ticker" class="query"> 
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Twitter Feed -->

<!-- Socialize -->
<div id="social-area" class="page">
	<div class="container">
    	<div class="row">
            <div class="span12">
                <nav id="social">
                    <ul>
                        <li><a href="https://twitter.com/Bluxart" title="Follow Me on Twitter" target="_blank"><span class="font-icon-social-twitter"></span></a></li>
                        <li><a href="http://dribbble.com/Bluxart" title="Follow Me on Dribbble" target="_blank"><span class="font-icon-social-dribbble"></span></a></li>
                        <li><a href="http://forrst.com/people/Bluxart" title="Follow Me on Forrst" target="_blank"><span class="font-icon-social-forrst"></span></a></li>
                        <li><a href="http://www.behance.net/alessioatzeni" title="Follow Me on Behance" target="_blank"><span class="font-icon-social-behance"></span></a></li>
                        <li><a href="https://www.facebook.com/Bluxart" title="Follow Me on Facebook" target="_blank"><span class="font-icon-social-facebook"></span></a></li>
                        <li><a href="https://plus.google.com/105500420878314068694" title="Follow Me on Google Plus" target="_blank"><span class="font-icon-social-google-plus"></span></a></li>
                        <li><a href="http://www.linkedin.com/in/alessioatzeni" title="Follow Me on LinkedIn" target="_blank"><span class="font-icon-social-linkedin"></span></a></li>
                        <li><a href="http://themeforest.net/user/Bluxart" title="Follow Me on ThemeForest" target="_blank"><span class="font-icon-social-envato"></span></a></li>
                        <li><a href="http://zerply.com/Bluxart/public" title="Follow Me on Zerply" target="_blank"><span class="font-icon-social-zerply"></span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- End Socialize -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> <!-- jQuery Core -->

<script type="text/javascript">

/* function submit(f) {
	alert('문의신청이 되었습니다');	
	$("#contact-form").attr({ "target":"_self", "action":"castSchedule.do" }).submit();
} */

	$("#sending").click(function() {	
		alert('문의신청이 되었습니다');	
		/* $("#contact-form").attr({ "method":"post", "target":"_self", "action":"castSchedule.do" }).submit(); */	
	});

</script>


<%-- 
<script type="text/javascript">
/* 
function ajaxcalendar(i, id, rdate) {
	$("#mytd"+i).css("background-color", "#ff0000");
	showallcust(i, id, rdate);
}
function mout(i) {
	$("#mytd"+i).css("background-color", "#ffffff");
	$("#my"+i).hide();
}
$(document).ready(function name() {
	$("#my").html("나는 미래다");
});
 */
 
function showallcust(i, id, rdate) {
	//alert("showallcust");
	$.ajax({
		type:"POST",
		url:"<%=application.getContextPath() %>/calendarjson.do",
		async:true,
		data:"id="+id+"&rdate="+rdate,
		success:function(msg){	
			
			alert("success");
			
			if(msg.my != null){
				
				$.each(msg.my, function(index, value) { 
					alert(index + '번째:' + value.title);					
				});
			}  
			
		//	alert("날짜:" + i + " 아이디:" + id +  " 연월일:" + rdate);
		//	console.log("날짜:" + i + " 아이디:" + id +  " 연월일:" + rdate);
		}
	});	
}  


</script>

 --%>