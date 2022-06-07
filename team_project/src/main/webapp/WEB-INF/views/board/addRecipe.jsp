<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/recipe/addRecipeRun" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="r_title"> 제목 </label>  
					<input type="text" class="form-control" id="r_title" name="r_title" required/>
				</div>

				<div class="form-group">
					<label for="r_content"> 내용 </label>
					<textarea class="form-control" id="r_content" name="r_content" style="height: 300px width=100%" required> </textarea>
				</div>


				<div class="form-group">
					<label for="userid"> 사용자 </label>  
					<input type="text" class="form-control" id="userid" name="userid" required/>
				</div>
				
				<div class="form-group">

					<label for="file"> File input </label> 
					<input type="file" class="form-control-file" id="file" name="file" />
					<p class="help-block">Example block-level help text here.</p>
				</div>
				<button type="submit" class="btn btn-primary">글쓰기</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>