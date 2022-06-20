<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	var randNum;
	$("#btnSendMail").click(function() {
		var username = $("#username").val();
		var email = $("#email").val();
		if (username == null || username == "") {
			$("#none").html("이름을 입력해주세요");
		} else if (email == null || email == "") {
			$("#none").html("이메일을 입력해주세요");
		} else if ((username != null && username != "") && (email != null && email != "")) {
			$("#none").html("");
			var url = "/member/sendEmailByFindId";
			var sData = {
					"username" : username,
					"email" : email
			};
			$.post(url, sData, function(rData) {
				if (rData != null && rData != "") {
					randNum = rData;
				}
				alert("인증번호가 발송되었습니다.\n인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
				$(".form-group").show();
			});
		}
	});
	$("#btnFindId").click(function() {
		if (randNum == $("#cNumber").val()) {
			$("#frmFindId").submit();
		} else {
			alert("인증번호를 확인해주세요");
		}
	});
	$("#btnJoin").click(function() {
		location.href="/member/joinForm";
	});
	$("#username").on("change", function() {
		var username = $(this).val();
		var email = $("#email").val();
		if ((username != null && username != "") && email != null && email != "") {
			$("#btnSendMail").attr("class", "btn btn-block btn-primary");
		}
	});
	$("#email").on("change", function() {
		var email = $(this).val();
		var username = $("#username").val();
		if ((username != null && username != "") && email != null && email != "") {
			$("#btnSendMail").attr("class", "btn btn-block btn-primary");
		}
	});
	$("#cNumber").on("change", function() {
		var email = $("#email").val();
		var username = $("#username").val();
		var cNumber = $(this).val();
		if ((username != null && username != "") && (email != null && email != "") && (cNumber != null && cNumber != "")) {
			$("#btnFindId").attr("class", "btn btn-block btn-primary");
		}
	});
});
</script>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
		<span style="font-size: 40px; color: gray; text-align: center;">아이디 찾기</span><br>
		<span style="color: gray;">회원가입하신 분의 성함과 이메일을 입력해주세요.</span>
		<br><br>
			<form role="form" action="/member/findIdRun" method="post" id="frmFindId">
				<div class="form-group">
					<input type="text" class="form-control" id="username" name="username" placeholder="이름"/>
				</div>
				<div class="form-group">
					<input type="email" class="form-control" id="email" name="email" placeholder="이메일"/>
					<span id="none" style="color: red;"></span><br>
				<div class="form-group">
					<input type="text" class="form-control" id="cNumber" name="cNumber" placeholder="인증번호"/>
				</div>
				<div class="form-gorup">
					<br>
					<button id="btnSendMail" type="button" class="btn btn-block btn-outline-primary">인증번호 받기</button>
					<button id="btnFindId" type="button" class="btn btn-block btn-outline-primary">아이디 확인</button>
				</div>
				</div>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>