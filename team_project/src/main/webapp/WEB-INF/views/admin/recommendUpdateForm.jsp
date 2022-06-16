<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>
$(function() {
	$("#summernote").summernote({
		height: 300,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: "ko-KR",
		placeholder: '최대 2048자까지 쓸 수 있습니다.',
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0]);
				}
			}
});
	
	// 수정하고자 하는 게시글 내용 가져오기 
  	var c = "${recommendVo.re_content}";
  	console.log(c);
  	var content = c.replace(" \" ", "\'");
  	console.log(content);
  	
  	$("#summernote").summernote("code", content);
    
function uploadSummernoteImageFile(file) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/admin/uploadSummernoteImageFile",
		enctype : 'multipart/form-data',
		cache : false,
		contentType : false,
		processData : false,
		success : function(data) {
			console.log(data);
			$("#summernote").summernote('insertImage', '/admin/displayImage?filename=' + data);
		},
		error : function(e) {
			console.log(e);
		}
	});
};
});
</script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<%-- ${recommendVo } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/admin/insertRecommend" method="post" enctype="multipart/form-data">
				<input type="hidden" name="reno" value="${recommendVo.reno }">
				<div class="form-group">
					<input type="text" class="form-control" value="${recommendVo.re_title }"id="re_title" name="re_title" required/>
				</div>
				<div class="form-group">
					<textarea id="summernote" name="re_content"></textarea>
				</div>
				<div class="form-group">
					<label for="userid"> 사용자 </label>  
					<input type="text" class="form-control" id="userid" name="userid" value="${recommendVo.userid }"required/>
				</div>
				<button type="submit" class="btn btn-primary" 
					style='width: 80px; height:50px; padding: 1% 0'>글쓰기</button>
				<br>
				<br>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>