<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(function() {
		var loginResult = "${loginResult}";
		var logout = "${logout}";
		if (logout == "logout") {
			alert("로그아웃 되었습니다.");
		}
// 		if (loginResult == "true") {
// 			alert("${loginVo.nickname}(${loginVo.userid})님 환영합니다.");
// 		}
		var dno;
		var sno;
		var sgno;
		$("#location").on("change", function() {
			dno = $(this).val();
			var url = "/getSno/" + dno;
			$(this).css("width", "425px");
			$("#s_location").css("width", "425px");
			$.get(url, function(rData) {
				if (rData != null && rData != "") {
					$("#s_location").show();
					$("#sg_location").hide();
					$("#s_location").html("");
					$("#s_location").html("<option value='0'>선택해주세요.</option>");
					sno = null;
					sgno = null;
					$.each(rData, function(e) {
						$("#s_location").append("<option value='" + rData[e].sno + "'>" + rData[e].lname + "</option>")
					});
					console.log(dno, sno, sgno);
				}
			});
		});
		$("#s_location").on("change", function() {
			sno = $(this).val();
			var url = "/getSgno/" + dno + "/" + sno;
			$.get(url, function(rData) {
				if (rData != null && rData != "") {
					$("#location").css("width", "284px");
					$("#s_location").css("width", "284px");
					$("#sg_location").css("width", "284px");
					$("#sg_location").show();
					$("#sg_loaction").html("");
					$("#sg_location").html("<option value='0'>선택해주세요.</option>");
					$.each(rData, function(e) {
						$("#sg_location").append("<option value='" + rData[e].sgno + "'>" + rData[e].lname + "</option>");
					});
					sgno = null;
				} else {
					$("#location").css("width", "425px");
					$("#s_location").css("width", "425px");
					$("#sg_location").hide();
					sgno = null;
				}
				console.log(dno, sno, sgno);
			});
		});
		$("#sg_location").on("change", function() {
			sgno = $(this).val();
			console.log(dno, sno, sgno);
		});
		$("#locationSearch").click(function(e) {
			e.preventDefault();
			if (dno == null || dno == "") {
				alert("검색하시려면 지역을 선택해주세요.");
			} else if (dno != null && dno != "") {
				$("#frmSearchLocation").submit();
			}
		});
	});
</script>
<section class="hero-area bg-1 text-center overly" style="padding-top: 0px; background-color: #F5F5F5">
	<!-- Container Start -->
	<div class="carousel slide" id="carousel-785097">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-785097" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-785097">
					</li>
					<li data-slide-to="2" data-target="#carousel-785097">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="/resources/images/americaFootball.jpg" />
						<div class="carousel-caption">
							<h1 class="main_word">
								Just do it!!
							</h1>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="/resources/images/swim.jpg" />
						<div class="carousel-caption">
							<h1 class="main_word">
								Go Workout
							</h1>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="/resources/images/basketball.jpg" />
						<div class="carousel-caption">
							<h1 class="main_word">
								Don't give up
							</h1>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-785097" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-785097" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
	<div class="container">
		<div class="row">
		
			<div class="col-md-12">
				<div class="advance-search">
					<form action="/group/searchLocation" method="get" id="frmSearchLocation">
						<div class="row">
							<!-- Store Search -->
							<div class="col-lg-10 col-md-12">
								<div class="block d-flex">
									<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="location" name="dno" >
										<option value="">도시를 선택해주세요.</option>
										<c:forEach items="${listLocation}" var="locationVo">
											<option value="${locationVo.dno}">${locationVo.lname}</option>
										</c:forEach>
									</select>
									<div class="block d-flex">
										<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="s_location" style="display: none;" name="sno">
										</select>
									</div>
									<div class="block d-flex">
										<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="sg_location" style="display: none;" name="sgno">
										</select>
									</div>
								</div>
							</div>
<!-- 							<div class="col-lg-4 col-md-12"> -->
<!-- 								<div class="block d-flex"> -->
									
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col-lg-2 col-md-12">
								<div class="block d-flex">
									<button class="btn btn-main" id="locationSearch">SEARCH</button>
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
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=1"><img src="/resources/images/seoul.png" class="rounded-circle">
						<h4>서울특별시</h4></a>
					</div>
					<c:forEach items="${seoulGroup}" var="seoulVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${seoulVo.gno}">${seoulVo.g_name}<span>${seoulVo.g_present} / ${seoulVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=6"><img src="/resources/images/busan.png" class="rounded-circle">
						<h4>부산광역시</h4></a>
					</div>
					<c:forEach items="${busanGroup}" var="busanVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${busanVo.gno}">${busanVo.g_name}<span>${busanVo.g_present} / ${busanVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=2"><img src="/resources/images/incheon.png" class="rounded-circle">
						<h4>인천광역시</h4></a>
					</div>
					<c:forEach items="${incheonGroup}" var="incheonVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${incheonVo.gno}">${incheonVo.g_name}<span>${incheonVo.g_present} / ${incheonVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=4"><img src="/resources/images/daegu.png" class="rounded-circle">
						<h4>대구광역시</h4></a>
					</div>
					<c:forEach items="${daeguGroup}" var="daeguVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${daeguVo.gno}">${daeguVo.g_name}<span>${daeguVo.g_present} / ${daeguVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=3"><img src="/resources/images/daejeon.png" class="rounded-circle">
						<h4>대전광역시</h4></a>
					</div>
					<c:forEach items="${daejeonGroup}" var="daejeonVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${daejeonVo.gno}">${daejeonVo.g_name}<span>${daejeonVo.g_present} / ${daejeonVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=7"><img src="/resources/images/gwangju.png" class="rounded-circle">
						<h4>광주광역시</h4></a>
					</div>
					<c:forEach items="${gwangjuGroup}" var="gwangjuVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${gwangjuVo.gno}">${gwangjuVo.g_name}<span>${gwangjuVo.g_present} / ${gwangjuVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=5"><img src="/resources/images/ulsan.png" class="rounded-circle">
						<h4>울산광역시</h4></a>
					</div>
					<c:forEach items="${ulsanGroup}" var="ulsanVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${ulsanVo.gno}">${ulsanVo.g_name}<span>${ulsanVo.g_present} / ${ulsanVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
				<div class="category-block">
					<div class="header">
						<a href="/group/searchLocation?dno=9"><img src="/resources/images/gyeonggi.png" class="rounded-circle">
						<h4>경기도</h4></a>
					</div>
					<c:forEach items="${gyeonggiGroup}" var="gyeonggiVo">
						<ul class="category-list">
							<li><a href="/group/groupForm?gno=${gyeonggiVo.gno}">${gyeonggiVo.g_name}<span>${gyeonggiVo.g_present} / ${gyeonggiVo.g_attend}</span></a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
