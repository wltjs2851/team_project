<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
tr.tr_list{
	cursor: pointer;
}

tr.tr_list:hover{
	background-color: #CEECF5;
}

p > br {
	display: none;
}
</style>
<script>
$(document).ready(function() {
// 	$("p:has(img)").css("display", "none");
// 	$("p:has(iframe)").css("display", "none");
	$("iframe").parents("p").remove();
	$("img").parents("p").remove();
// 	$("p:has(iframe)").removeAttr("br");
	
	var insertRecommend_result = "${insertRecommend_result}";
	var deleteRecommend_result = "${deleteRecommend_result}";
	var notAdmin = "${notAdmin}";
	if (insertRecommend_result == "true") {
		alert("추천운동 추가 완료");
	}
	if (deleteRecommend_result == "true"){
		alert("추천운동 글 삭제");
	}
	if (notAdmin == "false") {
		alert("관리자만 등록할수이따")
	}
	
	// 글 조회
	$(".tr_list").click(function(){
		console.log("추천게시글 클릭");
		var reno = $(this).attr("data-reno");
		location.href = "/recommend/selectByReno?reno=" + reno;
	});
	
	// 목록에서 본문 말줄임
	$(".revo_re_content").each(function() {
		var t = $(this).text();
		var t2 = t.substring(0, 100);
		$(this).text(t2 + "...");
	});     
	
	// 페이지 이동
	var frmPaging = $("#frmPaging");
	$("a.page-link").click(function(e) {
		e.preventDefault();
		console.log("클릭");
		var page = $(this).attr("href");
		console.log(page);
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/recommend/listRecommend");
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
		frmPaging.attr("action", "/recommend/listRecommend");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});
</script>
<form id="frmPaging">
	<input
		type="hidden" name="page" value="${ pagingDto.page }"> <input
		type="hidden" name="perPage" value="${ pagingDto.perPage }"> <input
		type="hidden" name="keyword" value="${ pagingDto.keyword }">
</form>
<%-- ${listRecommend} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
			<h3 class="widget-header" style="display: inline-block;"><a href="/recommend/listRecommend">추천 운동법</a></h3>
			<c:if test="${loginVo.userid == 'admin01'}">
			<a class="btn btn-primary btn-sm" href="/recommend/insertRecommendForm" 
				style="float: right; width: 110px; height:50px; padding: 1% 0">글 쓰기</a>
			</c:if>
			</div>
			<table class="table table-responsive product-dashboard-table">
				<tbody>
				<c:forEach items="${listRecommend }" var="ReVo">
					<tr class="tr_list" data-reno="${ReVo.reno}">
							<td class="td_list">
							<c:choose>
								<c:when test="${empty ReVo.re_pic}">
<!-- 									이미지 등록 안했을 때 기본 이미지 -->
									<img width="100px" height="auto" style="align-items: center;"
									src="/resources/images/exercise.png" alt="운동이미지">
								</c:when>
								<c:otherwise>
									<img width="200px" height="auto"
									src="/member/displayImage?filename=${ReVo.re_pic}" alt="운동이미지">
								</c:otherwise>
							</c:choose>
							</td>
						<td class="product-details">
							<h3 class="title">${ReVo.re_title}</h3> 
							<span class="revo_re_content">${ReVo.re_content}</span><br>
							
						</td>
						<td class="action" data-title="Action">
							<div class="">
								<ul class="list-inline justify-content-center">
									<li class="list-inline-item">
											<a><i class="fa fa-eye">${ReVo.re_viewcnt}</i></a>
									</li>
									<li class="list-inline-item">
										<a><i class="fa fa-heart" style="color: red;"></i>${ReVo.re_like}</a>
									</li>
									<li class="list-inline-item">
										<a class="delete" href="">
											<i class="fa fa-trash"></i>
										</a>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
<!-- 	페이징		 -->
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
<!-- 	검색 -->
		<div class="search" style="float:right;">
			<div>
				<input type="text" placeholder="검색어를 입력하시오"
					id="keyword" style="margin-right: 8px;"
					<c:if test="${ pagingDto.keyword != null }">
					value="${ pagingDto.keyword }"
				</c:if>>
				<input type="image" src="/resources/images/magnifier.png"
					id="searchKcal" style="width: 20px; float: right;">
			</div>
		</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
