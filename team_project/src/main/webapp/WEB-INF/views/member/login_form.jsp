<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	$("#btnLogin").click(function() {
		var id = $("#userid").val();
		var pw = $("#userpw").val();
		var pattern1 = /[0-9]/; // 숫자
		var pattern2 = /[a-zA-Z]/; // 문자
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		if (id == null || id == "") {
			$("#none").html("아이디를 입력해주세요.");
			$("#userid").val("").focus();
		} else if (pw == null || pw == "") {
			$("#none").html("비밀번호를 입력해주세요.");
			$("#userpw").val("").focus();
		} else if (!pattern1.test(id) || !pattern2.test(id) || id.length > 14) {
			$("#none").html("아이디는 14자리 이하 문자와 숫자가 포함됩니다.");
			$("#userid").val("").focus();
		} else if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)|| pw.length < 8) {
			$("#none").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자가 포함됩니다.");
			$("#userpw").val("").focus();
		} else {
			$("#frmLogin").submit();
		}
	});
});
</script>
<hr>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
		<span style="font-size: 40px; color: gray; text-align: center;">LOGIN</span><br>
		<span style="color: gray;">회원가입 후 ??의 다양한 혜택과 서비스를 받아보세요.</span>
		<br><br>
			<form role="form" action="loginRun" method="post" id="frmLogin">
				<div class="form-group">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호 입력"/>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" /> 아이디 저장</label>
				</div>
				<span id="none" style="color: red;"></span>
				<button id="btnLogin" type="button" class="btn btn-block btn-primary">로그인</button>
				<a href="joinForm" class="btn btn-block btn-success">회원가입</a>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<hr>
<%@include file="/WEB-INF/views/include/footer.jsp" %>