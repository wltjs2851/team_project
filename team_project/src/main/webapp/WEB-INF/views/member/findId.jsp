<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	$("#btnFindId").click(function() {
		var username = $("#username").val();
		var email = $("#email").val();
		if (username == null || username == "") {
			$("#none").html("이름을 입력해주세요");
		} else if (email == null || email == "") {
			$("#none").html("이메일을 입력해주세요");
		} else if ((username != null && username != "") && (email != null && email != "")) {
			$("#none").html("");
			var url = "/member/findId";
			var sData = {
					"username" : username,
					"email" : email
			};
			$.post(url, sData, function(rData) {
				if (rData != null && rData != "") {
					$("#userid").html("회원님의 아이디는 " + rData + "입니다.");
				} else {
					$("#userid").html("가입된 아이디가 없습니다. 회원가입을 해주세요.");
				}
			});
		}
	});
});
</script>
<body>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
			<form role="form" action="/member/findId" method="post" id="frmFindId">
				<div class="form-group">
					<span>이름을 입력해주세요</span><br>
					<input type="text" class="form-control" id="username" name="username" placeholder="이름"/>
				</div>
				<div class="form-group">
					<span>이메일을 입력해주세요</span><br>
					<input type="email" class="form-control" id="email" name="email" placeholder="이메일"/>
				</div>
				<span id="none" style="color: red;"></span><br>
				<button id="btnFindId" type="button" class="btn btn-block btn-primary">아이디 찾기</button>
			</form>
			<h2 id="userid"></h2>
		</div>
	<div class="col-md-4">
	</div>
</div>
</body>
</html>