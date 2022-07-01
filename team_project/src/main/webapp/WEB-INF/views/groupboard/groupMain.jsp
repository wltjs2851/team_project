<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>

/* #sidebar { */
/*  	 width: 600px; */
/*      margin-top: 0; */
/*      position:fixed; */
/*      float: left; */
/*      top:7%; */
/*      right:30px; */
/*      bottom:60%; */
/*      padding:30px; */
/*      height: 100%; */
/*      cursor:default; */
/*      overflow-y:auto; */
/*      z-index: 100; */
/*  } */

#sidebar {
	width: 450px;
	margin-top: 0;
/* 	position:fixed; */
	float: left;
	top:13%;
	right:30px;
	bottom:60%;
	padding:30px;
	height: 100%;
	cursor:default;
	overflow-y:auto;
	z-index: 100;
}

#searchType {
	width: 100px;
}

</style>

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
	
	var frmPaging = $("#frmPaging");
	
	// 검색 버튼
	$("#btnSearch").click(function() {
		console.log("click");
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		console.log("searchType: ", searchType);
		console.log("keyword: ", keyword);
		
		frmPaging.find("input[name=searchType]").val(searchType);
		frmPaging.find("input[name=keyword]").val(keyword);
		frmPaging.find("input[name=page]").val(1);
		frmPaging.attr("action", "/groupboard/groupMain/${groupVo.gno}");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 그룹 탈퇴 버튼
	$("#leaveGroup").click(function() {
		console.log("click");
		$("#modal-734488").trigger("click");
	});
	
	// 모달, 탈퇴 버튼(일반 그룹원)
	$("#leave").click(function() {
// 		console.log("Click");
// 		var userid = "${loginVo.userid}";
// 		var gno = ${groupVo.gno};
// 		var url = "/group/deleteMember/" + userid + "/" + gno;
		
// 		$.get(url, function(rData) {
// 			console.log(rData);
// 			if(rData == "true") {
// 				alert("탈퇴 완료");
				$("#btnModalClose").trigger("click");
// 				$("#leaveGroup").fadeOut("slow");
// 			}
// 		});
	});
	
	// 그룹 채팅방 팝업
	$("#chatRoom").click(function(e){
		e.preventDefault();
		console.log("채팅방 입장");	
		var url = "/chat/chat";
		var option = "width = 800px, height=800px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "그룹 채팅방 입장", option);
	});
	
	// 신고 팝업
	$(".report").click(function(e) {
		e.preventDefault();
		console.log("신고 클릭");
		var userid = $(this).next().val();
		var gno = $("#gno").val();
		console.log(gno);
		var url = "/groupboard/reportForm/" + userid + "/" + gno;
		var option = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "신고 페이지", option);
	});

	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/groupboard/groupMain/${groupVo.gno}");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$(".readMore").click(function() {
		var gbno = $(this).attr("data-gbno");
		console.log(gbno);
		$(this).attr("href", "/groupboard/groupRead?gbno=" + gbno + "&gno=${groupVo.gno}&page=${pagingDto.page}&searchType=${param.searchType}" +
		"&keyword=${param.keyword}");
	});
	

	window.addEventListener("scroll", function() {
		console.log(window.scrollX, window.scrollY);
		if(window.scrollY > 4599) {
			console.log("4599 초과");
		}
	});
	
	$(window).scroll(function(){
		$("#sidebar").css("margin-top",Math.max(-85,0-$(this).scrollTop()));
	});
});
</script>

<%-- <%@ include file="/WEB-INF/views/groupboard/frmPaging.jsp" %> --%>

<form id="frmPaging">
	<input type="hidden" name="gbno" value="">
	<input type="hidden" name="gno" value="${ groupVo.gno }">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="searchType" value="${ pagingDto.searchType }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>

<%-- ${ groupVo } --%>
<!-- <hr> -->
<%-- ${ loginVo } --%>
<!-- <hr> -->
<%-- ${ groupJoinMember } --%>
<%-- ${ groupList } --%>
<%-- ${ pagingDto.totalPage } --%>
<%-- ${ param.page } --%>
<%-- ${ nickname } --%>

