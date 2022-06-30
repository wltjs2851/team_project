<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	var isExistId = "true";
	var pattern1 = /[0-9]/; // 숫자
	var pattern2 = /[a-zA-Z]/; // 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	$("#btnJoin").click(function() {
		var id = $("#userid").val();
		var pw = $("#userpw").val();
		var pw2 = $("#userpw2").val();
		var name = $("#username").val();
		var email = $("#email").val();
		var address = $("#address").val();
		var age = $("#age").val();
		var gender = $('input[name="gender"]:checked').val();
		var nickname = $("#nickname").val();
// 		입력한 값들의 유효값검사
		if (id == null || id == "") {
			$("#wrongId").html("아이디를 입력해주세요.");
			$("#userid").val("").focus();
		} else if (!pattern1.test(id) || !pattern2.test(id) || id.length > 14) {
			$("#wrongId").html("아이디는 14자리 이하 문자와 숫자가 포함되어야 합니다.");
			$("#userid").val("").focus();
		} else if (isExist == "true") {
			$("#wrongId").html("이미 존재하는 아이디입니다.");
			$("#userid").val("").focus();
		} else if (name == null || name == "") {
			$("#wrongId").html("");
			$("#noName").html("이름을 입력해주세요.");
			$("#username").val("").focus();
		} else if (pw == null || pw == "") {
			$("#noName").html("");
			$("#wrongPw").html("비밀번호를 입력해주세요.");
			$("#userpw").val("").focus();
		} else if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)|| pw.length < 8) {
			$("#wrongPw").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자가 포함되어야 합니다.");
			$("#userpw").val("").focus();
		} else if (pw2 != pw) {
			$("#wrongPw").html("");
			$("#notEqualsPw").html("비밀번호가 일치하지 않습니다.");
			$("#userpw2").val("").focus();
		} else if (email == null || email == "") {
			$("#notEqualsPw").html("");
			$("#noEmail").html("이메일을 입력해주세요.");
			$("#email").val("").focus();
		} else if (address == null || address == "") {
			$("#noEmail").html("");
			$("#noAddress").html("주소를 입력해주세요.");
			$("#Address").val("").focus();
		} else if (age == null || age == "") {
			$("#noAddress").html("");
			$("#noAge").html("나이를 입력해주세요.");
			$("#age").val("").focus();
		} else if (!pattern1.test(age)) {
			$("#noAge").html("나이는 숫자로 입력해주세요.");
			$("#age").val("").focus();
		} else if ((gender == null || gender == "") || (gender == null || gender == "")) {
			$("#noAge").html("");
			$("#noGender").html("성별을 선택해주세요.");
		} else if (nickname == null || nickname == "") {
			$("#noGender").html("");
			$("#noNickname").html("닉네임을 입력해주세요.");
			$("#nickname").val("").focus();
		} else {
			$("#frmJoin").submit();
		}
	});
	$("#userid").on("input", function() {
		var id = $("#userid").val();
		if (!pattern1.test(id) || !pattern2.test(id) || id.length > 14) {
			if (id == "") {
				$("#wrongId").html("아이디를 입력해주세요.");
			} else {
				$("#wrongId").html("아이디는 14자리 이하 문자와 숫자가 포함되어야 합니다.");
			}
		} else {
			var url = "/member/isExist";
			var sData = {
				'userid' : id	
			};
			$.get(url, sData, function(rData) {
				console.log(rData);
				if (rData == "true") {
					$("#wrongId").html("이미 존재하는 아이디입니다.");
				} else if (rData == "false") {
					$("#wrongId").html("사용할 수 있는 아이디입니다.");
				}
				isExist = rData;
			});
		}
	});
	$("#userpw").on("input", function() {
		var pw = $("#userpw").val();
		if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)|| pw.length < 8) {
			if (pw == "") {
				$("#wrongPw").html("비밀번호를 입력해주세요.");
			} else {
				$("#wrongPw").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자가 포함되어야 합니다.");
			}
		} else {
			$("#wrongPw").html("사용가능한 비밀번호입니다.");
		}
	});
	$("#userpw2").on("input", function() {
		var pw = $("#userpw").val();
		var pw2 = $("#userpw2").val();
		if (pw == pw2) {
			$("#notEqualsPw").html("비밀번호가 일치합니다.").css("color", "black");
		} else {
			$("#notEqualsPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
		}
	});
});
</script>
<hr>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
		<span style="font-size: 40px; color: gray; text-align: center;">회원가입</span><br>
		<span style="color: gray;">회원가입은 무료이며, 가입하시면 ???에서 제공하는 다양한 서비스를 이용하실 수 있습니다.</span>
		<br><br>
		<hr style="background-color: red;">
			<form role="form" action="/member/joinRun" method="post" id="frmJoin" enctype="multipart/form-data">
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid"/>
					<span id="wrongId"></span>
				</div>
				<div class="form-group">
					<div style="display: inline-block; width: 49.6%;">
						<label for="username">이름</label>
						<input type="text" class="form-control" id="username" name="username"/>
						<span id="noName"></span>
					</div>
					<div style="display: inline-block; width: 49.6%;">
						<label for="nickname">닉네임</label>
						<input type="text" class="form-control" id="nickname" name="nickname"/>
						<span id="noNickname"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="userpw">비밀번호</label>
					<input type="password" class="form-control" id="userpw" name="userpw"/>
					<span id="wrongPw"></span>
				</div>
				<div class="form-group">
					<label for="userpw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="userpw2"/>
					<span id="notEqualsPw"></span>
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="email" class="form-control" id="email" name="email"/>
					<span id="noEmail"></span>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" class="form-control" id="address" name="address"/>
					<span id="noAddress"></span>
				</div>
				<div class="form-group">
					<div style="display: inline-block; width: 49.6%;">
					<label for="age">나이</label>
					<input type="text" class="form-control" id="age" name="age"/>
					<span id="noAge"></span>
					</div>
					<div style="display: inline-block; width: 49.6%;">
					<label for="gender" style="display: block;">성별</label>
					<label for="M"> <input type="radio" name="gender" id="M" value="M"/> 남</label>
					<label for="F"> <input type="radio" name="gender" id="F" value="F"/> 여</label>
					<span id="noGender"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="file">프로필 사진</label>
					<input type="file" class="form-control-file" id="file" name="file"/>
					<p class="help-block">프로필 사진을 등록해주세요</p>
				</div>
				<span id="none" style="color: red;"></span>
				<button id="btnJoin" type="button" class="btn btn-block btn-success">회원가입</button>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>