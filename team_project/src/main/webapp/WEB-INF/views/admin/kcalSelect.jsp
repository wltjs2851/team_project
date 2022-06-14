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

#searchImg {
	position: absolute;
	width: 25px;
	top: 10px;
	right: 12px;
	margin: 0;
}
</style>
<%-- ${kcalVo } --%>
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
								id="keyword">
							<button type="button">
								<img src="/resources/images/magnifier.png" id="searchImg">
							</button>
						</div>
						<!-- 					</form> -->
						<img src="images/blog/post-4.jpg" alt="article-01">
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
										value="${kcalVo.k_time}"> 분</td>
								</tr>
								<tr>
									<th>칼로리</th>
									<td><span id="td_kcal">${kcalVo.kcal}</span>kcal</td>
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
							<p>: 효과 및 참고사항 자리</p>
						</div>
					</article>
				</div>
				<button type="button" class="btn btn-primary" id="btnUpdateKcal">
					수정</button>
				<button type="submit" class="btn btn-success" id="btnUpdateRunKcal"
					style="display: none;">수정완료</button>
				<a class="btn btn-danger" href="/admin/deleteKcal?kno=${kcalVo.kno}"
					id="btnDeleteKcal">삭제</a>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>