<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		// 삭제버튼
		// 	$("#btnDeleteKcal").click(function(e){
		// 		e.preventDefault();
		// 		console.log("삭제버튼누름");
		// 	});

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
			frmPaging.attr("action", "/admin/listKcal");
			frmPaging.attr("method", "get");
			frmPaging.submit();
		});
	});
</script>
<style>
table {
	border-collapse: collapse;
	border-top: 1px solid #444444;
	/* 	 margin-left: auto; */
	/*     margin-right: auto; */
	width: 600px;
}

th, td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 13px;
}

th {
	background-color: #CEE3F6;
	padding-left: 10px;
}

th:first-child, td:first-child {
	border-left: none;
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
<form id="frmPaging">
	<input type="hidden" name="kno" value="">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>
<%-- ${kcalVo } --%>
${pagingDto }
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/admin/updateKcal" method="post">
				<input type="hidden" name="kno" value="${kcalVo.kno}" />
				<div>
					<h2>운동 칼로리 사전</h2>
					<hr>
					<article class="single-post">
						<!-- 				<form> -->
						<div class="search">
							<input class="form-control" type="text" placeholder="검색어 입력"
								id="keyword"
								<c:if test="${ pagingDto.keyword != null }">
									value="${ pagingDto.keyword }"
								</c:if>
							>
							<input type="image" src="/resources/images/magnifier.png" id="searchKcal">
						</div>
						<br>
						<!-- 					</form> -->
						<div>
							<c:choose>
							<c:when test="${ empty kcalVo.k_pic }">
								<img src="/resources/images/kcaldefault.png"
									class="img-thumbnail" alt="kcal image" style="width : 400px; height :auto;">
							</c:when>
							<c:otherwise>
							<img src="/member/displayImage?filename=${ kcalVo.k_pic }"
								class="img-thumbnail" alt="kcal image" style="width : 400px; height :auto; align-content: center;">
						</c:otherwise>
					</c:choose>
						</div>
						<table>
							<colgroup></colgroup>
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
					</article>
				</div>
<!-- 				<button type="button" class="btn btn-primary" id="btnUpdateKcal"> -->
<!-- 					수정</button> -->
<!-- 				<button type="submit" class="btn btn-success" id="btnUpdateRunKcal" -->
<!-- 					style="display: none;">수정완료</button> -->
				<a class="btn btn-sm btn-success" href="/admin/kcalUpdateForm?kno=${kcalVo.kno }">수정</a>
				<a class="btn btn-danger" href="/admin/deleteKcal?kno=${kcalVo.kno}"
					id="btnDeleteKcal">삭제</a>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>