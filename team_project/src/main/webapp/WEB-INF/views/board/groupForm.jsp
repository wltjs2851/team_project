<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 모달폼으로 해보기 -->

<script>
$(function() {
	$("#btnModify").click(function() {
		$("*[readonly]").attr("readonly", false);
		$("#g_location").removeAttr("disabled").show();
		$("#file").removeAttr("disabled");
		$(".nice-select").remove();
		$(this).hide();
		$("#btnJoin").hide();
		$("#btnModifyRun").show();
	});

	$('#file').change(function(){
	    setImageFromFile(this, '#groupImage');
	});
	
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/group/addGroupRun" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="g_location">
						지역 &nbsp;
					</label> 
					<select class="form-control" id="g_location" name="g_location" disabled style="display: block">
						<option value="seoul">서울</option>
						<option value="incheon">인천</option>
						<option value="daegu">대구</option>
						<option value="ulsan">울산</option>
						<option value="busan">부산</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="g_name">
						그룹 이름
					</label>
					<input type="text" class="form-control" id="g_name" name="g_name" value="${ groupVo.g_name }" readonly/>
				</div>
				
				<div class="form-group">
					<label for="excercise_type">
						운동 종류
					</label>
					<input type="text" class="form-control" id="excercise_type" name="excercise_type" value="${ groupVo.excercise_type }" readonly/>
				</div>
				
				<div class="form-group">
					<label for="g_intro">
						그룹 소개
					</label> 
					<input type="text" class="form-control" id="g_intro" name="g_intro" value="${ groupVo.g_intro }" readonly/>
				</div>
				
				<div class="form-group">
					<label for="g_attend">
						참가 인원
					</label>
					<input type="number" class="form-control" id="g_attend" name="g_attend" value="${ groupVo.g_attend }" readonly/>
				</div>
				
				<div class="form-group">
					<label for="users">
						참가자 이름
					</label>
					<input type="text" class="form-control" id="users" name="users" value="${ groupVo.users }" readonly/>
				</div>
				
				<div>
					<label for="file">
						File input
					</label>
					<input type="file" class="form-control-file" id="file" name="file" disabled/>
					<p class="help-block">
						그룹 사진을 넣어주세요
					</p>
					<c:choose>
						<c:when test="${ empty groupVo.g_pic }">
							<img id="groupImage" src="/resources/images/board/groupDefault.png"
								class="img-thumbnail" alt="group image" style="height: 100px">
						</c:when>
						<c:otherwise>
							<img id="groupImage" src="/group/displayImage?filename=${ groupVo.g_pic }"
								class="img-thumbnail" alt="group image" style="width: 100px;">
						</c:otherwise>
					</c:choose>
					<br>
					<br>
				</div>
				
				<a class="btn btn-primary" id="btnJoin">가입</a>
				<button type="button" class="btn btn-warning" id="btnModify">수정</button>
				<button type="button" class="btn btn-success" id="btnModifyRun" style="display: none">수정완료</button>
				<br>
				<br>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>