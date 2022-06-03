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
		<c:if test="${not empty loginVo}">
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<c:choose>
						<c:when test="${empty loginVo.u_pic}">
							<img src="" class="rounded-circle z-depth-2" alt="User Image">
						</c:when>
						<c:otherwise>
							<img src="/member/displayImage?filename=${loginVo.u_pic}" class="rounded-circle z-depth-2" alt="User Image">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="info">
					<span style="font-size: 50px; align-content: center;">${loginVo.nickname}(${loginVo.userid})</span>
				</div>
			</div>
		</c:if>
		<table class="table">
			<tr>
				<th>이름</th>
				<td>${loginVo.username}</td>
			</tr>
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
