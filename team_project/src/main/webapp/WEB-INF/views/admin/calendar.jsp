<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/resources/css/calendar.css' rel='stylesheet'/>
</head>
<body>
	<div class='rap'>
		<div class="header">
			<div class="btn prevDay"></div>
			<h2 class='dateTitle'></h2>
			<div class="btn nextDay"></div>
		</div>

		<div class="grid dateHead">
			<div>일</div>
			<div>월</div>
			<div>화</div>
			<div>수</div>
			<div>목</div>
			<div>금</div>
			<div>토</div>
		</div>

		<div class="grid dateBoard"></div>
	</div>
</body>
<script type="text/javascript" src="/resources/js/calendar.js"></script>
</html>