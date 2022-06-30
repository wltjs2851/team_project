<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<head>


<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/resources/static/js/HuskyEZCreator.js" charset="utf-8"></script>

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
  
  <script>
  $(function() {
	 $("#warning").click(function() {
		var userid = "${loginVo.userid}";
		var url = "/reportBoard/warningMessageList";
		$("#warningList").empty();
		$.get(url, {"userid" : userid}, function(rData) {
			$("#count").text("경고 " + rData.warningCount + "회 입니다.");
			console.log(rData.warningList);
			$.each(rData.warningList, function() {
				console.log(this.message);
				$("#warningList").append("<div class='dropdown-divider'></div><a href='/reportBoard/warningList?userid=${loginVo.userid}' class='dropdown-item warningList' style='padding-left: 0;'>" 
					+ this.message + "</a>");
			});
		});
	 });
  });
  </script>

</head>
<body class="body-wrapper">


<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation col-md-12">
					<a class="navbar-brand" href="/">
						<img src="/resources/images/home/homelogo.png" alt="" id="logo">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
							<li class="nav-item active">
								<a class="nav-link" href="/">메인</a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									운동 꿀팁 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="/kcal/listKcal">운동 칼로리</a>
									<a class="dropdown-item" href="/recommend/listRecommend ">추천 운동</a>
								</div>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="/group/list" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									커뮤니티 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="/group/groupList">지역별 운동 모임</a>
									<a class="dropdown-item" href="/recipe/recipeList">식단</a>
									<a class="dropdown-item" href="/routine/routineList">나만의 루틴</a>
									<a class="dropdown-item" href="/free/freeList">자유게시판</a>
								</div>
							</li>
							<c:if test="${loginVo.userid != 'admin01'}">
							<li class="nav-item">
								<a class="nav-link" href="/calendar/cal">나의 일정</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/group/myGroupList">그룹</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link" data-toggle="dropdown" href="#"> 
									<i class="far fa-bell" id="warning"></i> 
									<span class="badge badge-warning navbar-badge"></span>
								</a>
								<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right wargningDrop" style="width: 500px;">
									<span class="dropdown-item dropdown-header" id="count"></span>
									<div class="dropdown-item" id="warningList" style="padding: 0;"></div>
								</div></li>
								</c:if>
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
								<c:choose>
									<c:when test="${loginVo.userid == 'admin01'}">
										<li class="nav-item">
											<a class="nav-link btn-success" href="/admin/main">관리자모드</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="nav-item">
											<a class="nav-link btn-success" href="/member/myPage">마이페이지</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</section>