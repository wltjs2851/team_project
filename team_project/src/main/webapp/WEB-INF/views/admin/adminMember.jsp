<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	$(".selectId").click(function(e){
		e.preventDefault();
		console.log("회원상세조회");	
		var userid = $(this).attr("data-id");
		console.log("userid:", userid);
		var url = "/admin/info?userid=" + userid;
		var option = "width = 800px, height=800px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "그룹 채팅방 입장", option);
	});
	
	// 페이지 이동
	var frmPaging = $("#frmPaging");
	$("a.page-link").click(function(e) {
		e.preventDefault();
		console.log("클릭");
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/admin/memberList");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 검색하기
	$("#searchKcal").on("click", function(e){
		e.preventDefault();
		console.log("검색하기 버튼");
		var keyword = $("#keyword").val();
		console.log(keyword);
		frmPaging.find("input[name=keyword]").val(keyword);
		frmPaging.find("input[name=page]").val(1);
		frmPaging.attr("action", "/admin/memberList");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});
</script>
<%-- ${lastestMember } --%>
<!-- 페이지, 검색 값 -->
<form id="frmPaging">
	<input type="hidden" name="userid" value="">
	<input type="hidden" name="page" value="${ pagingDto.page }">
	<input type="hidden" name="perPage" value="${ pagingDto.perPage }">
	<input type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>
<h1>회원전체목록</h1>
<%-- ${memberList } --%>
${pagingDto }

<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item"><a class="nav-link" href="/admin/main">메뉴</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="modifyForm"
				style="background-color: #fd9a9a;">회원</a></li>
			<li class="nav-item"><a class="nav-link" href="myPoint">신고
					내역</a></li>
			<li class="nav-item"><a class="nav-link" href="#">나의 그룹</a></li>
			<li class="nav-item"><a class="nav-link" href="#">나의 일정</a></li>
			<li class="nav-item"><a class="nav-link" href="deleteForm">회원탈퇴</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="chatRoom"
				style="cursor: pointer;">채팅방</a></li>
		</ul>
	</div>
	<div class="col-md-8">
	<div class="search">
				<input class="form-control" type="text" placeholder="회원 정보 검색"
					id="keyword"
					<c:if test="${ pagingDto.keyword != null }">
						value="${ pagingDto.keyword }"
					</c:if>
				>
				<input type="image" src="/resources/images/magnifier.png" id="searchKcal"><br>
	</div>
		<table class="table">
			<thead>
				<tr align="center">
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>나이(성별)</th>
					<th>이메일</th>
					<th>주소</th>
					<th>가입일</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${memberList }" var="memberVo">
				<tr>
					<td><a class="selectId" data-id="${memberVo.userid }">${memberVo.userid }</a></td>
					<td>${memberVo.username }</td>
					<td>${memberVo.nickname }</td>
					<td>${memberVo.age }세(
					<c:choose>
						<c:when test="${memberVo.gender == 'F' }"><i class="fa-solid fa-neuter"></i></c:when>
						<c:otherwise><i class="fa-solid fa-mars"></i></c:otherwise>
					</c:choose>
					)</td>
					<td>${memberVo.email }</td>
					<td>${memberVo.address }</td>
					<td>${memberVo.regdate }</td>
					<td></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div>
		<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
						<li 
						<c:choose>
								<c:when test="${v == param.page}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>
						>
							<a class="page-link" href="${v}">${v}</a>
						</li>
					</c:forEach>
						<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
							</li>
						</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<div class="col-md-2"></div>
	
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>