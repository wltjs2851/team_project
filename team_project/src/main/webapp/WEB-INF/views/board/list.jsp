<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="popular__product">
	<div class="row">
		<c:forEach items="${ groupList }" var="groupVo">
		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="product__item">
				<div>
					<img src="/resources/images/jeju5.jpg" width="300" style="margin-left: 30px">
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
