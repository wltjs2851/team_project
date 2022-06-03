<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function(){
	
	var updateRecommend_result = "${updateRecommend_result}";
	if (updateRecommend_result == "true"){
		alert("추천 운동글 수정 완료");
	}
	
	// 수정 버튼 클릭
	$("#btnUpdateRecommend").click(function(){
		$("*[readonly]").attr("readonly", false);
		$(this).fadeOut("slow");
		$("#btnUpdateRunRecommend").fadeIn("slow");
		$("#fileRecommend").fadein("slow");
	});
	
	// 삭제버튼 
});
</script>
<%-- ${recommendVo} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>
					추천 운동법 상세 페이지 
				</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/admin/listRecommend">목록으로</a>
				</p>
			</div>
			<form role="form" action="/admin/updateRecommend" method="post">
			<input type="hidden" name="reno" value="${recommendVo.reno}"/>
				<div class="form-group">
					<label for="re_title">
						제목
					</label>
					<input type="text" class="form-control" id="re_title" name="re_title" value="${recommendVo.re_title}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="re_content">
						내용 
					</label>
					<textarea rows="10" cols="85" id="re_content" name="re_content" readonly="readonly">${recommendVo.re_content}</textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputFile">
						이미지
					</label>
					<input type="file" class="form-control-file" id="fileRecommend" style="display: none;" />
				</div>
				<button type="button" class="btn btn-primary" id="btnUpdateRecommend">
					수정
				</button>
				<button type="submit" class="btn btn-success" id="btnUpdateRunRecommend"
						style="display: none;">수정완료</button>
				<a type="button" class="btn btn-danger" href="/admin/deleteRecommend?reno=${recommendVo.reno}">삭제</a>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>