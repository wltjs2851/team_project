<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>

</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>
					운동칼로리 사전
				</h2>
				<p>
					<a class="btn btn-primary btn-large" href="#">목록으로</a>
				</p>
			</div>
			<form role="form" action="/kcal/insertKcal" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="k_name">
						운동 종목
					</label>
					<input type="text" class="form-control" id="k_name" name="k_name"/>
				</div>
				<div class="form-group">
					<label for="k_time">
						소요시간 
					</label>
					<input type="text" class="form-control" id="k_time" name="k_time"/>
				</div>
				<div class="form-group">
					<label for="kcal">
						칼로리 
					</label>
					<input type="text" class="form-control" id="kcal" name="kcal"/>
				</div>
				<div class="form-group">
					<label for="k_dgree">
						난이도 
					</label>
					<input type="text" class="form-control" id="k_dgree" name="k_dgree"/>
				</div>
				<div class="form-group">
					<label for="k_notes">
						효과 및 참고사항 
					</label>
					<textarea rows="5" cols="100" class="form-control" id="k_notes" name="k_notes"></textarea>
				</div>
				<div class="form-group">
					<label for="file">
						이미지
					</label>
					<input type="file" class="form-control-file" id="file" name="file"/>
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