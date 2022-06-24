<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<script>

$(function() {
	// 그룹 탈퇴 버튼
	$("#leaveGroup").click(function() {
		console.log("click");
		$("#modal-734488").trigger("click");
	});
	
	// 모달, 탈퇴 버튼(일반 그룹원)
	$("#leave").click(function() {
		console.log("Click");
		var userid = "${loginVo.userid}";
		var gno = ${groupVo.gno};
		var url = "/group/deleteMember/" + userid + "/" + gno;
// 		var sData = {
// 				"gno" : gno
// 		}
		
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				alert("탈퇴 완료");
				$("#btnModalClose").trigger("click");
			}
		});
	});

	var frmPaging = $("#frmPaging");
	
	$(".noticeList").click(function() {
		var gbno = $(this).attr("data-gbno");
		console.log(gbno);
		frmPaging.find("input[name=gbno]").val(gbno);
		frmPaging.attr("action", "/groupboard/notice");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/groupboard/notice");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});

</script>

<%-- ${ noticeList } --%>
<%-- ${ groupVo } --%>
<%-- ${ groupVo.gno } --%>
<%-- ${ noticeList.gno } --%>
<%-- ${ loginVo } --%>
<%-- ${ pagingDto } --%>


<form id="frmPaging">
	<input type="hidden" name="gbno" value="">
	<input type="hidden" name="gno" value="${ groupVo.gno }">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
</form>


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
						 
						<button id="leave" type="button" class="btn btn-primary">
							탈퇴
						</button> 
						<button type="button" id="btnModalClose" class="btn btn-secondary" data-dismiss="modal">
							취소
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>

<!--================================
=            Page Title            =
=================================-->
<section style="background-color: #2D5082;" class="page-title">
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

<section class="blog section">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">				
				<h2>공지글 전체 보기</h2>
				
				<c:forEach items="${ noticeList }" var="groupBoardVo">
				<c:if test="${ groupBoardVo.gno == groupVo.gno }">
					<h3 style="background-color: #2D5082;">
						<a style="color: #ffffff; class="noticeList" data-gbno="${ groupBoardVo.gbno }" href="/groupboard/groupRead?gbno=${ groupBoardVo.gbno }&gno=${groupVo.gno}">[공지] ${ groupBoardVo.gb_title } (${ groupBoardVo.gb_regdate })</a>
					</h3>
				</c:if>
				</c:forEach>
				
				
				<!-- 페이징 -->
				<div class="row">
					<div class="col-md-12">
						<nav>
							<ul class="pagination justify-content-center">
							<c:if test="${pagingDto.startPage != 1}">
								<li class="page-item">
									<a class="page-link" 
										href="${pagingDto.startPage - 1}">&laquo;</a>
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
							<c:if test="${pagingDto.endPage != pagingDto.totalPage}">	
								<li class="page-item">
									<a class="page-link" 
									href="${pagingDto.endPage + 1}">&raquo;</a>
								</li>
							</c:if>
							</ul>
						</nav>
					</div>
				</div>
				
				
				</div>
				<div class="col-md-3">
				
<!-- 				<aside class="column dotcom__aside bottom-12" style="position: fixed;"> -->
					<div class="list-group">
						 <a style="background-color: #2D5082;" href="#" class="list-group-item list-group-item-action active">Home</a>
						<div class="list-group-item">
							<h3>${ groupVo.g_name }</h3>
						</div>
						<div class="list-group-item">
							<p class="list-group-item-text">
								${ groupVo.g_intro }
							</p>
						</div>
						<div class="list-group-item justify-content-between">
							<a href="/groupboard/groupMain/${ groupVo.gno }">그룹 메인으로</a>
						</div>
							<a style="background-color: #2D5082;" href="/group/groupInfo?gno=${ groupVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
								그룹 정보 보기
							</a>
					</div>
					<nav>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="/groupboard/groupWriteForm?gno=${ groupVo.gno }">글쓰기</a>
							</li>
							<li class="breadcrumb-item">
								<a href="/groupboard/activityInfo/${ groupVo.gno }">활동 정보</a>
							</li>
							
							<c:if test="${ groupVo.g_leader == loginVo.userid }">
								<li id="leaveModal" class="breadcrumb-item" style="display:none;">
									<a href="#" id="leaveGroup">그룹 탈퇴</a>
								</li>
							</c:if>
						</ol>
					</nav>
				
				</div>
			</div>
		</div>
		
	</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>