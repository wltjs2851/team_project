<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
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
				</div>
				<div class="form-group">
					<label for="username">이름</label>
					<input type="text" class="form-control" id="username" name="username"/>
				</div>
				<div class="form-group">
					<label for="userpw">비밀번호</label>
					<input type="password" class="form-control" id="userpw" name="userpw"/>
				</div>
				<div class="form-group">
					<label for="userpw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="userpw2"/>
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="email" class="form-control" id="email" name="email"/>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" class="form-control" id="address" name="address"/>
				</div>
				<div class="form-group">
					<label for="age">나이</label>
					<input type="text" class="form-control" id="age" name="age"/>
					<label for="gender">성별</label>
					<input type="radio" name="gender" value="M"/> 남
					<input type="radio" name="gender" value="F"/> 여
				</div>
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<input type="text" class="form-control" id="nickname" name="nickname"/>
				</div>
				<div class="form-group">
					<label for="file">프로필 사진</label>
					<input type="file" class="form-control-file" id="file" name="file"/>
					<p class="help-block">프로필 사진을 등록해주세요</p>
				</div>
				<span id="none" style="color: red;"></span>
				<button id="btnJoin" type="submit" class="btn btn-block btn-success">회원가입</button>
			</form>
		</div>
	<div class="col-md-4">
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>