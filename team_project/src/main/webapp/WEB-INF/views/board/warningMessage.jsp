<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
</script>
<hr>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<c:choose>
		<c:when test="${not empty warningList}">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>보낸 사람</th>
							<th>받는 사람</th>
							<th>메시지</th>
							<th>신고일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ warningList }" var="warningVo">
						<tr>
							<td>${ warningVo.wno }</td>
							<td>${ warningVo.sender }</td>
							<td>${ warningVo.receiver }</td>
							<td>${ warningVo.message }</td>
							<td>${ warningVo.regdate }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
	</c:when>
	<c:otherwise>
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/resources/images/profile.png" height="100px"
					width="100px" class="rounded-circle z-depth-2" alt="User Image">
			</div>
			<div class="info" style='padding-top: 22px; padding-left: 15px;'>
			<span style="font-size: 35px; align-content: center;">탈퇴한 회원입니다.</span>
			</div>
		</div>
	</c:otherwise>
	</c:choose>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
