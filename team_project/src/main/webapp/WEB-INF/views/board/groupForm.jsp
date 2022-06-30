<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 모달폼으로 해보기 -->

<style>
	button {
		width: 110px; 
		height:50px; 
		padding: 1% 0"
	}
</style>

<script>
$(function() {
	$("#btnModify").click(function() {
		$("*[readonly]").attr("readonly", false);
		$("#file").removeAttr("disabled");
		$(this).hide();
		$("#btnJoin").hide();
		$("#btnDelete").hide();
		$("#btnModifyRun").show();
	});

	$("#file").change(function(){
	    setImageFromFile(this, "#groupImage");
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
	
	$("#btnDelete").click(function() {
		if("${groupVo.g_present}" > 1) {
			alert("그룹원이 남아있습니다.");
		} else {
			$(this).attr("href","/group/removeGroup?gno=${groupVo.gno}&userid=${loginVo.userid}");
		}
	});
	
	if("${groupVo.sgno}" == 0) {
		$("#sg_location").hide();
	}
});
</script>

<div class="container-fluid">
	<div class="row" style="margin-bottom: 20px;">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" class="btn">
			<form role="form" action="/group/modifyGroupRun" method="post" enctype="multipart/form-data" id="frmModify" style="display: inline;">
				<input type="hidden" name="gno" value="${ groupVo.gno }">
				<input type="hidden" name="userid" value="${ loginVo.userid }">
				<div class="form-group">
					<label for="g_location">
						지역 &nbsp;
					</label> 
					<div>
						<div class="col-md-2" style="display: inline-block;">
							<select id="g_location" name="dno" class="form-control" disabled>
								<option value="">도시를 선택해주세요.</option>
								<c:forEach items="${ locationVo }" var="locationVo">
									<option value="${ groupVo.dno }"	
										<c:if test="${ groupVo.dno == locationVo.dno }">
											selected
										</c:if>
									>${ locationVo.lname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-2" style="display: inline-block;
						<c:if test="${ groupVo.sno == 0 }">
							display:none;
						</c:if>
						">
							<select id="u_location" name="sno" class="form-control" disabled>
								<c:forEach items="${ s_location }" var="locationVo">
									<option value="${ groupVo.sno }"	
										<c:if test="${ groupVo.sno == locationVo.sno }">
											selected
										</c:if>
									>${ locationVo.lname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-2" style="display: inline-block;">
								<select id="sg_location" name="sgno" class="form-control" disabled>
									<c:forEach items="${ sg_location }" var="locationVo">
										<option value="${ groupVo.sgno }"	
											<c:if test="${ groupVo.sgno == locationVo.sgno }">
												selected
											</c:if>
										>${ locationVo.lname }</option>
								</c:forEach>
								</select>
						</div>
					</div>
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
							<img id="groupImage" src="/resources/images/board/groupDefault.png" data-image=""
								class="img-thumbnail" alt="group image" style="height: 100px" name="groupImage">
						</c:when>
						<c:otherwise>
							<img id="groupImage" src="/group/displayImage?filename=${ groupVo.g_pic }" data-image="${ groupVo.g_pic }"
								class="img-thumbnail" alt="group image" style="width: 100px;" name="groupImage">
						</c:otherwise>
					</c:choose>
					<br>
					<br>
				</div>
				<c:if test="${ groupVo.g_leader == loginVo.userid }">
					<button type="button" class="btn btn-warning" id="btnModify" style="width: 80px; height:50px; padding: 1% 0">수정</button>
					<button type="submit" class="btn btn-success" id="btnModifyRun" style="display: none;width: 80px; height:50px; padding: 1% 0;">수정완료</button>
					<a id="btnDelete" class="btn btn-danger" id="btnDelete" style="width: 80px; height:50px; padding: 1% 0">삭제</a>
				</c:if>
				<a href="/group/groupList" class="btn btn-outline-primary" style="width: 80px; height:50px; padding: 1% 0;">목록</a>
			</form>
			<c:if test="${ groupVo.g_leader != loginVo.userid }">
				<form role="form" action="/group/joinGroup" method="post" style="display: inline;">
					<input type="hidden" name="gno" value="${ groupVo.gno }">
					<input type="hidden" name="g_present" value="${ groupVo.g_present }">
					<button type="submit" class="btn btn-primary" id="btnJoin"
						style="width: 80px; height:50px; padding: 1% 0;">가입</button>
					<br><br>
				</form>
			</c:if>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>