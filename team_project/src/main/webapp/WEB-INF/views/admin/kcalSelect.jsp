<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function() {

		var updateKcal_result = "${updateKcal_result}";
		if (updateKcal_result == "true") {
			alert("운동 칼로리 사전 수정 성공");
		}

		// 수정 버튼
		$("#btnUpdateKcal").click(function() {
			$("*[readonly]").attr("readonly", false);
			$(this).fadeOut("slow");
			$("#fileKcal").fadeIn("slow");
			$("#btnUpdateRunKcal").fadeIn("slow");
		});

		// 칼로리 계산기
		$("#time").on("input", function() {
			var kcal = "${kcalVo.kcal}";
			var time = "${kcalVo.k_time}";

			// 해당 운동에 대한 수식 변수 구하기
			var num = kcal / time;
			console.log(num);

			$("#td_kcal").html($(this).val() * num);
		});
		
		// 검색하기
		var frmPaging = $("#frmPaging");
		$("#searchKcal").on("click", function(e){
			e.preventDefault();
			console.log("검색하기 버튼");
			var keyword = $("#keyword").val();
			console.log(keyword);
			frmPaging.find("input[name=keyword]").val(keyword);
			frmPaging.find("input[name=page]").val(1);
			frmPaging.attr("action", "/kcal/listKcal");
			frmPaging.attr("method", "get");
			frmPaging.submit();
		});
		
		// 검색해서 들어간 상세 페이지 일 시
		// 운동 칼로리 제목 클릭 시 내용보기
		$(".td_list").click(function(){
			console.log("kcal 게시글에서 검색 목록 클릭");
			var kno = $(this).attr("data-kno");
//	 		location.href = "/kcal/selectByKno?kno=" + kno;
			frmPaging.find("input[name=kno]").val(kno);
			frmPaging.attr("action", "/kcal/selectByKno");
			frmPaging.attr("method", "get");
			frmPaging.submit();
		});
		
		// 검색 후 페이지 조회 -> 검색 글과 조회 글 표시
		// 현재 글 번호 
		var nowKno = "${kcalVo.kno}";
		console.log(nowKno);
		
		// 해당 data-kno 를 가진 tr 구하기
		$(".tr_list").find("td[data-kno=" + nowKno +"]").parent().css("background-color", "#F3F3F3");
		
	});
</script>
<style>
tr.tr_list{
	cursor: pointer;
}

table { 
border-collapse: collapse;
border-top: 1px solid #444444;
/* margin-left: auto; */
/* margin-right: auto; */
width: 600px;
border-radius: 5px;
} 

th, td { 
border-bottom: 1px solid silver;
border-left: 1px solid silver;
border-right: 1px solid silver;
padding: 13px;
} 

th {
/* background-color: #CEE3F6; */
background-color: aliceblue;
padding-left: 10px;
}

/* th:first-child, td:first-child { */
/* /* 	border-left: none; */ */
/* } */

/* .search { */
/* 	position: relative; */
/* 	width: 600px; */
/* } */

/* #keyword { */
/* 	width: 80%; */
/* 	border: 1px solid #bbb; */
/* 	border-radius: 8px; */
/* 	padding: 10px 12px; */
/* 	font-size: 14px; */
/* } */

#searchKcal {
	position: absolute;
	width: 25px;
	top: 50px;
	right: 45px;
	margin: 0;
}
</style>
<link href="/resources/css/kcal.css" rel="stylesheet"/>
<form id="frmPaging">
	<input type="hidden" name="kno" value="">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>
<%-- ${kcalVo } --%>
<%-- ${pagingDto } --%>
<%-- ${listKcal } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/kcal/updateKcal" method="post">
				<input type="hidden" name="kno" value="${kcalVo.kno}" />
				<div>
					<h2><a href="/kcal/listKcal">운동칼로리 사전</a></h2>
					<hr>
					<article class="single-post" style="padding-left: 80px;">
						<!-- 				<form> -->
						<div class="search" style="display: inline; width: 1145px; margin-bottom: 15px;">
						<div style="display: inline;" class="col-md-11">
							<input class="form-control" type="text" placeholder="검색어 입력"
								id="keyword"
								<c:if test="${ pagingDto.keyword != null }">
									value="${ pagingDto.keyword }"
								</c:if>
							>
							</div>
							<div style="display: inline;">
								<input type="image" src="/resources/images/magnifier.png"
									 style="width: 40px; float: right;" id="searchKcal">
							</div>
					</div>
					<br>
						<!-- 					</form> -->
						<div align="center">
							<c:choose>
							<c:when test="${ empty kcalVo.k_pic }">
								<img src="/resources/images/kcaldefault.png"
									alt="kcal image" style="width : 400px; height :auto;">
							</c:when>
							<c:otherwise>
							<img src="/member/displayImage?filename=${ kcalVo.k_pic }"
								alt="kcal image">
						</c:otherwise>
					</c:choose>
						</div>
						<table>
							<tbody>
								<tr>
									<th>운동종목</th>
									<td>${kcalVo.k_name}</td>
								</tr>
								<tr>
									<th>소요시간</th>
									<td><input type="number" id="time"
										style="width: 100px; text-align: center;"
										value="${kcalVo.k_time}"> 분
										<span style="color: grey; font-style: oblique; font-size: 13px;">* 운동시간을 입력해보세요 *</span>
										</td>
								</tr>
								<tr>
									<th>칼로리</th>
									<td><span id="td_kcal">${kcalVo.kcal}</span>kcal
									</td>
								</tr>
								<tr>
									<th>난이도</th>
									<td>${kcalVo.k_dgree}</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div>
							<h6>효과 및 참고 사항</h6>
							<p>: ${kcalVo.k_notes}</p>
						</div>
						<c:choose>
						<c:when test="${loginVo.userid == 'admin01'}">
						<a class="btn btn-sm btn-success" href="/kcal/kcalUpdateForm?kno=${kcalVo.kno }">수정</a>
						<a class="btn btn-danger" href="/kcal/deleteKcal?kno=${kcalVo.kno}"
						id="btnDeleteKcal">삭제</a>
						</c:when>
						</c:choose>
					</article>
<!-- 					검색했을 경우 검색 목록 -->
				<c:choose>
				<c:when test="${not empty pagingDto.keyword}">
					<article>
					<div> " ${pagingDto.keyword } " 검색 결과</div>
					<br>
					<table class="table" style="border: none;">
						<thead>
							<tr style="text-align: center;">
								<th width="620px;" style="background-color: white;">운동 종목</th>
								<th style="background-color: white;">소모 칼로리</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listKcal}" var="kcalVo">
							<tr class="tr_list" style="border-bottom: none;">
								<td class="td_kno" style="display: none;">${kcalVo.kno}</td>
								<td data-kno="${kcalVo.kno}" class="td_list">${kcalVo.k_name}</td>
								<td>${kcalVo.kcal}kcal</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</article>
				</c:when>
				</c:choose>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>