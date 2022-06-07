<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
// 				,onPaste: function (e) {
// 					var clipboardData = e.originalEvent.clipboardData;
// 					if (clipboardData && clipboardData.items && clipboardData.items.length) {
// 						var item = clipboardData.items[0];
// 						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
// 							e.preventDefault();
// 						}
// 					}
// 				}
			}
});
    
    

function uploadSummernoteImageFile(file) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/recipe/uploadSummernoteImageFile",
		enctype : 'multipart/form-data',
		cache : false,
		contentType : false,
		processData : false,
		success : function(data) {
			console.log(data);
			$("#summernote").summernote('insertImage', "/recipe/displayImage?filename=" + data);
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
<body>
	<form method="post" action="summerRun" enctype="multipart/form-data">
		<input type="hidden" id="filename">
		<textarea id="summernote" name="editordata"></textarea>
		<button id="btn">보내기</button>
	</form>
</body>
</html>