<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>


<style>
	textarea:focus {
		outline: none;
	}
	
	button {
		width: 90px; 
		height:50px; 
		padding: 0% 1%";
	}
</style>

<script>

let oEditors = []

smartEditor = function() {
  console.log("Naver SmartEditor")
  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "editorTxt",
    sSkinURI: "/resources/static/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
  })
}


$(function() {
	smartEditor();
	
	$("#savebutton").click(function() {
		oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []); 
		//textarea의 id를 적어줍니다.

// 		var selcatd = $("#selcatd > option:selected").val();
// 		var title = $("#title").val();
		var content = document.getElementById("editorTxt").value;
		
		console.log(content);

// 		if (selcatd == "") {
// 			alert("카테고리를 선택해주세요.");
// 			return;
// 		}
// 		if (title == null || title == "") {
// 			alert("제목을 입력해주세요.");
// 			$("#title").focus();
// 			return;
// 		}
// 		if(content == "" || content == null || content == '&nbsp;' || 
// 				content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
// 			alert("본문을 작성해주세요.");
// 			oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
// 			return;
// 		} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
		
// 		var result = confirm("발행 하시겠습니까?");
		
// 		if(result){
// 			alert("발행 완료!");
// 			$("#noticeWriteForm").submit();
// 		}else{
// 			return;
// 		}
	});
});

$(function() {
	$("#btnModify").click(function() {
		$("*[disabled]").attr("disabled", false);
// 		$("#r_content").attr("contentEditable", true);
		$(this).hide();
		$("#btnModifyRun").show();
	});
	
	$("#btnModifyRun").click(function() {
		var r_content = document.getElementById("r_content").innerHTML;
		r_content.
		console.log(r_content);
	});
	
	var textEle = $('textarea');
	textEle.on('keyup', function() {
	  adjustHeight();
	});
	
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight);
	}
	
	$("#file").change(function(){
	    setImageFromFile(this, "#recipeImage");
	});
	
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr("src", e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/recipe/recipeModifyRun" method="post" enctype="multipart/form-data">
				<input type="hidden" name="rno" value="${ recipeVo.rno }">
				<div class="form-group">
					<label for="r_title"> 제목 </label>  
					<input type="text" class="form-control" id="r_title" name="r_title" value="${ recipeVo.r_title }" required disabled
						style="background-color: #FFFFFF;"/>
				</div>
				
				<div class="form-group">
					<textarea name="editorTxt" id="editorTxt" rows="20" cols="10" style="width: 100%">
						${ recipeVo.r_content }</textarea>
					<div id="se2_sample" style="margin:10px 0;">
						<input type="button" id="savebutton" value="본문 내용 가져오기">
					</div>
				</div>
				
				<div class="form-group">
					<label for="userid"> 사용자 </label>  
					<input type="text" class="form-control" id="userid" name="userid" required disabled value="${ recipeVo.userid }"
						style="background-color: #FFFFFF"/>
				</div>
				
				<div class="form-group">
					<label for="file"> File input </label> 
					<input type="file" class="form-control-file" id="file" name="file" disabled/>
					<p class="help-block">Example block-level help text here.</p>
				</div>
				<button type="button" class="btn btn-warning" id="btnModify"
					style="width: 80px; height:50px; padding: 1% 0">수정하기</button>
				<button type="submit" class="btn btn-success" id="btnModifyRun" 
					style="display: none; width: 80px; height:50px; padding: 1% 0">수정완료</button>
				<br>
				<br>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<hr>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>