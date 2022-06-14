<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>

</script>
${loginVo }

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>
					추천 운동법
				</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/admin/listRecommend">목록으로</a>
				</p>
			</div>
			<form role="form" action="/admin/insertRecommend" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${loginVo.userid}" />
				<div class="form-group">
					<label for="re_title">
						제목
					</label>
					<input type="text" class="form-control" id="re_title" name="re_title"/>
				</div>
				<div class="form-group">
					<label for="re_content">
						내용 
					</label>
					<textarea rows="100" cols="100" class="form-control" id="re_content" name="re_content"></textarea>
				</div>
				<div class="form-group">
					<label for="recoFile">
						이미지
					</label>
					<input type="file" class="form-control-file" id="recoFile" name="recoFile"/>
				</div>
				<button type="submit" class="btn btn-primary" id="btnInsertKcal">
					추가하기
				</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>