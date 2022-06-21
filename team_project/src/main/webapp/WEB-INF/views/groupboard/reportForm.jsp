<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


${ groupBoardVo }

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				
				<div class="col-md-6">
					<form role="form">
					<input type="hidden" >
					
						<div>
							<h2>신고</h2>
						</div>
						
						<div class="form-group">
						
							<div><input type="radio" name="rep_cause" value="부적절한 사진 게시">부적절한 사진 게시</div>
							<div><input type="radio" name="rep_cause" value="부적절한 글 게시">부적절한 글 게시</div>
							<div><input type="radio" name="rep_cause" value="불법적인 홍보">불법적인 홍보</div>
							<div><input type="radio">기타</div>
							 
							<label for="rep_cause">
								기타
							</label>
							<input type="text" class="form-control" id="rep_cause" name="rep_cause" />
						</div>
						
						<button type="submit" class="btn btn-primary">
							신고하기
						</button>
					</form>
				</div>
				
				
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>


