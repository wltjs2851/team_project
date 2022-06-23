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
	
</script>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="tabbable" id="tabs-834783">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" href="/admin/selectMember?userid=${userid }"
						data-toggle="tab">작성글</a></li>
					<li class="nav-item"><a class="nav-link active" href="#tab2"
						data-toggle="tab">작성댓글</a></li>
				</ul>
			</div>
			<table class="table">
				<thead>
					<tr align="center">
						<th>댓글번호</th>
						<th>댓글</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeList }" var="free">
						<tr>
							<td>${free.fcno }</td>
							<td class="td_free" data-fcno=${free.fcno }>${free.fc_comment }</td>
							<td>${free.f_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${recipeList }" var="recipe">
						<tr>
							<td>${recipe.rcno }</td>
							<td class="td_recipe" data-fcno=${recipe.rcno }>${recipe.rc_comment }</td>
							<td>${recipe.rc_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${groupBoardList }" var="groupBoard">
						<tr>
							<td>${groupBoard.gbcno }</td>
							<td class="td_groupBoard" data-fcno=${groupBoard.gbcno }>${groupBoard.gbc_content }</td>
							<td>${groupBoard.gbc_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${routineList }" var="routine">
						<tr>
							<td>${routine.urcno }</td>
							<td class="td_routine" data-fcno=${routine.urcno }>${routine.urc_comment }</td>
							<td>${routine.u_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${recommendList }" var="recommend">
						<tr>
							<td>${recommend.recno }</td>
							<td class="td_recommend" data-fcno=${recommend.recno }>${recommend.re_comment }</td>
							<td>${recommend.re_regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>