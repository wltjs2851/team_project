<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function() {
		var insertRecommend_result = "${insertRecommend_result}";

		if (insertRecommend_result == "true") {
			alert("추천운동 추가 완료");
		}
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
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>Image</th> -->
<!-- 						<th>Product Title</th> -->
<!-- 						<th class="text-center">Category</th> -->
<!-- 						<th class="text-center">Action</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
				<tbody>
				<c:forEach items="${listRecommend }" var="ReVo">
					<tr>
						<td class="product-thumb">
							<img width="80px" height="auto"
							src="/resources/images/exercise.png" alt="운동이미지">
						</td>
						<td class="product-details">
							<h3 class="title">${ReVo.re_title}</h3> 
							<span>${ReVo.re_content}</span>
						</td>
						<td class="action" data-title="Action">
							<div class="">
								<ul class="list-inline justify-content-center">
									<li class="list-inline-item">
										<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view"
											href=""> 
											<i class="fa fa-eye"></i> </a>
									</li>
									<li class="list-inline-item">
										<a class="edit" href="">
											<i class="fa fa-pencil"></i>
										</a>
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
