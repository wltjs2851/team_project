<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function(){
	$("#btnUpdatePwRun").click(function() {
		var userpw = "${loginVo.userpw}";
		var myPw = $("#myPw").val();
		var newPw = $("#userpw").val();
		var newPw1 = $("#pw2").val();
		var pattern1 = /[0-9]/; // 숫자
		var pattern2 = /[a-zA-Z]/; // 문자
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		if (userpw != myPw) {
			$("#notMyPw").html("이전 비밀번호와 일치하지 않습니다.");
		} else if (newPw != null && newPw != "") {
			if (!pattern1.test(newPw) || !pattern2.test(newPw) || !pattern3.test(newPw)|| newPw.length < 8) {
				$("#notNewPw").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자가 포함되어야 합니다.");
				$("#pw2").val("");
				$("#userpw").val("").focus();
			} else {
				if (newPw == newPw1) {
					$("#frmUpdatePwRun").submit();
				} else {
					$("#notNewPw").html("");
					$("#notNewPw1").html("비밀번호가 일치하지 않습니다.");
					$("#pw2").val("").focus();
				}
			}
		}
	});
});	
</script>
<hr>
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item">
				<a class="nav-link" href="myPage">내 정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="modifyForm">회원정보 수정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="myPwUpdate" style="background-color: #fd9a9a;">비밀번호 변경</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/member/myActivity?type=write">활동내용</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/group/isExistMyGroupList">나의 그룹</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/calendar/cal">나의 일정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="deleteForm">회원탈퇴</a>
			</li>
		</ul>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-4">
		<span style="font-size: 40px; color: gray; text-align: center;">비밀번호 변경</span><br>
		<br><br>
		<form role="form" action="/member/MyPwUpdateRun" method="post" id="frmUpdatePwRun">
			<input type="hidden" name="userid" value="${loginVo.userid}"> 
			<div class="form-group">
				<input type="password" class="form-control" id="myPw" placeholder="현재 비밀번호"/>
				<span id="notMyPw" style="color: red;"></span>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="userpw" name="userpw" placeholder="새로운 비밀번호"/>
				<span id="notNewPw" style="color: red;"></span>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="pw2"placeholder="비밀번호 확인"/>
				<span id="notNewPw1" style="color: red;"></span>
			</div>
			<button id="btnUpdatePwRun" type="button" class="btn btn-block btn-primary">비밀번호 변경</button>
		</form>
	</div>
	<div class="col-md-4"></div>
</div>
<hr>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
