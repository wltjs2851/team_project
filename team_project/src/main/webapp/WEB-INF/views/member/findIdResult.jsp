<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	$("#btnClose").click(function() {
		window.close();
	});
});
</script>
<body>
	<span>회원님의 아이디는 ${userid}입니다.</span>
	<button type="button" id="btnClose">없어져랏</button>
	<a href="/member/loginForm">로그인하기</a>
</body>
</html>