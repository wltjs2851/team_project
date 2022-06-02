<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item">
				<a class="nav-link" href="#" style="background-color: #fd9a9a">메뉴</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="modifyForm">회원정보 수정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="myPoint">포인트 내역</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">나의 그룹</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">나의 일정</a>
			</li>
		</ul>
	</div>
	<div class="col-md-8">
		<table class="table">
			<tr>
				<th>성별</th>
				<td>
				<c:choose>
					<c:when test="${loginVo.gender == 'M'}">남자</c:when>
					<c:otherwise>여자</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${loginVo.age}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${loginVo.email}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${loginVo.address}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${loginVo.regdate}</td>
			</tr>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
