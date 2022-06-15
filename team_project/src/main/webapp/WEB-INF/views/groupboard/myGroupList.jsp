<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


${ group }
<div class="popular__product" style="padding: 3% 10%">
<a href="/groupboard/groupMain/${ group }">내 그룹으로 가기</a>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>