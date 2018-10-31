<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script language="javascript">
//ENTER 안먹게 하는것
function captureReturnKey(e) {
    if(e.keyCode==13 && e.srcElement.type != 'textarea')
    return false;
}
</script>

<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="container" style="width: 750px;">
	<!-- Title Page -->
	<div class="row">
			<div class="title-page">
				<h2 class="title">공연 추가</h2>
				<h6 class="title-description">공연에 대한 상세항목 기재 바랍니다.</h6>
			</div>
	</div>
	<!-- End Title Page -->
	
	<form id="contact-form" class="contact-form" method="post" enctype="multipart/form-data" action="perform_schedulewriteAf.do" onkeydown="return captureReturnKey(event)">
    <input type="hidden" name="perform_seq" value="${performCastBBSDto.perform_seq }">
    <div class="row">
    		<p class="contact-name">
            	<input id="contact_title" type="text" placeholder="제목 입력" value="" name="title" />
			</p>
			<div align="center" style="border: 1px solid #26292E;">
				<input type="text" value="포스터 등록" readonly="readonly">
				<div align="center" style="padding-top: 10px; padding-bottom: 10px;">
					
					<img alt="파일 없슴" src="" id="consertImg" style="height: 280px; width: 218px">
					<br><br>
					<input type="file" style="display: none;" id="upload" name="consertImgUpload" >
					<input style="width: 218px;" type="button" value="파일 업로드" id="uploadBtn">
				</div>
			</p>
			<p class="contact-ticket_price">
            	<input id="contact_ticket_price" type="number" placeholder="티켓 가격 입력" value="" name="ticket_price" />
			</p>
			<p class="contact-notice">
				<div align="center" style="border: 1px solid #26292E;">
					<input type="text" value="Notice 입력" readonly="readonly">
	            	
	            	<div style="width: 702px; height:500px; margin: 0px; padding-bottom: 10px; padding-top: 10px;">
					<textarea name="notice" id="ir2" style="width: 700px; height: 450px;"></textarea>   
	            	<!-- <input id="contact_notice" type="text" placeholder="알려드립니다 입력" value="" name="notice" /> -->
					</div>
				</div>
			</p>
			<p class="contact-consert_info" >
				<div align="center" style="border: 1px solid #26292E;">
					<input type="text" value="공연 정보 입력" readonly="readonly">
					<br>
					<div style="width: 702px; height:500px; margin: 0px;  padding-bottom: 10px; padding-top: 10px;">
					<textarea name="consert_info" id="ir1" style="width	: 700px; height: 450px;"></textarea>   
	            	<!-- <input id="contact_consert_info" type="text" placeholder="공연 정보 입력" value="" name="consert_info" /> -->
					</div>
				</div>
			</p>
			 <input id="sending" type="submit" onclick="submitContents(this)" value="공연 공고 올리기" style="background: #5e0404">
                </div>	
    </div>
    </form>
	
</div>

<script type="text/javascript">

$("#uploadBtn").click(function () {
	$("#upload").click();
});

$("#upload").on('change', function () {
	var reader = new FileReader();
	var tmppath="";
    reader.onload = function (e) {
    	
    	$("#consertImg").attr('src', e.target.result);
    }
    reader.readAsDataURL($(this)[0].files[0]);
    
});
</script>
<script type="text/javascript">
      var oEditors = [];

      // 추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder : "ir1",
         sSkinURI : "./smarteditor/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function() {
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function() {
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator : "createSEditor2"
      });

</script>
<script type="text/javascript">
      var oEditors2 = [];

      // 추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors2,
         elPlaceHolder : "ir2",
         sSkinURI : "./smarteditor/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function() {
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function() {
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator : "createSEditor2"
      });

      function submitContents(elClickedObj) {
    	  oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
    	  oEditors2.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
         try {
            elClickedObj.form.submit();
         } catch (e) {
         }
      }

</script>