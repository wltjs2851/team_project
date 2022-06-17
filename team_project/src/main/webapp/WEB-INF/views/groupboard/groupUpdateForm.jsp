<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%-- ${ data } --%>
${ data.gb_pic }

<script>

$(function() {
	$("#btnModify").click(function() {
		var prevImg = $("#file").attr("data-filename");
		if (prevImg != null && prevImg != "") {
			var index = prevImg.lastIndexOf("_");
			var originalFilename = prevImg.substring(index + 1);
			$("#prevImg").val(originalFilename);
		}
	});
	
	$("#delPic").click(function(e) {
		e.preventDefault();
		var filename = $(this).attr("data-filename");
		var url = "/groupboard/deleteFile";
		var sData = {
				"filename" : filename
		};
		
		$.get(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
				$("#pic").attr("src", "/resources/images/profile.png");
				$("#prevImg").val("");
				$("#file").attr("data-filename", "");
			}
		});
	});
	
	$("#file").change(function(){
	    setImageFromFile(this, "#pic");
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
	
	$("#summernote").summernote("code",  "${data.gb_content}");
    
    

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
				$("#summernote").summernote('insertImage', "/groupboard/displayImage?filename=" + data);
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

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/groupboard/groupUpdateRun" method="post" enctype="multipart/form-data">
				<input type="hidden" name="gbno" value="${ param.gbno }">
				<input type="hidden" id="prevImg" name="prevImg" value="${ data.gb_pic }">
				
				<div class="form-group">
					 
					<label for="gb_title">제목</label>
					<input type="text" value="${ data.gb_title }" class="form-control" name="gb_title" id="gb_title" required />
				</div>
				<div class="form-group">
					 
					<label for="gb_content">내용</label>
					<textarea id="summernote" name="gb_content"></textarea>
<%-- 					<input type="text" value="${ data.gb_content }" class="form-control" name="gb_content" id="gb_content" required /> --%>
				</div>
				<div class="form-group">
					 
					<label for="file">사진 추가</label>
					
					<div class="image">
						<c:choose>
							<c:when test="${empty groupBoardVo.gb_pic}">
<!-- 								<img src="/resources/images/profile.png" height="100px" width="100px" class="rounded-circle z-depth-2"> -->
								<input type="file" class="form-control-file" name="file"/>
								<p class="help-block">수정할 사진을 등록해주세요</p>
							</c:when>
							<c:otherwise>
								<img id="pic" height="100px" width="100px" src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}">
								<a id="delPic" href="#" data-filename="${groupBoardVo.gb_pic}">&times;</a>
								<input type="file" class="form-control-file" id="file" name="file" data-filename="${groupBoardVo.gb_pic}"/>
								<p class="help-block">수정할 사진을 등록해주세요</p>
							</c:otherwise>
						</c:choose>
					</div>
					
					
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${ not empty groupBoardVo.gb_pic }"> --%>
<%-- 							<img id="pic" src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}"> --%>
<%-- 							<a id="delPic" href="#" data-filename="${groupBoardVo.gb_pic}">&times;</a> --%>
<%-- 							<input type="file" value="${ groupBoardVo.gb_pic }" class="form-control-file" name="file" id="file"/> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<input type="file" value="${ data.gb_pic }" class="form-control-file" name="file" id="file"/> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
					
					<p class="help-block">
						부적절한 사진을 게시할 경우 강퇴
					</p>
				</div>
				
<!-- 				<div class="checkbox"> -->
					 
<!-- 					<label for="gb_notice"> -->
<!-- 						<input type="checkbox" name="gb_notice" id="gb_notice"/> 공지 -->
<!-- 					</label> -->
<!-- 				</div>  -->
				
				<button type="submit" id="btnModify" class="btn btn-primary">
					글 수정하기
				</button>
			</form>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>