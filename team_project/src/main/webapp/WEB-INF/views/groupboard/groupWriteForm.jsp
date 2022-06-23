<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>

$(function() {
	$("#summernote").summernote({
		height: 300,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: "ko-KR",
		placeholder: '최대 2048자까지 쓸 수 있으며, 부적절한 사진을 게시할 경우 강퇴합니다.',
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0]);
				}
			}
	});
	
	function uploadSummernoteImageFile(file) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/groupboard/uploadSummernoteImageFile",
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data);
				$("#summernote").summernote('insertImage', '/groupboard/displayImage?filename=' + data);
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

<%-- ${ loginVo.gno } --%>
<%-- ${ loginVo } --%>
<%-- ${ groupVo } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<form role="form" name="frmWrite" action="/groupboard/groupWriteRun" method="post" enctype="multipart/form-data">
				<input type="hidden" name="gno" value="${ groupVo.gno }">
				<input type="hidden" name="userid" value="${ loginVo.userid }">
				
				<div class="form-group">
					 
					<label for="gb_title">제목</label>
					<input type="text" class="form-control" name="gb_title" id="gb_title" required />
				</div>
				<div class="form-group">
					 
					<label for="gb_content">내용</label>
<!-- 					<input type="text" class="form-control" name="gb_content" id="gb_content" required /> -->
					<textarea id="summernote" name="gb_content"></textarea>
				</div>
				<div class="form-group">
					 
					<label for="file">사진 추가</label>
					<input type="file" class="form-control-file" name="file" id="file" />
					<p class="help-block">
						부적절한 사진을 게시할 경우 강퇴
					</p>
				</div>
				
				<div class="checkbox">
					 
					<c:if test="${ loginVo.userid == groupVo.g_leader }">
					<label for="gb_notice">
						<input type="checkbox" name="gb_notice" id="gb_notice"/> 공지(그룹장만 보이게)
					</label>
					</c:if>
				</div> 
				
				<button type="submit" class="btn btn-primary">
					글 등록하기
				</button>
			</form>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>