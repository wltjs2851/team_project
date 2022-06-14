<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
tr.tr_list{
	cursor: pointer;
}

tr.tr_list:hover{
	background-color: skyblue;
}
</style>
<script>
$(document).ready(function(){
	var insertKcal_result = "${insertKcal_result}";
	var deleteKcal_result = "${deleteKcal_result}";
	if(insertKcal_result == "true"){
		alert("운동칼로리 추가 완료");
	}
	if(deleteKcal_result == "true"){
		alert("운동칼로리 삭제 완료");
	}
	
	// 운동 칼로리 제목 클릭 시 내용보기
	$(".td_list").click(function(){
		console.log("클릭 됨");
		var kno = $(this).attr("data-kno");
		location.href = "/admin/selectByKno?kno=" + kno;
// 		e.preventDefault();
// 		location.href = "/admin/selectByKno?kno=1";
	});
});
</script>
<%-- ${listKcal } --%>
<form id="frmKcal">
	<input type="hidden" name="kno" value="">
</form>
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
					<tr class="tr_list">
						<td>${kcalVo.kno}</td>
						<td colspan="4" data-kno="${kcalVo.kno}" class="td_list">${kcalVo.k_name}</td>
						<td>${kcalVo.k_time}분</td>
						<td>${kcalVo.kcal}kcal</td>
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
