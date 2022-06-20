<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
.result-cnt p {
	font-size: 30px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
			<hr>
<div class="row">
	<div class="col-md-4">
	</div>
		<div class="col-md-4">
			<span style="font-size: 40px; color: gray; text-align: center;">아이디 찾기</span><br>
			<br><br>
			<div class="join-area type2">
				<div class="result-cnt">
					<i class="ico-img-info"></i>
					<p class="message">
						회원님의 아이디는<br>
						<strong class="text-primary"> [${userid}] </strong> 입니다.
					</p>
				</div>
			</div>
			<a href="/member/findPwPop" class="btn btn-outline-success">비밀번호 찾기</a>
			<a href="/member/loginForm" class="btn btn-success">로그인하기</a>
		</div>
	<div class="col-md-4">
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>