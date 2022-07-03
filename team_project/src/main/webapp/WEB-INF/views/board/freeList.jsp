<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function() {
	var frmPaging = $("#frmPaging");
	
	$("#btnSearch").click(function() {
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		console.log("searchType: ", searchType);
		frmPaging.find("input[name=searchType]").val(searchType);
		frmPaging.find("input[name=keyword]").val(keyword);
		frmPaging.find("input[name=page]").val(1);
		frmPaging.attr("action", "/free/freeList");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/free/freeList");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$(".content").click(function() {
		var fno = $(this).attr("data-fno");
		$(this).attr("href", "/free/freeContent?fno=" + fno + "&page=${pagingDto.page}&searchType=${param.searchType}" +
				"&keyword=${param.keyword}");
	});
	
	$(".btnBoardReport").click(function() {
		var fno = $(this).parent().parent().parent().find(".content").attr("data-fno");
		var sender = "${loginVo.nickname}";
		var receiver = $(this).attr("data-user");
		var url = "/reportBoard/reportBoardPop?fno=" + fno + "&sender=" + sender + "&receiver=" + receiver;
		var option = "width = 350px, height=400px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"신고",option);
	
		console.log(sender);
	});
});
</script>

<form id="frmPaging">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="searchType" value="${ pagingDto.searchType }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ freeList }" var="freeVo">
					<tr>
						<td>${ freeVo.fno }</td>
						<td><a class="content" data-fno="${ freeVo.fno }" href="#">
							[${ freeVo.fname }] ${ freeVo.f_title }</a></td>
						<td>
							<c:choose>
								<c:when test="${loginVo.nickname == freeVo.nickname}">
									${freeVo.nickname}
								</c:when>
								<c:otherwise>
									<button class='btn dropdown-toggle' type='button' id='dropdownMenuButton' data-toggle='dropdown'
										style='background-color: #ffffff; width: 20px; height:36px; padding: 1% 0;'>
										${ freeVo.nickname }<i class='fas fa-ellipsis-v' style='margin-left:10px'></i></button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<button class="dropdown-item btnBoardReport" type='button' 
										data-user='${ freeVo.nickname }'>신고하기</button>
										<a class="dropdown-item btnMemberInfo" href='/member/memberInfo?nickname=${ freeVo.nickname }'>
										회원정보보기</a>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
						<td>${ freeVo.f_viewcnt }</td>
						<td>${ freeVo.f_regdate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<a class="btn btn-primary" href="/free/addFreeForm" 
					style='width: 80px; height:50px; padding: 1% 0'>글쓰기</a>
				<div class="row" style="float: right;">
					<div style='display: inline-block;'>
						<select id="searchType" class="form-control" 
						style="height:50px;">
							<option value="0"
								<c:if test="${ pagingDto.searchType == '0' }">
									selected
								</c:if> 
							>전체</option>
							<option value="1"
								<c:if test="${ pagingDto.searchType == '1' }">
									selected
								</c:if>
							>잡담</option>
							<option value="2"
								<c:if test="${ pagingDto.searchType == '2' }">
									selected
								</c:if>
							>고민</option>
							<option value="3"
								<c:if test="${ pagingDto.searchType == '3' }">
									selected
								</c:if>
							>질문</option>
						</select>
					</div>
					<div style='display: inline-block;'>
					<input id="keyword" type="text"  class="form-control" style='width: 100%; margin-left: 10px;'
						<c:if test="${ pagingDto.keyword != null }">
							value="${ pagingDto.keyword }"
						</c:if>
					>
					</div>
					<div style='display: inline-block;'>
						<a class="btn btn-sm btn-success" id="btnSearch"
						 style="margin-left: 15px; width: 80px; height:50px; padding: 4% 0; line-height: 40px;">검색</a>
					</div>
				</div>
				<br><br>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="pagination justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${ pagingDto.startPage != 1 }">
							<li class="page-item">
							<a class="page-link" href="${ pagingDto.startPage - 1 }">&laquo;</a>
							</li>
						</c:if>
					<c:forEach begin="${ pagingDto.startPage }" end="${ pagingDto.endPage }" var="i">
					<li 
						<c:choose>
							<c:when test="${i == pagingDto.page }">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>
					>
						<a href="${ i }" class="page-link">${i}</a>
					</li>
					</c:forEach>
					<c:if test= "${ pagingDto.endPage != pagingDto.totalPage }">
						<li class="page-item">
							<a class="page-link" href="${ pagingDto.endPage + 1 }">&raquo;</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>
			<br><br>
			<br><br>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>