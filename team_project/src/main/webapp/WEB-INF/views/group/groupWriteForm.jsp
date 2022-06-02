<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/group/groupWriteRun" method="post">
				<div class="form-group">
					 
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" required />
				</div>
				<div class="form-group">
					 
					<label for="content">내용</label>
					<input type="text" class="form-control" name="content" id="content" required />
				</div>
				<div class="form-group">
					 
					<label for="userid">아이디</label>
					<input type="text" class="form-control" name="userid" id="userid" required />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">사진 추가</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div>
				
				<div class="checkbox">
					 
					<label>
						<input type="checkbox" id="notice" /> 공지
					</label>
				</div> 
				
				<button type="submit" class="btn btn-primary">
					글 등록하기
				</button>
			</form>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>