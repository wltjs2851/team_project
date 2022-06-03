<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<head>

<script src="https://kit.fontawesome.com/94cf0924f0.js" crossorigin="anonymous"></script>

  <!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>운동</title>
  
  <!-- PLUGINS CSS STYLE -->
  <link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">

  <!-- Bootstrap -->
  <link href="/resources/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Owl Carousel -->
  <link href="/resources/plugins/slick-carousel/slick/slick.css" rel="stylesheet">
  <link href="/resources/plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
  <!-- Fancy Box -->
  <link href="/resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="/resources/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
  <link href="/resources/plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
  <!-- CUSTOM CSS -->
  <link href="/resources/css/style.css" rel="stylesheet">

  <!-- FAVICON -->
  <link href="/resources/img/favicon.png" rel="shortcut icon">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body class="body-wrapper">


<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation col-md-12">
					<a class="navbar-brand" href="/">
						<img src="/resources/images/logo.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
							<li class="nav-item active">
								<a class="nav-link" href="index.html">메인</a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									관리자 게시판 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="/admin/listKcal">운동 칼로리</a>
									<a class="dropdown-item" href="/admin/listRecommend ">추천 운동</a>
								</div>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									사용자 게시판 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="/group/list">지역별 운동 모임</a>
									<a class="dropdown-item" href="#">식단</a>
									<a class="dropdown-item" href="#">나만의 루틴</a>
									<a class="dropdown-item" href="#">자유게시판</a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">나의 일정</a>
							</li>
						</ul>
						<ul class="navbar-nav ml-auto mt-10">
						<c:choose>
							<c:when test="${empty loginVo}">
								<li class="nav-item">
									<a class="nav-link btn-success" href="/member/loginForm">로그인</a>
								</li>
								<li class="nav-item">
									<a class="nav-link btn-primary" href="/member/joinForm"><i class="fa fa-plus-circle"></i> 회원가입</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="nav-item">
									<a class="nav-link btn-danger" href="/member/logout">로그아웃</a>
								</li>
								<li class="nav-item">
									<a class="nav-link btn-success" href="/member/myPage">마이페이지</a>
								</li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</section>