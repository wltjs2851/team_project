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
				$("#summernote").summernote('insertImage', '/recipe/displayImage?filename=' + data);
			},
			error : function(e) {
				console.log(e);
			}
		});
	};

	$("#btnSearch").click(function(e) {
		e.preventDefault();
		var url = "/recipe/searchPopup";
		var option = "width = 911px, height=615px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"상품 검색",option);
	});
});

function setProduct(obj){
	console.log(obj);
	var div = "";
	div += "<div style='display: inline-block;'>"
	div += "<div class='row'>";
	div += "<div>";
	div += "<img src='" + obj.image + "' height=150 style='margin-left:10px'>";
	div += "</div>";
	div += "</div>";
	div += "<span><a href='" + obj.link + "' target='_blank'>" + obj.title +
			"</a><a href='#' class='a_delete' style='margin-left: 10px;'>&times;</a></span>";
	div += "<p>" + obj.lprice + "/" + obj.category + "/" + obj.maker + "</p>";
	div += "</div>"
	div += "</div>"
	div += "</div>"
	$(".shopping").prepend(div);
}

$(function() {
	$("#shopping").on("click", ".a_delete", function(e) {
		e.preventDefault();
		console.log("click");
		var shpDiv = $(this).parent().parent();
		shpDiv.empty();
		$("#r_product").val("");
	});
	
	$("#recipeForm").submit(function() {
		var html =""; 
		html += $("#shopping").html();
		$("#r_product").val(html);
		return true;
	});
});


</script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">

<div class="container-fluid">
	<form role="form" action="/recipe/addRecipeRun" method="post" enctype="multipart/form-data" id="recipeForm">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<div class="col-md-8" style='display:inline-block; vertical-align: top;'>
					<input type="hidden" class="form-control" id="nickname" name="nickname" value="${ loginVo.nickname }"/>
					<input type="hidden" class="form-control" id="r_product" name="r_product"/>
					<div class="form-group">
						<input type="text" class="form-control" id="r_title" name="r_title" required/>
					</div>
					<div class="form-group">
						<textarea id="summernote" name="r_content"></textarea>
					</div>
					<button type="submit" class="btn btn-primary" id="btn"
						style='width: 80px; height:50px; padding: 1% 0; margin-top: 20px;'>글쓰기</button>
					<br>
					<br>
			</div>
			<div class="col-md-2" style='display:inline-block; vertical-align: top;'>
				<div class="row">
					<button class="btn btn-info" id="btnSearch" 
						style='width: 110px; height:50px; padding: 1% 0; margin-bottom: 20px'>추천 상품 검색</button>
				</div>
				<div class="shopping" id="shopping"></div>
			</div>
		</div>
	</div>
	</form>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>