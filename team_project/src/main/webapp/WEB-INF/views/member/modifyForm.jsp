<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function() {
	$("#btnModify").click(function() {
		var prevImg = $("#file").attr("data-filename");
		if (prevImg != null && prevImg != "") {
			var index = prevImg.lastIndexOf("_");
			var originalFilename = prevImg.substring(index + 1);
			$("#prevImg").val(originalFilename);
		}
		var username = $("#username").val();
		var age = $("#age").val();
		var email = $("#email").val();
		var address = $("#address").val();
		console.log(username);
		console.log(age);
		console.log(email);
		console.log(address);
// 		비밀번호를 수정하려고 입력한다면 유효값 검사를 실행 아니라면 이전 비밀번호 그대로 저장
		var pw = $("#userpw").val();
		var pw2 = $("#userpw2").val();
		var userpw = "${loginVo.userpw}";
		var pattern1 = /[0-9]/; // 숫자
		var pattern2 = /[a-zA-Z]/; // 문자
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		if ((username != null && username != "") && (age != null && age != "") && (email != null && email != "") && (address != null && address != "")) {
			if (pw == null || pw == "") {
				$("#userpw").val(userpw);
				$("#userpw2").val(userpw);
				$("#frmModify").submit();
			} else if (pw != null || pw != "") {
				if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)|| pw.length < 8) {
					$("#wrongpw").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자가 포함됩니다.");
					$("#userpw").val("").focus();
				} else if (pw != pw2) {
					$("#wrongpw").html("");
					$("#notMatch").html("비밀번호가 일치하지 않습니다.");
					$("#userpw2").val("").focus();
				} else {
					$("#frmModify").submit();
				}
			}
		} else {
			alert("정보를 올바르게 기입해주세요");
		}
		
	});
// 	프로필사진 삭제
	$("#delPic").click(function(e) {
		e.preventDefault();
		var filename = $(this).attr("data-filename");
		var url = "/member/deleteFile";
		var sData = {
				"filename" : filename
		};
		$.get(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
				$("#pic").attr("src", "/resources/images/profile.png");
				$("#prevImg").val("");
				$("#file").attr("data-filename", "");
			}
		});
	});
});
</script>
<div class="container-fluid">
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item">
				<a class="nav-link" href="/member/myPage">내 정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" style="background-color: #fd9a9a">회원정보 수정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/member/myActivity?type=write">활동내역</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/group/isExistMyGroupList">나의 그룹</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/calendar/cal">나의 일정</a>
			</li>
		</ul>
	</div>
	<div class="col-md-8">
		<form method="post" action="/member/modifyRun" id="frmModify" enctype="multipart/form-data">
		<input type="hidden" name="userid" value="${loginVo.userid}">
		<input type="hidden" name="regdate" value="${loginVo.regdate}">
		<input type="hidden" id="prevImg" name="prevImg">
		<c:if test="${not empty loginVo}">
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<c:choose>
						<c:when test="${empty loginVo.u_pic}">
							<img src="/resources/images/profile.png" height="100px" width="100px" class="rounded-circle z-depth-2" alt="User Image">
							<input type="file" class="form-control-file" name="file"/>
							<p class="help-block">수정할 사진을 등록해주세요</p>
						</c:when>
						<c:otherwise> 							
							<img id="pic" height="100px" width="100px" src="/member/displayImage?filename=${loginVo.u_pic}" class="rounded-circle z-depth-2" alt="User Image">
							<a id="delPic" href="#" data-filename="${loginVo.u_pic}">&times;</a>
							<input type="file" class="form-control-file" id="file" name="file" data-filename="${loginVo.u_pic}"/>
							<p class="help-block">수정할 사진을 등록해주세요</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="info" style="padding-top: 25px; padding-left: 15px;">
					<input class="form-control" type="hidden" name="nickname" value="${loginVo.nickname}">
					<span style="font-size: 35px; align-content: center;">${loginVo.nickname}(${loginVo.userid})</span>
				</div>
			</div>
		</c:if>
		<table class="table">
			<tr>
				<th>이름</th>
				<td><input class="form-control" type="text" id="username" name="username" value="${loginVo.username}"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td class="form-group">
					<input type="radio" name="gender" value="M"
					<c:if test="${loginVo.gender == 'M'}">
					checked="checked"
					</c:if>
					/> 남
					<input type="radio" name="gender" value="F"
					<c:if test="${loginVo.gender == 'F'}">
					checked="checked"
					</c:if>
					/> 여
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input class="form-control" type="text" id="age" name="age" value="${loginVo.age}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input class="form-control" type="email" id="email" name="email" value="${loginVo.email}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input class="form-control" type="text" id="address" name="address" value="${loginVo.address}"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="form-control" type="password" name="userpw" id="userpw"><br>
					<span id="wrongpw" style="color: red;"></span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input class="form-control" type="password" id="userpw2">
					<span id="notMatch" style="color: red;"></span></td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" id="btnModify" class="btn btn-warning">수정완료</button></td>
			</tr>
		</table>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>