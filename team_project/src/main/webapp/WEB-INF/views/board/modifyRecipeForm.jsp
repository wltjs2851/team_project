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
	var c = "${recipeVo.r_content}";
	var content = c.replace(" \" ", "\'");
	
	$("#summernote").summernote("code",  content);
    
    

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
	
	$("#btnSearch").click(function(e) {
		e.preventDefault();
		var url = "/recipe/searchPopup";
		var option = "width = 911px, height=615px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"상품 검색",option);
	});
});

function setProduct(obj){
	var div = "";
	div += "<div>"
	div += "<div style='display:inline-block;'>"
	div += "<img src='" + obj.image + "' height=150>";
	div += "</div>"
	div += "<div style='display:inline-block;'>"
	div += "<span><a href='" + obj.link + "' target='_blank'>" + obj.title +
			"</a><a href='#' class='a_delete' style='margin-left: 10px;'>&times;</a></span>";
	div += "<p>" + obj.lprice + "<br>" + obj.category + "<br>" + obj.maker + "</p>";
	div += "</div>"
	div += "</div>"
	$(".shopping").prepend(div);
}

$(function() {
	$("#shopping").on("click", ".a_delete", function(e) {
		e.preventDefault();
		console.log("click");
		var shpDiv = $(this).parent().parent().parent();
		shpDiv.remove();
		$("#r_product").val("");
	});
	
	$("#recipeAddForm").submit(function() {
		var html =""; 
		html += $("#shopping").html();
		$("#r_product").val(html);
		console.log($("#r_product").val());
		return true;
	});
});
</script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">

<div class="container-fluid">
	<form role="form" action="/recipe/recipeModifyRun" method="post" id="recipeAddForm" enctype="multipart/form-data">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-11">
			<div class="col-md-7" style='display:inline-block; vertical-align: top;'>
					<input type="hidden" name="rno" value="${ recipeVo.rno }">
					<input type="hidden" id="userid" name="userid" value="${ loginVo.userid }"/>
					<input type="hidden" id="r_product" name="r_product"/>
					<input type="hidden" name="page" value="${ param.page }">
					<input type="hidden" name="perPage" value="${ param.perPage }">
					<input type="hidden" name="keyword" value="${ param.keyword }">
					<input type="hidden" name="searchType" value="${ param.searchType }">
					<div class="form-group">
						<input type="text" class="form-control" value="${ recipeVo.r_title }" name="r_title" required/>
					</div>
					<div class="form-group">
						<textarea id="summernote" name="r_content"></textarea>
					</div>
					<button type="submit" class="btn btn-success" 
						style='width: 80px; height:50px; padding: 1% 0'>수정완료</button>
					<br>
					<br>
			</div>
			<div class="col-md-4" style='display:inline-block; vertical-align: top;'>
				<div class="row">
					<button class="btn btn-info" id="btnSearch" 
						style='width: 110px; height:50px; padding: 1% 0; margin-bottom: 20px'>추천 상품 검색</button><br>
				</div>
					<div class="shopping" id="shopping">
						<div style='display: inline-block;'>
							${ recipeVo.r_product }
						</div>
					</div>
			</div>
		</div>
	</div>
	</form>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>