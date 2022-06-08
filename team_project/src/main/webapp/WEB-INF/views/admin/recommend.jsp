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

/* span{ */
/* 		display: inline-block; */
/* 		width: 500px; */
/* 		text-overflow: ellipsis; */
		
/* 		line-height: 1.2; */
/* 		height: 3.6em; */
/* 		display: -webkit-box; */
/* 		-webkit-line-clamp: 3; */
/* 		-webkit-box-orient: vertical; */
/* } */
</style>
<script>
$(document).ready(function() {
	var insertRecommend_result = "${insertRecommend_result}";
	var deleteRecommend_result = "${deleteRecommend_result}";
	if (insertRecommend_result == "true") {
		alert("추천운동 추가 완료");
	}
	if (deleteRecommend_result == "true"){
		alert("추천운동 글 삭제");
	}
	
	// 글 조회
	$(".tr_list").click(function(){
		console.log("추천게시글 클릭");
		var reno = $(this).attr("data-reno");
		location.href = "/admin/selectByReno?reno=" + reno;
	});
});
</script>
<%-- ${listRecommend} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
			<h3 class="widget-header" style="display: inline-block;">추천 운동법</h3>
			<a class="btn btn-primary btn-sm" href="/admin/insertRecommendForm" 
				style="float: right; width: 110px; height:50px; padding: 1% 0">글 쓰기</a>
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
							<span>${fn:substring(ReVo.re_content, 0, 200)}...</span>
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

		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
