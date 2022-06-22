<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<%-- ${ memberVo } --%>

<div class="row">
	<div class="col-md-2">
	</div>
	
	
	<div class="col-md-8">
		<c:if test="${not empty loginVo}">
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<c:choose>
						<c:when test="${empty memberVo.u_pic}">
							<img src="/resources/images/profile.png" height="100px" width="100px" class="rounded-circle z-depth-2" alt="User Image">
						</c:when>
						<c:otherwise>
							<img height="100px" width="100px" src="/member/displayImage?filename=${memberVo.u_pic}" class="rounded-circle z-depth-2" alt="User Image2">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="info">
					<span style="font-size: 35px; align-content: center;">${memberVo.nickname}(${memberVo.userid})</span>
				</div>
			</div>
		</c:if>
		<table class="table">
			<tr>
				<th>이름</th>
				<td>${memberVo.username}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<c:choose>
					<c:when test="${memberVo.gender == 'M'}">남자</c:when>
					<c:otherwise>여자</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${memberVo.age}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${memberVo.email}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${memberVo.address}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${memberVo.regdate}</td>
			</tr>
		</table>
	</div>
	
	
	<div class="col-md-2"></div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>