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
	width: 35%;
	float: left;
}

.userInfo {
	width: 65%;
	float: right;
}

th, td {
	padding: 7px;
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
	$(function() {
	});
</script>
<%-- ${memberVo } --%>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="card">
				<div class="card-header border-0">
					<div class="d-flex justify-content-between" style="width: 100%;">
						<h3 class="card-title">회원 정보</h3>
						<a href="/admin/board?userid=${memberVo.userid }"> 작성글/댓글 보기</a>
					</div>
				</div>
				<div class="card-body">
					<div class="d-flex">
						<div style="padding-right: 60px;padding-top: 25px;padding-left: 25px;">
							<c:choose>
								<c:when test="${empty memberVo.u_pic}">
									<img class="rounded-circle" width="150px;" height="auto"
										style="align-items: center; overflow: hidden;"
										src="/resources/images/profile.png" alt="프로필">
								</c:when>
								<c:otherwise>
									<img class="rounded-circle" width="150px" height="auto"
										src="/member/displayImage?filename=${memberVo.u_pic}"
										alt="프로필" style="overflow: hidden;">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="userInfo">
						<table>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${memberVo.userid}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${memberVo.username}</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>${memberVo.nickname}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${memberVo.email}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${memberVo.address}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.d-flex -->

<!-- 					<div class="position-relative mb-4"> -->
<!-- 						<div class="chartjs-size-monitor"> -->
<!-- 							<div class="chartjs-size-monitor-expand"> -->
<!-- 								<div class=""></div> -->
<!-- 							</div> -->
<!-- 							<div class="chartjs-size-monitor-shrink"> -->
<!-- 								<div class=""></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 						<canvas id="visitors-chart" height="0" --%>
<%-- 							style="display: block; width: 639px; height: 0px;" --%>
<%-- 							class="chartjs-render-monitor" width="639"></canvas> --%>
<!-- 					</div> -->

				</div>
<!-- 				card-body 끝 -->
			</div> 
<!-- 			카드 끝 -->
<!-- 			회원 가입한 그룹 내역 -->
		<div>
			
		</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>