<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	$("#btnLogin").click(function() {
// 		아이디 비밀번호 유효값 검사
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
	var joinResult = "${joinResult}";
	var loginResult = "${loginResult}";
	if (joinResult == "true") {
		alert("가입 성공!\n가입한 아이디로 로그인 해주세요");
	} else if (joinResult == "false") {
		alert("알수없는 오류");
	}
	if (loginResult == "false") {
		alert("아이디와 비밀번호를 확인해주세요.")
	}
	
	$("#findId").click(function(e) {
		e.preventDefault();
		var url = "/member/findIdPop";
		var option = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"아이디 찾기",option);
	});
	$("#findPw").click(function(e) {
		e.preventDefault();
		var url = "/member/findPwPop";
		var option = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"비밀번호 찾기",option);
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
			<form role="form" action="/member/loginRun" method="post" id="frmLogin">
				<div class="form-group">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력" value="admin01"
						<c:if test="${not empty cookie.saveid}">value="${cookie.saveid.value}"</c:if>
					/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호 입력" value="admin1234!"/>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" name="saveid"
						<c:if test="${not empty cookie.saveid}">checked</c:if>
					/>아이디 저장</label>
				</div>
				<label><a href="#" id="findId">아이디찾기</a></label> / <label><a href="#" id="findPw">비밀번호 찾기</a></label>
				<span id="none" style="color: red;"></span>
				<button id="btnLogin" type="button" class="btn btn-block btn-primary">로그인</button>
				<a href="/member/joinForm" class="btn btn-block btn-success">회원가입</a>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<hr>
<%@include file="/WEB-INF/views/include/footer.jsp" %>