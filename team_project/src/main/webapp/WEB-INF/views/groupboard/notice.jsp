<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


${ noticeList }
<hr>
${ groupVo }
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-9">
				
				<h2>공지글 전체 보기</h2>
				
<%-- 				<c:if test="${ noticeList.gno == groupVo.gno }"> --%>
				<c:forEach items="${ noticeList }" var="groupBoardVo">
					<h3 style="background-color: yellowgreen;">
						<a href="/groupboard/groupRead?gbno=${ groupBoardVo.gbno }">[공지] ${ groupBoardVo.gb_title }</a>
					</h3>
				</c:forEach>
<%-- 				</c:if> --%>
				
				</div>
				<div class="col-md-3">
				
<!-- 				<aside class="column dotcom__aside bottom-12" style="position: fixed;"> -->
					<div class="list-group">
						 <a href="#" class="list-group-item list-group-item-action active">Home</a>
						<div class="list-group-item">
							그룹 명
						</div>
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								그룹 소개
							</h4>
							<p class="list-group-item-text">
								...
							</p>
						</div>
						<div class="list-group-item justify-content-between">
							<a href="/groupboard/groupMain/${ loginVo.gno }">그룹 메인으로</a>
						</div>
							<a href="/groupboard/groupInfo?gno=${ loginVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
								그룹 정보 보기
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
<!-- 					</aside> -->
				
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>