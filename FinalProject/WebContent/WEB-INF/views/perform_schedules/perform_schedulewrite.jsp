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

<div class="container">
	<!-- Title Page -->
	<div class="row">
		<div class="span12">
			<div class="title-page">
				<h2 class="title">공연 추가</h2 >
				<h6 class="title-description">공연에 대한 상세항목 기재 바랍니다.</h6>
			</div>
		</div>
	</div>
	<!-- End Title Page -->
	
	<form id="contact-form" class="contact-form" method="post" action="perform_schedulewriteAf.do" onkeydown="return captureReturnKey(event)">
    <div class="row">
    		<p class="contact-name">
            	<input id="contact_title" type="text" placeholder="제목 입력" value="" name="title" />
			</p>
			<p class="contact-image" align="center">
				<div align="center">
					<br>
					<img alt="파일 없슴" src="" id="profileImg" style="height: 280px; width: 218px">
					<br><br>
					<input type="file" style="display: none;" id="upload" name="profileImgUpload" >
					<input style="width: 218px;" type="button" value="파일 업로드" id="uploadBtn">
				</div>
			</p>
			<p class="contact-ticket_price">
            	<input id="contact_ticket_price" type="number" placeholder="티켓 가격 입력" value="" name="ticket_price" />
			</p>
			<p class="contact-notice">
            	<input id="contact_notice" type="text" placeholder="알려드립니다 입력" value="" name="notice" />
			</p>
			<p class="contact-consert_info">
            	<input id="contact_consert_info" type="text" placeholder="공연 정보 입력" value="" name="consert_info" />
			</p>
			<textarea name="ir1" id="ir1" ></textarea>   
			 <input id="sending" type="submit" value="공연 공고 올리기" style="background: #5e0404">
                	
    </div>
    </form>
	
</div>


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

      function pasteHTML() {
         var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
         oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
      }

      function showHTML() {
         var sHTML = oEditors.getById["ir1"].getIR();
         alert(sHTML);
      }

      function submitContents(elClickedObj) {
         oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

         try {
            elClickedObj.form.submit();
         } catch (e) {
         }
      }

      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
      }
   </script>