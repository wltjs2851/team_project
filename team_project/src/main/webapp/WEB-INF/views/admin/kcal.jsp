<%@page import="java.util.ArrayList"%>
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

.search {
	position: relative;
	width: 600px;
}

#keyword {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

#searchKcal {
	position: absolute;
	width: 25px;
	top: 10px;
	right: 12px;
	margin: 0;
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
		console.log("kcal 게시글 클릭");
		var kno = $(this).attr("data-kno");
// 		location.href = "/admin/selectByKno?kno=" + kno;
		frmPaging.find("input[name=kno]").val(kno);
		frmPaging.attr("action", "/admin/selectByKno");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 페이지 이동
	var frmPaging = $("#frmPaging");
	$("a.page-link").click(function(e) {
		e.preventDefault();
		console.log("클릭");
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/admin/listKcal");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 검색하기
	$("#searchKcal").on("click", function(e){
		e.preventDefault();
		console.log("검색하기 버튼");
		var keyword = $("#keyword").val();
		console.log(keyword);
		frmPaging.find("input[name=keyword]").val(keyword);
		frmPaging.find("input[name=page]").val(1);
		frmPaging.attr("action", "/admin/listKcal");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});
</script>
<%-- ${pagingDto} --%>
<!-- 페이지, 검색 값 -->
<form id="frmPaging">
	<input type="hidden" name="kno" value="">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>

<div class="container-fluid">
	<!-- 		칼로리사전 검색 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2>운동칼로리 사전</h2>
			<hr>
			</div>
		<div class="col-md-2"></div>
	</div>
	<!-- 		칼로리사전 목록 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<div class="search">
				<input class="form-control" type="text" placeholder="검색어 입력"
					id="keyword"
					<c:if test="${ pagingDto.keyword != null }">
						value="${ pagingDto.keyword }"
					</c:if>
				>
				<input type="image" src="/resources/images/magnifier.png" id="searchKcal">
			<br>
			</div>
			<hr>
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
<!-- 	페이지 블록 -->
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
						<li 
						<c:choose>
								<c:when test="${v == param.page}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>
						>
							<a class="page-link" href="${v}">${v}</a>
						</li>
					</c:forEach>
						<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
							</li>
						</c:if>
				</ul>
			</nav>
		</div>
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
