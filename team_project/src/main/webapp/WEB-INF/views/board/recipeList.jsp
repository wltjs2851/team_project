<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ recipeList }" var="recipeVo">
					<tr>
						<td>${ recipeVo.rno }</td>
						<td><a href="/recipe/recipeForm?rno=${ recipeVo.rno }">${ recipeVo.r_title }</a></td>
						<td>${ recipeVo.userid }</td>
						<td>${ recipeVo.r_viewcnt }</td>
						<td>${ recipeVo.r_regdate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<a class="btn btn-primary" href="/recipe/addRecipeForm">글쓰기</a>
			<br><br>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>