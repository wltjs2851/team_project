<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<%-- ${ group } --%>
<!-- <hr> -->
<%-- ${ groupVo } --%>


<c:set var="i" value="0" />
<c:set var="j" value="4" />

<table style="margin-left: auto; margin-right: auto;">

<c:choose>
<c:when test="${ group != null && fn:length(group) > 0}">

	<c:forEach items="${ group }" var="groupVo">
	
		<c:if test="{i % j == 0}">
			<tr>
		</c:if>
		
		<td>
		
		<div class="popular_product" style="padding: 3% 10%">
		<%-- <a href="/groupboard/groupMain/${ group }">${ groupVo.g_name }</a> --%>
		<div class="col-lg-3 col-md-6 col-sm-6 group" onclick="location.href ='/groupboard/groupMain/${groupVo.gno}'" data-toggle="modal"
					style="cursor:pointer;">
				<div class="product__item">
					<div style="text-align: center;width: 274.3px;">
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
		</div>
		
		</td>
		
		<c:if test="${i % j == j - 1 }">
			</tr>
		</c:if>
		
		<c:set var="i" value="${ i + 1 }"/>
	
	</c:forEach>

</c:when>

<c:otherwise>

	<tr>
		<td>그룹에 가입해 주세요</td>
	</tr>

</c:otherwise>

</c:choose>

</table>


<%-- <c:forEach items="${ group }" var="groupVo"> --%>

<%-- 	<c:choose> --%>
<%-- 	<c:when test="${ not empty group }"> --%>
<!-- 		<div class="popular__product" style="padding: 3% 10%"> -->
<%-- 		<%-- <a href="/groupboard/groupMain/${ group }">${ groupVo.g_name }</a> --%> --%>
<%-- 		<div class="col-lg-3 col-md-6 col-sm-6 group" onclick="location.href ='/groupboard/groupMain/${groupVo.gno}'" data-toggle="modal" --%>
<!-- 					style="cursor:pointer;"> -->
<!-- 				<div class="product__item"> -->
<!-- 					<div style="text-align: center;"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${ empty groupVo.g_pic }"> --%>
<!-- 								<img src="/resources/images/board/groupDefault.png" -->
<!-- 									class="img-thumbnail" alt="group image" style="height: 280px"> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<img src="/group/displayImage?filename=${ groupVo.g_pic }" --%>
<!-- 									class="img-thumbnail" alt="group image" style="height: 280px; text-align: center;"> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 						<div class="comment"> -->
<%-- 							<h5>${ groupVo.g_name }</h5> --%>
<%-- 							${ groupVo.g_intro }<br> --%>
<%-- 							<i class="fa-solid fa-user-group"></i> ${ groupVo.g_present }/${ groupVo.g_attend } --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			그룹에 가입하여 주세요 -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>

<%-- </c:forEach> --%>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>