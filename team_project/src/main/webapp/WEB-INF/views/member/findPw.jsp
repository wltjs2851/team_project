<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	var randNum;
	$("#btnSendMail").click(function() {
		var userid = $("#userid").val();
		var email = $("#email").val();
		if (userid == null || userid == "") {
			$("#none").html("아이디를 입력해주세요");
		} else if (email == null || email == "") {
			$("#none").html("이메일을 입력해주세요");
		} else if ((userid != null && userid != "") && (email != null && email != "")) {
			$("#none").html("");
			var url = "/member/sendEmailByFindPw";
			var sData = {
					"userid" : userid,
					"email" : email
			};
			$.post(url, sData, function(rData) {
				if (rData != null && rData != "") {
					randNum = rData;
				}
				alert("인증번호가 발송되었습니다.\n인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.")
			});
		}
	});
	$("#btnUpdatePw").click(function() {
		if (randNum == $("#cNumber").val()) {
			$("#frmUpdatePw").submit();
		} else {
			alert("인증번호를 확인해주세요");
		}
	});
});
</script>
<body>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
			<form role="form" action="/member/updatePw" method="post" id="frmUpdatePw">
				<div class="form-group">
					<span>아이디를 입력해주세요</span><br>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디"/>
				</div>
				<div class="form-group">
					<span>이메일을 입력해주세요</span><br>
					<input type="email" class="form-control" id="email" name="email" placeholder="이메일"/> <button id="btnSendMail" type="button" class="btn btn-block btn-primary">인증번호 받기</button>
				</div>
				<div class="form-group">
					<span>인증번호를 입력해주세요</span><br>
					<input type="text" class="form-control" id="cNumber" name="cNumber" placeholder="인증번호"/> <button id="btnUpdatePw" type="button" class="btn btn-block btn-primary">비밀번호 변경</button>
				</div>
				<span id="none" style="color: red;"></span><br>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
</body>
</html>