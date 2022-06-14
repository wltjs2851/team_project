<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function() {
	var joinResult = "${joinResult}";
	if(joinResult == "true") {
		alert("그룹에 가입하셨습니다.");
	}
});
</script>

<div class="popular__product" style="padding: 3% 10%">
	<a class="btn btn-warning" href="/group/addGroupForm" style="width: 110px; height:50px; padding: 1% 0">그룹 만들기</a><br><br>
	<div class="row">
		<c:forEach items="${ groupList }" var="groupVo">
		<div class="col-lg-3 col-md-6 col-sm-6 group" onclick="location.href ='/group/groupForm?gno=${groupVo.gno}'" data-toggle="modal"
			style="cursor:pointer;">
			<div class="product__item">
				<div style="text-align: center;">
					<c:choose>
						<c:when test="${ empty groupVo.g_pic }">
							<img src="/resources/images/board/groupDefault.png"
								class="img-thumbnail" alt="group image" style="height: 280px">
						</c:when>
						<c:otherwise>
							<img src="/group/displayImage?filename=${ groupVo.g_pic }"
								class="img-thumbnail" alt="group image" style="height: 280px; text-align: center;">
						</c:otherwise>
					</c:choose>
					<div class="comment">
						<h5>${ groupVo.g_name }</h5>
						${ groupVo.g_intro }<br>
						<i class="fa-solid fa-user-group"></i> ${ groupVo.g_present }/${ groupVo.g_attend }
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>
