<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function(){
	$("#file").change(function(){
	    setImageFromFile(this, "#kcalImage");
	});
	
	$("#btnUpdateKcal").click(function(){
		var prevImg = $("#file").attr("data-image");
		console.log(prevImg);
		if (prevImg != null && prevImg != "") {
			var index = prevImg.lastIndexOf("_");
			var originalFilename = prevImg.substring(index + 1);
			$("#prevImg").val(originalFilename);
		} 
		$("#frmUpdate").submit();
	})
	
	
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
<%-- ${kcalVo } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/kcal/updateKcal" method="post" enctype="multipart/form-data" id="frmUpdate">
			<input type="hidden" name="kno" value="${param.kno }">
			<input type="hidden" id="prevImg" name="prevImg">
				<div class="form-group">
					<label for="k_name">
						운동 종목
					</label>
					<input type="text" class="form-control" id="k_name" name="k_name" value="${kcalVo.k_name }"/>
				</div>
				<div class="form-group">
					<label for="k_time">
						소요시간 
					</label>
					<input type="text" class="form-control" id="k_time" name="k_time" value="${kcalVo.k_time }"/>
				</div>
				<div class="form-group">
					<label for="kcal">
						칼로리 
					</label>
					<input type="text" class="form-control" id="kcal" name="kcal" value="${kcalVo.kcal }"/>
				</div>
				<div class="form-group">
					<label for="k_dgree">
						난이도 
					</label>
					<input type="text" class="form-control" id="k_dgree" name="k_dgree" value="${kcalVo.k_dgree }"/>
				</div>
				<div class="form-group">
					<label for="k_notes">
						효과 및 참고사항 
					</label>
					<textarea rows="5" cols="100" class="form-control" id="k_notes" name="k_notes" >${kcalVo.k_notes }</textarea>
				</div>
				<div class="form-group">
					<label for="file">
						이미지
					</label>
				
					<c:choose>
						<c:when test="${ empty kcalVo.k_pic }">
							<img id="kcalImage" src="/resources/images/kcaldefault.png"
								class="img-thumbnail" alt="kcal image" style="height: 100px" name="kcalImage">
							<input type="file" class="form-control-file" id="file" name="file"/>
						</c:when>
						<c:otherwise>
							<img id="kcalImage" src="/member/displayImage?filename=${kcalVo.k_pic  }"
								class="img-thumbnail" alt="kcal image" style="width: 100px;" name="kcalImage">
							<input type="file" class="form-control-file" id="file" name="file" data-image="${kcalVo.k_pic  }"/>
						</c:otherwise>
					</c:choose>
				</div>
				<button type="button" class="btn btn-primary" id="btnUpdateKcal">
					수정하기
				</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>