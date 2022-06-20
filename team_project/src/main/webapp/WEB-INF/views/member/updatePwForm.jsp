<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	$("#btnUpdatePwRun").click(function() {
		var userid = "${userid}";
		var userpw = $("#userpw").val();
		var pw2 = $("#pw2").val();
		var pattern1 = /[0-9]/; // 숫자
		var pattern2 = /[a-zA-Z]/; // 문자
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		if (userpw == null || userpw == "") {
			$("#none").html("새로운 비밀번호를 입력해주세요.");
			$("#userpw").val("").focus();
		} else if (!pattern1.test(userpw) || !pattern2.test(userpw) || !pattern3.test(userpw)|| userpw.length < 8) {
			$("#none").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자가 포함되어야 합니다.");
			$("#userpw").val("").focus();
		} else if (pw2 == null || pw2 == "") {
			$("#none").html("비밀번호를 한번 더 입력해주세요.");
			$("#pw2").val("").focus();
		} else if (userpw != pw2) {
			$("#none").html("비밀번호를 다시 확인해주세요.");
			$("#pw2").val("").focus();
		} else if ((userpw != null && userpw != "") && (pw2 != null && pw2 != "") && (userpw == pw2)) {
			var url = "/member/updatePwRun";
			var sData = {
				'userpw' : userpw,
				'userid' : userid
			};
			$.post(url, sData, function(rData) {
				console.log(rData);
				if (rData == "true") {
					location.href="/member/loginForm";
					alert("바꾼 비밀번호로 로그인 해주세요");
				}
			});
		}
	});
});
</script>
<hr>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
			<form role="form" action="/member/updatePwRun" method="post" id="frmUpdatePwRun">
				<div class="form-group">
					<input type="password" class="form-control" id="userpw" name="userpw" placeholder="새로운 비밀번호"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="pw2"placeholder="비밀번호 확인"/>
				</div>
				<span id="none" style="color: red;"></span><br>
				<button id="btnUpdatePwRun" type="button" class="btn btn-block btn-primary">비밀번호 변경</button>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>