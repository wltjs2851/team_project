<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
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
					<h1> 운동메인 </h1>
					<p>운동운동운동운동운동운동운동운동운동 <br> 운동운동운동운동운동운동운동운동운동 <br> 운동운동운동운동운동운동운동운동운동 <br> 운동운동운동운동운동운동운동운동운동</p>
					
					
				</div>
				<!-- Advance Search -->
				<div class="advance-search">
					<form action="#">
						<div class="row">
							<!-- Store Search -->
							<div class="col-lg-6 col-md-12">
								<div class="block d-flex">
									<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search" placeholder="지역">
								</div>
							</div>
							<div class="col-lg-6 col-md-12">
								<div class="block d-flex">
									<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search" placeholder="종목">
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
							<a href="">횐님들의 식단<img class="card-img-top img-fluid"
								src="/resources/images/products/products-1.jpg" alt="Card image cap">
							</a>
							</h4>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="">11inch Macbook Air</a>
							</h4>
							<ul class="list-inline product-meta">
								<li class="list-inline-item"><a href=""><i
										class="fa fa-folder-open-o"></i>Electronics</a></li>
								<li class="list-inline-item"><a href=""><i
										class="fa fa-calendar"></i>26th December</a></li>
							</ul>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Explicabo, aliquam!</p>
							<div class="product-ratings">
								<ul class="list-inline">
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
								</ul>
							</div>
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
							<a href="">횐님들의 루틴 <img class="card-img-top img-fluid"
								src="/resources/images/products/products-2.jpg" alt="Card image cap">
							</a>
							</h4>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="">Full Study Table Combo</a>
							</h4>
							<ul class="list-inline product-meta">
								<li class="list-inline-item"><a href=""><i
										class="fa fa-folder-open-o"></i>Furnitures</a></li>
								<li class="list-inline-item"><a href=""><i
										class="fa fa-calendar"></i>26th December</a></li>
							</ul>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Explicabo, aliquam!</p>
							<div class="product-ratings">
								<ul class="list-inline">
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
								</ul>
							</div>
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
							<a href=""> 자유게시판 <img class="card-img-top img-fluid"
								src="/resources/images/products/products-3.jpg" alt="Card image cap">
							</a>
							</h4>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="">11inch Macbook Air</a>
							</h4>
							<ul class="list-inline product-meta">
								<li class="list-inline-item"><a href=""><i
										class="fa fa-folder-open-o"></i>Electronics</a></li>
								<li class="list-inline-item"><a href=""><i
										class="fa fa-calendar"></i>26th December</a></li>
							</ul>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Explicabo, aliquam!</p>
							<div class="product-ratings">
								<ul class="list-inline">
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
								</ul>
							</div>
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
							<a href=""> 추천 운동 <img class="card-img-top img-fluid"
								src="/resources/images/products/products-3.jpg" alt="Card image cap">
							</a>
							</h4>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="">11inch Macbook Air</a>
							</h4>
							<ul class="list-inline product-meta">
								<li class="list-inline-item"><a href=""><i
										class="fa fa-folder-open-o"></i>Electronics</a></li>
								<li class="list-inline-item"><a href=""><i
										class="fa fa-calendar"></i>26th December</a></li>
							</ul>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Explicabo, aliquam!</p>
							<div class="product-ratings">
								<ul class="list-inline">
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item selected"><i
										class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
