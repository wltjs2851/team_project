<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function() {
	var create_result = "${create_result}";
	if(create_result == "true") {
		alert("작성 완료");
	}
	
	var update_result = "${update_result}";
	if(update_result == "true") {
		alert("수정 완료");
	}
	
	var delete_result = "${delete_result}";
	if(delete_result == "true") {
		alert("삭제 완료");
	}
});
</script>

<%-- ${ groupList } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-9">
					<c:forEach items="${ groupList }" var="groupBoardVo">
				
						<h2 style="background-color: aliceblue">${groupBoardVo.gbno}. 제목: ${ groupBoardVo.gb_title }		
										<button class="btn dropdown-toggle" style="background-color: aliceblue" type="button" id="dropdownMenuButton" data-toggle="dropdown">
											...
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											 <a class="dropdown-item disabled" href="/groupboard/groupDelete?gbno=${ groupBoardVo.gbno }">삭제</a>
											 <a class="dropdown-item" href="/groupboard/groupUpdateForm?gbno=${ groupBoardVo.gbno }">수정</a>
											 <a class="dropdown-item" href="#">회원 정보 보기</a>
										</div></h2>
						<p>작성자: ${groupBoardVo.userid}, 작성일: ${ groupBoardVo.gb_regdate }</p>
						<p>${ groupBoardVo.gb_content }</p>
						
						<div>
							<c:choose>
								<c:when test="${ empty groupBoardVo.gb_pic }">
									<div></div>
								</c:when>
								<c:otherwise>
									<img alt="게시글 사진" src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}" width="100" height="100">
								</c:otherwise>
							</c:choose>
						</div>
						
						<a href="/groupboard/groupRead?gbno=${ groupBoardVo.gbno }">...더 보기</a>
						<p>
<%-- 							<a href="/groupboard/groupDelete?gbno=${ groupBoardVo.gbno }">삭제</a> --%>
<%-- 							<a href="/groupboard/groupUpdateForm?gbno=${ groupBoardVo.gbno }">수정</a> --%>
						</p>
				
					</c:forEach>
				</div>
				
				
				<div class="col-md-3">
				
				<aside class="column dotcom__aside bottom-12" style="position: fixed;">
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
							<a href="/groupboard/groupInfo">그룹 정보 보기</a>
						</div>
							<a href="/groupboard/groupMain" class="list-group-item list-group-item-action active justify-content-between">
								메인으로
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
<%-- 										<c:if test="그룹장일 경우"> --%>
											<a class="btn" href="#">내쫓기</a>
<%-- 										</c:if> --%>
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