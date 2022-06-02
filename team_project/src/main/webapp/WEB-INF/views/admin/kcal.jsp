<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function(){
	var insertKcal_result = "${insertKcal_result}";
	
	if(insertKcal_result == "true"){
		alert("운동칼로리 추가 완료");
	}
});
</script>
<%-- ${listKcal } --%>
<div class="container-fluid">
	<!-- 		칼로리사전 검색 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>운동칼로리</h3>
			<hr>
			<input type="text">
			<button type="button" class="btn btn-sm btn-success">검색</button>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- 		칼로리사전 목록 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th colspan="4">운동 종목</th>
						<th>소요시간</th>
						<th>칼로리</th>
						<th>난이도</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listKcal}" var="kcalVo">
					<tr>
						<td>${kcalVo.kno}</td>
						<td colspan="4">${kcalVo.k_name}</td>
						<td>${kcalVo.k_time}</td>
						<td>${kcalVo.kcal}</td>
						<td>${kcalVo.k_dgree}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
<!-- 	글 작성 버튼  -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<a class="btn btn-primary btn-sm" href="/admin/insertKcalForm" style="float: right;">글 쓰기</a>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
