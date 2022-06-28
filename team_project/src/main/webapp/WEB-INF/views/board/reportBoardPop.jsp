<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<script>
$(function() {
	$("#btnClose").click(function() {
		window.close();
	});
	
	$("#btnReport").click(function() {
		$("#reportForm").submit();
		setTimeout(function() {   
            window.close();
         }, 10);
	});
});
</script>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6" style='margin-top: 18px;'>
					<form role="form" id="reportForm" method="post" action="/reportBoard/addReportRun">
						<div>
							<h2>${ reportBoardVo.receiver }회원 신고</h2>
						</div>
						
						<div class="form-group">
							<c:choose>
								<c:when test="${ reportBoardVo.rno != 0 }">								
									<input type="hidden" name="rno" value="${ reportBoardVo.rno }">
								</c:when>
								<c:when test="${ reportBoardVo.uno != 0 }">								
									<input type="hidden" name="uno" value="${ reportBoardVo.uno }">
								</c:when>
								<c:when test="${ reportBoardVo.fno != 0 }">								
									<input type="hidden" name="fno" value="${ reportBoardVo.fno }">
								</c:when>
								<c:when test="${ reportBoardVo.rcno != 0 }">								
									<input type="hidden" name="rcno" value="${ reportBoardVo.rcno }">
								</c:when>
								<c:when test="${ reportBoardVo.urcno != 0 }">								
									<input type="hidden" name="urcno" value="${ reportBoardVo.urcno }">
								</c:when>
								<c:when test="${ reportBoardVo.fcno != 0 }">								
									<input type="hidden" name="fcno" value="${ reportBoardVo.fcno }">
								</c:when>
								<c:when test="${ reportBoardVo.recno != 0 }">								
									<input type="hidden" name="recno" value="${ reportBoardVo.recno }">
								</c:when>
							</c:choose>
							<input type="hidden" name="receiver" value="${ reportBoardVo.receiver }">
							<input type="hidden" name="sender" value="${ reportBoardVo.sender }">
						
						
							<div><input type="radio" name="rep_cause" value="부적절한 사진 게시">부적절한 사진 게시</div>
							<div><input type="radio" name="rep_cause" value="부적절한 글 게시">부적절한 글/댓글 게시</div>
							<div><input type="radio" name="rep_cause" value="불법적인 홍보">불법적인 홍보</div>
							<div><input type="radio" name="rep_cause" value="방정하지 못한 언행">방정하지 못한 언행</div>
							<div><input type="radio" name="rep_cause" value="타인을 비난하거나 비방함">타인을 비난하거나 비방함</div>
							<div><input type="radio" name="rep_cause" value="종교 권유 및 전도">종교 권유 및 전도</div>
							<div><input type="radio" name="rep_cause" value="기타">기타
								<input type="text" name="rep_etc">
							</div>
						</div>
						
						<button type="button" id="btnReport" class="btn btn-outline-danger">
							신고하기
						</button>
						<button type="button" id="btnClose" class="btn btn-outline-success">닫기</button>
					</form>
				</div>
				
				
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>