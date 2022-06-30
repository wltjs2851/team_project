<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#searchKcal {
	position: absolute;
	width: 25px;
	top: 5px;
	right: 45px;
	margin: 0;
}

tr.tr_list{
	cursor: pointer;
}

tr.tr_list:hover{
	background-color: aliceblue;
}
</style>

<script>
	$(function() {
		// 페이지 이동
		var frmPaging = $("#frmPaging");
		$("a.page-link").click(function(e) {
			e.preventDefault();
			console.log("클릭");
			var page = $(this).attr("href");
			console.log(page);
			frmPaging.find("input[name=page]").val(page);
			frmPaging.attr("action", "/admin/group");
			frmPaging.attr("method", "get");
			frmPaging.submit();
		});

		// 검색하기
		$("#searchKcal").on("click", function(e) {
			e.preventDefault();
			console.log("검색하기 버튼");
			var keyword = $("#keyword").val();
			console.log(keyword);
			frmPaging.find("input[name=keyword]").val(keyword);
			frmPaging.find("input[name=page]").val(1);
			frmPaging.attr("action", "/admin/group");
			frmPaging.attr("method", "get");
			frmPaging.submit();
		});
	});
</script>
<%-- ${lastestMember } --%>
${pagingDto }
<!-- 페이지, 검색 값 -->
<form id="frmPaging">
	<input
		type="hidden" name="page" value="${ pagingDto.page }"> <input
		type="hidden" name="perPage" value="${ pagingDto.perPage }"> <input
		type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>
<h1>그룹 전체 목록</h1>
<%-- ${memberList } --%>

<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item"><a class="nav-link" href="/admin/main">메뉴</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#"
				style="background-color: #fd9a9a;">회원</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/admin/reportBoard"> 신고내역</a></li>
		</ul>
	</div>
	<div class="col-md-8">
		<div class="search"
			style="display: inline-block; width: 1145px; margin-bottom: 15px;">
			<div style="display: inline-block; width: 100%;" class="col-md-11">
				<input class="form-control" type="text" placeholder="그룹 검색"
					id="keyword" style=""
					<c:if test="${ pagingDto.keyword != null }">
					value="${ pagingDto.keyword }"
				</c:if>>
			</div>
			<div style="display: inline-block;">
				<input type="image" src="/resources/images/magnifier.png"
					id="searchKcal" style="width: 40px; float: right;"><br>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr align="center">
					<th>그룹 번호</th>
					<th>그룹명</th>
					<th>운동종목</th>
					<th>그룹인원</th>
					<th>그룹장</th>
					<th>지역</th>
					<th>개설일</th>
				</tr>
			</thead>
			<tbody style="text-align: center;">
				<c:forEach items="${groupList }" var="groupVo">
					<tr onclick="location.href='/groupboard/groupMain/${groupVo.gno }'"  class="tr_list">
						<td>${groupVo.gno }</td>
						<td>${groupVo.g_name }</td>
						<td>${groupVo.excercise_type }</td>
						<td>${groupVo.g_present }/ ${groupVo.g_attend }</td>
						<td>${groupVo.g_leader }</td>
						<td><c:choose>
								<c:when test="${groupVo.dno == '1' }">서울특별시</c:when>
								<c:when test="${groupVo.dno == '2' }">인천광역시</c:when>
								<c:when test="${groupVo.dno == '3' }">대전광역시</c:when>
								<c:when test="${groupVo.dno == '4' }">대구광역시</c:when>
								<c:when test="${groupVo.dno == '5' }">울산광역시</c:when>
								<c:when test="${groupVo.dno == '6' }">부산광역시</c:when>
								<c:when test="${groupVo.dno == '7' }">광주광역시</c:when>
								<c:when test="${groupVo.dno == '8' }">세종특별자치시</c:when>
								<c:when test="${groupVo.dno == '9' }">경기도</c:when>
								<c:when test="${groupVo.dno == '10' }">강원도</c:when>
								<c:when test="${groupVo.dno == '11' }">충청북도</c:when>
								<c:when test="${groupVo.dno == '12' }">충청남도</c:when>
								<c:when test="${groupVo.dno == '13' }">전라북도</c:when>
								<c:when test="${groupVo.dno == '14' }">전라남도</c:when>
								<c:when test="${groupVo.dno == '15' }">경상북도</c:when>
								<c:when test="${groupVo.dno == '16' }">경상남도</c:when>
								<c:when test="${groupVo.dno == '17' }">제주도</c:when>
							</c:choose></td>
						<td>${groupVo.g_regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${pagingDto.startPage != 1}">
						<li class="page-item"><a class="page-link"
							href="${pagingDto.startPage - 1}">이전</a></li>
					</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}"
						end="${pagingDto.endPage}">
						<li
							<c:choose>
								<c:when test="${v == param.page}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>>
							<a class="page-link" href="${v}">${v}</a>
						</li>
					</c:forEach>
					<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
						<li class="page-item"><a class="page-link"
							href="${pagingDto.endPage + 1}">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<div class="col-md-2"></div>

</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>