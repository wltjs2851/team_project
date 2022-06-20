<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>그룹장 변경</h1>
<select name="groupMember" id="groupMember">
	<c:forEach items="${ groupJoinMember }" var="groupJoinVo">
		<option value="${ groupJoinVo.userid }">${ groupJoinVo.userid }</option>
	</c:forEach>
</select>

</body>
</html>