<!-- 그룹 탈퇴 누르면 뜨는 모달창 -->
<div class="row">
	<div class="col-md-12">
		 <a id="modal-734488" href="#modal-container-734488" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
		
		<div class="modal fade" id="modal-container-734488" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							그룹 탈퇴
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						정말로 탈퇴하시겠습니까?
					</div>
					<div class="modal-footer">
						 
<!-- 						<button id="leave" type="button" class="btn btn-primary"> -->
<!-- 							탈퇴 -->
<!-- 						</button>  -->
						<a href="/group/deleteMember/${ loginVo.userid }/${ groupVo.gno}" class="btn btn-primary">탈퇴</a>
						<button type="button" id="btnModalClose" class="btn btn-secondary" data-dismiss="modal">
							취소
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>


<div>
<!--================================
=            Page Title            =
=================================-->
<section class="page-title" style="background-color: #2D5082;">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2 text-center">
				<h3>${ groupVo.g_name }</h3>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>
<!--==================================
=            Blog Section            =
===================================-->

<section class="blog section">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">
			
			<c:forEach items="${ noticeList }" var="groupBoardVo" varStatus="status" begin="0" end="3">
				<h3 style="background-color: #2D5082;">
				<c:if test="${ groupBoardVo.gno == groupVo.gno }">
					<a style="color: #ffffff;" href="/groupboard/groupRead?gbno=${ groupBoardVo.gbno }&gno=${groupVo.gno}">[공지] ${ groupBoardVo.gb_title } (${ groupBoardVo.gb_regdate })</a>
				</c:if>
				</h3>
			</c:forEach>
				<a href="/groupboard/notice?gno=${ groupVo.gno }">전체 공지글 확인하기</a>
			
			<c:forEach items="${ groupList }" var="groupBoardVo">
				<!-- Article 01 -->
				<article>
					<!-- Post Image -->
					<div class="image">
						<c:choose>
							<c:when test="${ empty groupBoardVo.gb_pic }">
								<div></div>
							</c:when>
							<c:otherwise>
								<img alt="게시글 사진" style="max-width: 50%; height: auto;" src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}" width="100" height="100">
							</c:otherwise>
						</c:choose>
					</div>
					<!-- Post Title -->
					<h3>${ groupBoardVo.gb_title }</h3>
					<ul class="list-inline">
						<li class="list-inline-item">
						
							by ${ groupBoardVo.userid }
						
							<button class="btn dropdown-toggle" style="background-color: #ffffff; width: 20px; height:50px; padding: 1% 0" type="button" id="dropdownMenuButton" data-toggle="dropdown">
							
								<i class='fas fa-ellipsis-v'></i>
							
							</button>
							
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							
							<c:if test="${ groupVo.g_leader == loginVo.userid || loginVo.userid == 'admin01' || groupBoardVo.userid == loginVo.nickname }">
								 <a class="dropdown-item disabled" href="/groupboard/groupDelete?gbno=${ groupBoardVo.gbno }&gno=${ groupBoardVo.gno }">삭제</a>
<%-- 											 <a class="dropdown-item" href="/groupboard/groupUpdateForm?gbno=${ groupBoardVo.gbno }">수정</a> --%>
							</c:if>
							<c:if test="${ groupBoardVo.userid != loginVo.nickname }">
								 <a class="dropdown-item" href="/groupboard/memberInfo?userid=${ groupBoardVo.userid }">회원 정보 보기</a>
								 
								 <i id="report" class="report fa-solid fa-handcuffs"><a class="dropdows-item" href="#" 
								 	data-user="${ groupBoardVo.userid }">신고하기</a></i>
								 <input type="hidden" id="userid" name="userid" value="${ groupBoardVo.userid }">
								 <input type="hidden" id="gno" name="gno" value="${ groupBoardVo.gno }">
							</c:if>
							</div>
						</li>
						<li class="list-inline-item">${ groupBoardVo.gb_regdate }</li>
					</ul>
					<!-- Post Description -->
					<p>${ groupBoardVo.gb_content }</p>
					
					<div>
				   		<i class='far fa-comment-alt'></i> ${ groupBoardVo.gb_comment }
						<i class='far fa-heart'></i> ${ groupBoardVo.gb_like }
					</div>
					
					<!-- Read more button -->
					<a data-gbno="${ groupBoardVo.gbno }" style="width: 90px; height:40px; padding: 1% 0" href="/groupboard/groupRead?gbno=${ groupBoardVo.gbno }&gno=${ groupBoardVo.gno }" class="readMore btn btn-transparent">...더 보기</a>
				</article>
				
			</c:forEach>
			
			</div>
			
			
			
			
			
			<div
				<c:if test="${ groupList != null }">
			 style="position: fixed; top: 30px bottom: 270px;"
			 </c:if>
			 class="col-md-10 offset-md-1 col-lg-3 offset-lg-0" id="sidebar">
				<div class="sidebar">
				
				<aside class="main-sidebar sidebar-dark-primary elevation-4">
				<div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-transition os-host-scrollbar-horizontal-hidden">
				<div class="list-group" style="border-color: #2D5082;">
						 <a style="background-color: #2D5082; color: #ffffff;" href="#" class="list-group-item">Home</a>
						<div class="list-group-item">
