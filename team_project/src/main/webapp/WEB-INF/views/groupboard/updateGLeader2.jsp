<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnClose").click(function(e) {
		e.preventDefault();
		console.log("click");
		
		var userid = "${loginVo.userid}";
		var gno = "${groupVo.gno}";
		var url = "/groupboard/leaveGroup/" + userid;
		
		$.get(url, function(rData){
			if(rData == "true") {
				alert("탈퇴 완료");
			}
		});
	});
});
</script>

<body>

<h1>그룹장 변경</h1>
<select name="groupMember" id="groupMember">
	<c:forEach items="${ groupJoinMember }" var="groupJoinVo">
		<option value="${ groupJoinVo.userid }">${ groupJoinVo.userid }</option>
	</c:forEach>
</select>
<!-- <button id="btnClose" class="btn btn-default">변경 후 탈퇴하기</button> -->
<button type="button" class="btn btn-sm" id="btnClose">닫기</button>

</body>
</html>