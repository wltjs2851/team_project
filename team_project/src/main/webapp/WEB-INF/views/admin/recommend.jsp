<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function() {
		var listRecommend_result = "${listRecommend_result}";

		if (listRecommend_result == "true") {
			alert("추천운동 추가 완료");
		}
	});
</script>
${listRecommend}
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4"> -->
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail First"
							src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg"
							style="width: 214px; height: 119px;" />
<!-- 						<div class="card-block"> -->
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Cras justo odio, dapibus ac facilisis
								in, egestas eget quam. Donec id elit non mi porta gravida at
								eget metus. Nullam id dolor id nibh ultricies vehicula ut id
								elit.</p>
							<p>
								<a class="btn btn-primary" href="#">Action</a> <a class="btn"
									href="#">Action</a>
							</p>
<!-- 						</div> -->
					</div>
				</div>
<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="card"> -->
<!-- 						<img class="card-img-top" alt="Bootstrap Thumbnail Second" -->
<!-- 							src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" /> -->
<!-- 						<div class="card-block"> -->
<!-- 							<h5 class="card-title">Card title</h5> -->
<!-- 							<p class="card-text">Cras justo odio, dapibus ac facilisis -->
<!-- 								in, egestas eget quam. Donec id elit non mi porta gravida at -->
<!-- 								eget metus. Nullam id dolor id nibh ultricies vehicula ut id -->
<!-- 								elit.</p> -->
<!-- 							<p> -->
<!-- 								<a class="btn btn-primary" href="#">Action</a> <a class="btn" -->
<!-- 									href="#">Action</a> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="card"> -->
<!-- 						<img class="card-img-top" alt="Bootstrap Thumbnail Third" -->
<!-- 							src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" /> -->
<!-- 						<div class="card-block"> -->
<!-- 							<h5 class="card-title">Card title</h5> -->
<!-- 							<p class="card-text">Cras justo odio, dapibus ac facilisis -->
<!-- 								in, egestas eget quam. Donec id elit non mi porta gravida at -->
<!-- 								eget metus. Nullam id dolor id nibh ultricies vehicula ut id -->
<!-- 								elit.</p> -->
<!-- 							<p> -->
<!-- 								<a class="btn btn-primary" href="#">Action</a> <a class="btn" -->
<!-- 									href="#">Action</a> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
