<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>
.card-body {
	width: 100%;
}

.d-flex {
	width: 30%;
	float: left;
}

.userInfo {
	width: 70%;
	float: right;
}
</style>
<!-- PLUGINS CSS STYLE -->
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link href="/resources/plugins/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/fonts.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".td_free").click(function(){
		console.log("자유게시판 작성글 클릭");
		var fno = $(this).attr("data-fno");
		location.href = "/free/freeContent?fno=" + fno;
	});
	
	$(".td_recipe").click(function(){
		console.log("식단 게시판 작성글 클릭");
		var rno = $(this).attr("data-rno");
		location.href = "/recipe/recipeForm?rno=" + rno;
	});
	
	$(".td_groupBoard").click(function(){
		console.log("그룹게시판 작성글 클릭");
		var gbno = $(this).attr("data-gbno");
		location.href = "/groupboard/groupRead?gbno=" + gbno;
	});
	
	$(".td_routine").click(function(){
		console.log("루틴게시판 작성글 클릭");
		var uno = $(this).attr("data-uno");
		location.href = "/routine/routineContent?uno=" + uno;
	});
	
	function pagination() {
		var req_num_row = 5;  //화면에 표시할 목록 개수
		var $tr = jQuery('tbody tr');  // paging 대상 class 명
		var total_num_row = $tr.length;
		var num_pages = 0;
		if (total_num_row % req_num_row == 0) {
			num_pages = total_num_row / req_num_row;
		}
		if (total_num_row % req_num_row >= 1) {
			num_pages = total_num_row / req_num_row;
			num_pages++;
			num_pages = Math.floor(num_pages++);
		}

		jQuery('.pagination').append('<li class="page-item">'
						+ '<a class="page-link" href="#" aria-label="Previous">'
						+ '<span aria-hidden="true" class="mdi mdi-chevron-left"></span>'
						+ '<span class="sr-only">Previous</span></a></li>');

		for (var i = 1; i <= num_pages; i++) {
			jQuery('.pagination').append('<li class="page-item "><a class="page-link" href="#">' + i + '</a></li>');
			jQuery('.pagination li:nth-child(2)').addClass("active");
			jQuery('.pagination a').addClass("pagination-link");
		}

		jQuery('.pagination').append('<li class="page-item">'
						+ '<a class="page-link" href="#" aria-label="Next">'
						+ '<span aria-hidden="true" class="mdi mdi-chevron-right"></span>'
						+ '<span class="sr-only">Next</span></a></li>');

		$tr.each(function(i) {
			jQuery(this).hide();
			if (i + 1 <= req_num_row) {
				$tr.eq(i).show();
			}
		});

		jQuery('.pagination a').click('.pagination-link', function(e) {
			e.preventDefault();
			$tr.hide();
			var page = jQuery(this).text();
			var temp = page - 1;
			var start = temp * req_num_row;
			var current_link = temp;

			jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");

			for (var i = 0; i < req_num_row; i++) {
				$tr.eq(start + i).show();
			}

			if (temp >= 1) {
				jQuery('.pagination li:first-child').removeClass("disabled");
			} else {
				jQuery('.pagination li:first-child').addClass("disabled");
			}

		});

		jQuery('.prev').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:first-child').removeClass("active");
		});

		jQuery('.next').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:last-child').removeClass("active");
		});

	}

	jQuery('document').ready(function() {
		pagination();

		jQuery('.pagination li:first-child').addClass("disabled");

	});
	
});
</script>
<%-- ${memberVo } --%>
<!-- 페이지, 검색 값 -->
<form id="frmPaging">
	<input type="hidden" name="fno" value="">
	<input type="hidden" name="rno" value="">
	<input type="hidden" name="gbno" value="">
	<input type="hidden" name="uno" value="">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between" style="width: 100%;">
                  <h3 class="card-title">회원 정보</h3>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                	<div style="padding-right: 60px;">
                	<c:choose>
	                	<c:when test="${empty memberVo.u_pic}">
							<img class="rounded-circle" width="150px;" height="auto" style="align-items: center; overflow: hidden;"
												src="/resources/images/profile.png" alt="프로필">
						</c:when>
						<c:otherwise>
		                  	<img class="rounded-circle" width="150px" height="auto"
												src="/member/displayImage?filename=${memberVo.u_pic}"
												alt="프로필" style="overflow: hidden;">
						</c:otherwise>
						</c:choose>
                 	 </div>
                </div>
                <div class="userInfo">
                <table>
                	<thead></thead>
                </table>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="visitors-chart" height="0" style="display: block; width: 639px; height: 0px;" class="chartjs-render-monitor" width="639"></canvas>
                </div>

              </div>
            </div>
<!-- 		회원 전체 작성글/ 댓글 -->
			<div class="tabbable" id="tabs-834783">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" href="#tab1"
						data-toggle="tab">작성글</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/comment?userid=${userid}"
						data-toggle="tab">작성댓글</a></li>
				</ul>
			</div>
			<table class="table">
				<thead>
					<tr align="center">
						<th>글번호</th>
						<th>글제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeList }" var="FreeVo">
						<tr>
							<td>${FreeVo.fno }</td>
							<td class="td_free" data-fno=${freeVo.fno }>${FreeVo.f_title }</td>
							<td>${FreeVo.f_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${recipeList }" var="RecipeVo">
						<tr>
							<td>${RecipeVo.rno }</td>
							<td class="td_recipe" data-rno=${RecipeVo.rno }>${RecipeVo.r_title }</td>
							<td>${RecipeVo.r_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${groupBoardList }" var="groupBoardVo">
						<tr>
							<td>${groupBoardVo.gbno }</td>
							<td class="td_groupBoard" data-gbno=${groupBoardVo.gbno }>${groupBoardVo.gb_title }</td>
							<td>${groupBoardVo.gb_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${routineList }" var="routineVo">
						<tr>
							<td>${routineVo.uno }</td>
							<td class="td_routine" data-uno=${routineVo.uno }>${routineVo.ur_title }</td>
							<td>${routineVo.ur_regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
<!-- 			작성글/댓글 페이징 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination pagination-seperated "></ul>
			</nav>
		</div>
		<div class="col-md-1"></div>
	</div>
<!-- 	페이지 블록 -->
<!-- <nav aria-label="Page navigation example"> -->
<!-- 	<ul class="pagination pagination-seperated "></ul> -->
<!-- </nav> -->
</body>
</html>