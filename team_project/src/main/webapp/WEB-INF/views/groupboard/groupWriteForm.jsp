<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>



<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<form role="form" name="frmWrite" action="/groupboard/groupWriteRun" method="post" enctype="multipart/form-data">
				<div class="form-group">
					 
					<label for="gb_title">제목</label>
					<input type="text" class="form-control" name="gb_title" id="gb_title" required />
				</div>
				<div class="form-group">
					 
					<label for="gb_content">내용</label>
					<input type="text" class="form-control" name="gb_content" id="gb_content" required />
				</div>
				<div class="form-group">
					 
					<label for="userid">아이디</label>
					<input type="text" class="form-control" name="userid" id="userid" />
				</div>
				<div class="form-group">
					 
					<label for="file">사진 추가</label>
					<input type="file" class="form-control-file" name="file" id="file" />
					<p class="help-block">
						부적절한 사진을 게시할 경우 강퇴
					</p>
				</div>
				
				<div class="checkbox">
					 
					<label>
						<input type="checkbox" name="notice" id="notice"/> 공지
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