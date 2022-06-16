<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(function() {
		var loginResult = "${loginResult}";
		if (loginResult == "true") {
			alert("${loginVo.nickname}(${loginVo.userid})님 환영합니다.");
		}
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
							<div class="col-lg-6 col-md-12">
								<div class="block d-flex">
									<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
										id="search" placeholder="지역">
								</div>
							</div>
							<div class="col-lg-6 col-md-12">
								<div class="block d-flex">
									<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
										id="search" placeholder="종목">
									<!-- Search Button -->
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
										<img width="60px" height="40px" style="align-items: center; border-radius: 30%; overflow: hidden;"
											src="/resources/images/recipe.png" alt="식단이미지">
									</c:when>
									<c:otherwise>
										<img width="60px" height="40px"
											src="/member/displayImage?filename=${recipeVo.r_pic}"
											alt="식단이미지" style="border-radius: 30%; overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/recipe/recipeForm?rno=${recipeVo.rno}">${fn:substring(recipeVo.r_title, 0, 7)}...</a>
								<br>
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
										<img width="60px" height="40px" style="align-items: center; border-radius: 30%; overflow: hidden;"
											src="/resources/images/routine.png" alt="루틴이미지">
									</c:when>
									<c:otherwise>
										<img width="60px" height="40px"
											src="/member/displayImage?filename=${routineVo.ur_pic}"
											alt="루틴이미지" style="border-radius: 30%; overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/routine/routineContent?uno=${routineVo.uno}">${fn:substring(routineVo.ur_title, 0, 7)}...</a>
								<br>
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
										<img width="60px" height="40px" style="align-items: center; border-radius: 30%; overflow: hidden;"
											src="/resources/images/routine.png" alt="루틴이미지">
									</c:when>
									<c:otherwise>
										<img width="60px" height="40px"
											src="/member/displayImage?filename=${freeVo.f_pic}"
											alt="루틴이미지" style="border-radius: 30%; overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/free/freeContent?fno=${freeVo.fno}">${fn:substring(freeVo.f_title, 0, 7)}...</a>
								<br>
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
										<img width="40px" height="20px" style="align-items: center; border-radius: 30%; overflow: hidden;"
											src="/resources/images/exercise.png" alt="운동이미지">
									</c:when>
									<c:otherwise>
										<img width="60px" height="40px"
											src="/member/displayImage?filename=${ReVo.re_pic}"
											alt="운동이미지" style="border-radius: 30%; overflow: hidden;">
									</c:otherwise>
								</c:choose>
								<a href="/admin/selectByReno?reno=${ReVo.reno}">${fn:substring(ReVo.re_title, 0, 7)}...</a>
								<br>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
