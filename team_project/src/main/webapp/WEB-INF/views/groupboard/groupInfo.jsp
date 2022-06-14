<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


${ groupVo }

<script>
$(function() {
	$(".tab-content > div").hide();
	$(".nav-tabs a").click(function() {
		$(".tab-content > div").hide().filter(this.hash).fadeIn();
		$(".nav-tabs a").removeClass("active");
		$(this).addClass("active");
		return false;
	}).filter(":eq(0)").click();
	
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-9">
					<h2>
						그룹 이름: ${ groupVo.g_name }
					</h2>
					
					<h3>
						그룹 소개
					</h3>
					<p>
						${ groupVo.g_intro }
					</p>
					
					<div class="tabbable" id="tabs-367776">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active show" href="#tab1" data-toggle="tab">그룹 정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab2" data-toggle="tab">그룹원</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="active" id="tab1">
								<p>
									위치: ${ groupVo.g_location }<br>
									운동: ${ groupVo.excercise_type }<br>
									최대 인원수: ${ groupVo.g_attend }<br>
									개설 날짜: ${ groupVo.g_regdate }<br>
									그룹 정보(개설 날짜, 위치, 모임 목적, 최대 인원수)
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>
									그룹원 목록(그룹장일 경우 강퇴 버튼 보이게)
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
				
				
					<aside class="column dotcom__aside bottom-12">
						<div class="list-group">
							 <a href="#" class="list-group-item list-group-item-action active">Home</a>
							<div class="list-group-item">
								<h2>${ groupVo.g_name }</h2>
							</div>
							<div class="list-group-item">
								<h4 class="list-group-item-heading">
									그룹 소개
								</h4>
								<p class="list-group-item-text">
									${ groupVo.g_intro }
									...
								</p>
							</div>
							<div class="list-group-item justify-content-between">
								<c:choose>
									<c:when test="${ groupVo.g_leader == loginVo.userid }">
										<a href="/groupboard/updateGroupInfoForm">그룹 정보 수정(그룹장만)</a>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
							</div>
								<a href="/groupboard/groupMain/${ loginVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
									그룹 메인으로
								</a>
						</div>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="/groupboard/groupWriteForm">글쓰기</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">활동 정보</a>
								</li>
								<li class="breadcrumb-item">
									<a href="">그룹 탈퇴</a>
								</li>
							</ol>
						</nav>
						<div class="row">
							<div>
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">
											Card title
										</h5>
										<p class="card-text">
											그룹원
										</p>
										<p>
											<a class="btn btn-primary" href="#">쪽지보내기</a>
										</p> 
									</div>
								</div>
							</div>
						</div>
						</aside>
				
				
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>