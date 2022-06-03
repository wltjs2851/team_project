<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	var originalPw = "${loginVo.userpw}";
	$("#btnDelete").click(function() {
		var pw = $("#userpw").val();
// 		알림으로 탈퇴 확인 취소 버튼누르면 작동
		if (window.confirm("탈퇴하시면 ??가 제공하는 서비스를 이용하지 못합니다. 정말 탈퇴할까요?")) {
			if (originalPw == pw) {
				$("#userid").val("${loginVo.userid}")
				$("#frmDelete").submit();
			} else {
				$("#wrong").html("비밀번호가 일치하지 않습니다.");
				$("#userpw").val("").focus();
			}
		} else {
			alert("좋은선택입니다.");
		}
	});
	
});
</script>
<hr>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
		<span style="font-size: 40px; color: red; text-align: center;">탈퇴</span><br>
		<span style="color: gray;">본인확인을 위해 비밀번호를 입력해주세요.</span>
		<br><br>
			<form role="form" action="/member/deleteRun" method="post" id="frmDelete">
<!-- 				tbl_user 테이블에서 삭제할때 userid를 받기위한 hidden타입 -->
				<input type="hidden" id="userid" name="userid">
				<div class="form-group">
					<input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호 입력"/>
					<span id="wrong" style="color: red;"></span>
				</div>
				<button id="btnDelete" type="button" class="btn btn-block btn-danger">회원탈퇴</button>
				<a href="/member/myPage" class="btn btn-block btn-success">돌아가기</a>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<hr>
<%@include file="/WEB-INF/views/include/footer.jsp" %>