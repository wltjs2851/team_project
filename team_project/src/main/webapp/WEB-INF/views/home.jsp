<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(function() {
		var loginResult = "${loginResult}";
// 		if (loginResult == "true") {
// 			alert("${loginVo.nickname}(${loginVo.userid})님 환영합니다.");
// 		}
		var dno;
		var sno;
		var sgno;
		$("#location").on("change", function() {
			dno = $(this).val();
			var url = "/getSno/" + dno;
			$.get(url, function(rData) {
				if (rData != null && rData != "") {
					$("#s_location").show();
					$("#sg_location").hide();
					$("#s_location").html("");
					$("#s_location").html("<option>선택해주세요.</option>");
					$.each(rData, function(e) {
						$("#s_location").append("<option value='" + rData[e].sno + "'>" + rData[e].lname + "</option>")
					});
				}
			});
		});
		$("#s_location").on("change", function() {
			sno = $(this).val();
			var url = "/getSgno/" + dno + "/" + sno;
			$.get(url, function(rData) {
				if (rData != null && rData != "") {
					$("#sg_location").show();
					$("#sg_loaction").html("");
					$("#sg_location").html("<option>선택해주세요.</option>");
					$.each(rData, function(e) {
						$("#sg_location").append("<option value='" + rData[e].sgno + "'>" + rData[e].lname + "</option>");
					}); 
				} else {
					$("#sg_location").hide();
				} 
			});
		});
		$("#sg_location").on("change", function() {
			sgno = $(this).val();
		});
	});
</script>
<section class="hero-area bg-1 text-center overly">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Header Contetnt -->
				<div class="content-block">
					<h1>운동메인</h1>
					<p>
						운동운동운동운동운동운동운동운동운동 <br> 운동운동운동운동운동운동운동운동운동 <br>
						운동운동운동운동운동운동운동운동운동 <br> 운동운동운동운동운동운동운동운동운동
					</p>
				</div>
				<!-- Advance Search -->
				<div class="advance-search">
					<form action="#">
						<div class="row">
							<!-- Store Search -->
							<div class="col-lg-4 col-md-12">
								<div class="block d-flex">
									<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="location" >
										<option>도시를 선택해주세요.</option>
										<c:forEach items="${listLocation}" var="locationVo">
											<option value="${locationVo.dno}">${locationVo.lname}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-12">
								<div class="block d-flex">
									<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="s_location" style="display: none;" >
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-12">
								<div class="block d-flex">
									<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="sg_location" style="display: none;" >
									</select>
									<button class="btn btn-main">SEARCH</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>
<section class="popular-deals section bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2>화제의 게시글</h2>
					<p>각 게시글의 조회수 상위 3개 게시글입니다.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- offer 01 -->
			<div class="col-sm-12 col-lg-3">
				<!-- product card -->
				<div class="product-item bg-light">
					<div class="card">
						<div class="thumb-content">
							<!-- <div class="price">$200</div> -->
							<h4 class="card-title">
								<a href="">횐님들의 식단</a>
							</h4>
						</div>
						<div class="card-body">
							<c:forEach items="${listRecipe}" var="recipeVo">
								<c:choose>
									<c:when test="${empty recipeVo.r_pic}">
										<img class="rounded-circle" width="30px" height="30px" style="align-items: center; overflow: hidden;"
											src="/resources/images/recipe.png" alt="식단이미지">
									</c:when>
									<c:otherwise>
										<img class="rounded-circle" width="30px" height="30px"
											src="/member/displayImage?filename=${recipeVo.r_pic}"
											alt="식단이미지" style="overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/recipe/recipeForm?rno=${recipeVo.rno}">${fn:substring(recipeVo.r_title, 0, 7)}...</a>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-lg-3">
				<!-- product card -->
				<div class="product-item bg-light">
					<div class="card">
						<div class="thumb-content">
							<!-- <div class="price">$200</div> -->
							<h4 class="card-title">
								<a href="">횐님들의 루틴</a>
							</h4>
						</div>
						<div class="card-body">
							<c:forEach items="${listRoutine}" var="routineVo">
								<c:choose>
									<c:when test="${empty routineVo.ur_pic}">
										<img class="rounded-circle" width="30px" height="30px" style="align-items: center; overflow: hidden;"
											src="/resources/images/routine.png" alt="루틴이미지">
									</c:when>
									<c:otherwise>
										<img class="rounded-circle" width="30px" height="30px"
											src="/member/displayImage?filename=${routineVo.ur_pic}"
											alt="루틴이미지" style="overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/routine/routineContent?uno=${routineVo.uno}">${fn:substring(routineVo.ur_title, 0, 7)}...</a>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-lg-3">
				<!-- product card -->
				<div class="product-item bg-light">
					<div class="card">
						<div class="thumb-content">
							<!-- <div class="price">$200</div> -->
							<h4 class="card-title">
								<a href=""> 자유게시판 </a>
							</h4>
						</div>
						<div class="card-body">
							<c:forEach items="${listFree}" var="freeVo">
								<c:choose>
									<c:when test="${empty freeVo.f_pic}">
										<img class="rounded-circle" width="30px" height="30px" style="align-items: center; overflow: hidden;"
											src="/resources/images/routine.png" alt="루틴이미지">
									</c:when>
									<c:otherwise>
										<img class="rounded-circle" width="30px" height="30px"
											src="/member/displayImage?filename=${freeVo.f_pic}"
											alt="루틴이미지" style="overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/free/freeContent?fno=${freeVo.fno}">${fn:substring(freeVo.f_title, 0, 7)}...</a>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-lg-3">
				<!-- product card -->
				<div class="product-item bg-light">
					<div class="card">
						<div class="thumb-content">
							<!-- <div class="price">$200</div> -->
							<h4 class="card-title">
								<a href=""> 추천 운동 </a>
							</h4>
						</div>
						<div class="card-body">
							<c:forEach items="${listRecommend}" var="ReVo">
								<c:choose>
									<c:when test="${empty ReVo.re_pic}">
										<img class="rounded-circle" width="30px" height="30px" style="align-items: center; overflow: hidden;"
											src="/resources/images/exercise.png" alt="운동이미지">
									</c:when>
									<c:otherwise>
										<img class="rounded-circle" width="30px" height="30px"
											src="/member/displayImage?filename=${ReVo.re_pic}"
											alt="운동이미지" style="overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/admin/selectByReno?reno=${ReVo.reno}">${fn:substring(ReVo.re_title, 0, 7)}...</a>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2>현재 그룹 상황</h2>
					<p>각 그룹들의 총인원과 현재인원입니다.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${listGroup}" var="groupVo">
				<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
					<div class="category-block">
						<div class="header">
							<i class="fa fa-laptop icon-bg-1"></i> 
								<h4>${groupVo.g_name}</h4>
						</div>
							<ul class="category-list" >
								<li><a href="/group/groupForm?gno=${groupVo.gno}">인원<span>${groupVo.g_present} / ${groupVo.g_attend}</span></a></li>
							</ul>
						</div>
					</div>
			</c:forEach> 
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
