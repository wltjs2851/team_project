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
	
	$(".td_recommend").click(function(){
		console.log("루틴게시판 작성글 클릭");
		var reno = $(this).attr("data-reno");
		location.href = "/recommend/selectByReno?reno=" + reno;
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
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="tabbable" id="tabs-834783">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" href="/admin/board?userid=${userid }"
						data-toggle="tab">작성글</a></li>
					<li class="nav-item"><a class="nav-link active" href="#tab2"
						data-toggle="tab">작성댓글</a></li>
				</ul>
			</div>
			<table class="table">
				<thead>
					<tr align="center">
						<th>댓글번호</th>
						<th>댓글</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeList }" var="free">
						<tr>
							<td>${free.fcno }</td>
							<td class="td_free" data-fno=${free.fno }>${free.fc_comment }</td>
							<td>${free.f_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${recipeList }" var="recipe">
						<tr>
							<td>${recipe.rcno }</td>
							<td class="td_recipe" data-rno=${recipe.rno }>${recipe.rc_comment }</td>
							<td>${recipe.rc_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${groupBoardList }" var="groupBoard">
						<tr>
							<td>${groupBoard.gbcno }</td>
							<td class="td_groupBoard" data-gbno=${groupBoard.gbno }>${groupBoard.gbc_content }</td>
							<td>${groupBoard.gbc_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${routineList }" var="routine">
						<tr>
							<td>${routine.urcno }</td>
							<td class="td_routine" data-uno=${routine.uno }>${routine.urc_comment }</td>
							<td>${routine.u_regdate }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${recommendList }" var="recommend">
						<tr>
							<td>${recommend.recno }</td>
							<td class="td_recommend" data-reno=${recommend.reno }>${recommend.re_comment }</td>
							<td>${recommend.re_regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination pagination-seperated "></ul>
			</nav>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>