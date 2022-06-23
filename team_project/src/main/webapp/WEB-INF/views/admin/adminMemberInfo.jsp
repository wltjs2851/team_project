<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>
.card-body {
	width: 100%;
}

.d-flex {
	width: 30%;
	float: left;
}

.userInfo {
	width: 70%;
	float: right;
}
</style>
<!-- PLUGINS CSS STYLE -->
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link href="/resources/plugins/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/fonts.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
});
</script>
${memberVo }
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>