<!-- 							<h4 class="list-group-item-heading"> -->
<!-- 								그룹 소개 -->
<!-- 							</h4> -->
							<p class="list-group-item-text">
								${ groupVo.g_intro }
<!-- 								...(달력을 넣어서 그룹 일정 표시하도록,,?) -->
							</p>
						</div>
						
						<div class="list-group-item justify-content-between">
						
							<div>
							<a href="/groupboard/groupMain/${ groupVo.gno }" class="btn-outline-primary" style="width: 50px; height:50px; padding: 1% 0">검색 초기화</a>
							<select id="searchType" class="form-control">
								<option value="t"
									<c:if test="${ pagingDto.searchType == 't' }">
										selected
									</c:if>
								>제목</option>
								<option value="c"
									<c:if test="${ pagingDto.searchType == 'c' }">
										selected
									</c:if>
								>내용</option>
								<option value="w"
									<c:if test="${ pagingDto.searchType == 'w' }">
										selected
									</c:if>
								>작성자</option>
							</select>
							</div>
							
							<div class="widget search p-0">
								<div class="input-group">
								    <input type="text" class="form-control" id="keyword" value="${searchDto.keyword}" placeholder="Search...">
								    <span style="background-color: #2D5082;" id="btnSearch" class="input-group-addon"><i class="fa fa-search"></i></span>
							    </div>
							</div>
							
<%-- 							<input type="text" id="keyword" value="${searchDto.keyword}"> --%>
<!-- 							<button id="btnSearch" style="width: 50px; height:30px; padding: 1% 0" class="btn btn-success">검색</button> -->
							
						</div>	
						
						
							
							<div class="list-group-item justify-content-between">
							<a style="background-color: #ffffff; color: #2D5082;" href="/chat/chat" id="chatRoom">
								그룹 채팅방
							</a>
							</div>
							<a style="background-color: #2D5082;" href="/group/groupInfo?gno=${ groupVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
								그룹 정보 보기
							</a>
					</div>
					<nav>
<%-- 						<c:if test="${ groupJoinVo.userid == loginVo.userid }"> --%>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="/groupboard/groupWriteForm?gno=${ groupVo.gno }">글쓰기</a>
								</li>
								<li class="breadcrumb-item">
									<!-- 차후 그룹의 일정을 확인할 수 있도록 -->
									<a href="/groupboard/activityInfo/${ groupVo.gno }">활동 정보</a>
								</li>
								<c:if test="${ loginVo.userid != groupVo.g_leader }">
									<li class="breadcrumb-item">
										<a href="#" id="leaveGroup">그룹 탈퇴</a>
									</li>
								</c:if>
							</ol>
<%-- 						</c:if> --%>
					</nav>
					
					</div>
					</aside>
				
				
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 페이징 -->
<div class="row" id="paging" style="margin: 50px">
	<div class="col-md-12">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.startPage - 1}">&laquo</a>
				</li>
			</c:if>
				<c:forEach begin="${pagingDto.startPage}" end="${pagingDto.endPage}" var="i">
				<li 
					<c:choose>	
						<c:when test="${i == param.page}">
							class="page-item active"
						</c:when>
						<c:otherwise>
							class="page-item"
						</c:otherwise>
					</c:choose>
				>
					<a href="${i}" class="page-link">${i}</a>
				</li>
			</c:forEach>
				
				<c:if test="${ pagingDto.endPage != pagingDto.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.endPage + 1}">&raquo;</a>
				</li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>

</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>