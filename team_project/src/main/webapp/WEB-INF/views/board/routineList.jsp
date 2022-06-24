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
		frmPaging.attr("action", "/routine/routineList");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/routine/routineList");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	$(".content").click(function() {
		var uno = $(this).attr("data-uno");
		$(this).attr("href", "/routine/routineContent?uno=" + uno + "&page=${pagingDto.page}&searchType=${param.searchType}" +
				"&keyword=${param.keyword}");
	});
	
	$(".btnBoardReport").click(function() {
		var uno = $(this).parent().parent().parent().find(".content").attr("data-uno");
		var sender = "${loginVo.userid}";
		var receiver = $(this).attr("data-user");
		var url = "/reportBoard/reportBoardPop?uno=" + uno + "&sender=" + sender + "&receiver=" + receiver;
		var option = "width = 350px, height=400px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"상품 검색",option);
	
		console.log(sender);
	});
	
	console.log("${ pagingDto.page }");
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
					<c:forEach items="${ routineList }" var="routineVo">
					<tr>
						<td>${ routineVo.uno }</td>
						<td><a class="content" data-uno="${ routineVo.uno }" href="#">${ routineVo.ur_title }</a></td>
						<td>
							<c:choose>
								<c:when test="${loginVo.userid == routineVo.userid}">
									${routineVo.userid}
								</c:when>
								<c:otherwise>
									<button class='btn dropdown-toggle' type='button' id='dropdownMenuButton' data-toggle='dropdown'
										style='background-color: #ffffff; width: 20px; height:36px; padding: 1% 0;'>
										${ routineVo.userid }<i class='fas fa-ellipsis-v' style='margin-left:10px'></i></button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<button class="dropdown-item btnBoardReport" type='button' 
										data-user='${ routineVo.userid }'>신고하기</button>
										<button class="dropdown-item" type='button'>회원정보보기</button>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
						<td>${ routineVo.ur_viewcnt }</td>
						<td>${ routineVo.ur_regdate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<a class="btn btn-primary" href="/routine/addRoutineForm">글쓰기</a>
				<div class="row" style="float: right;">
					<div style='display: inline-block;'>
						<select id="searchType" class="form-control" 
						style="height:50px;">
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
							<option value="tc"
								<c:if test="${ pagingDto.searchType == 'tc' }">
									selected
								</c:if>
							>제목 + 내용</option>
							<option value="tcw"
								<c:if test="${ pagingDto.searchType == 'tcw' }">
									selected
								</c:if>
							>제목 + 내용 + 작성자</option>
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
						 style="margin-left: 15px; width: 80px; height:50px; padding: 1% 0; line-height: 40px;">검색</a>
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