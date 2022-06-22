<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<%-- ${ reportList	 } --%>
<!-- <hr> -->
<h2>신고 목록</h2>
<hr>
<script>

var str = "${reportList}";
console.log(str);

var lsit = str.replace("[", "");
var list = lsit.replace("]", "");

var res = list.split(", ");

for(var i in res) {
	document.write(res[i] + '<br/>');
}

$(function() {
	$("#btnClose").click(function() {
		window.close();
	});
});

</script>

<!-- 신고 목록:  -->
<%-- <span id="span">${ reportList }</span> --%>
<hr>
<button type="button" id="btnClose" class="btn btn-danger">닫기</button>

</body>
</html>