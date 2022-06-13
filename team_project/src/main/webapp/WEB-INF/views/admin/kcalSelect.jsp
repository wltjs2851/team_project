<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function(){
	
	var updateKcal_result = "${updateKcal_result}";
	if (updateKcal_result == "true"){
		alert ("운동 칼로리 사전 수정 성공");
	}
	
	// 수정 버튼
	$("#btnUpdateKcal").click(function(){
		$("*[readonly]").attr("readonly", false);
		$(this).fadeOut("slow");
		$("#fileKcal").fadeIn("slow");
		$("#btnUpdateRunKcal").fadeIn("slow");
	});
	
	// 삭제버튼
// 	$("#btnDeleteKcal").click(function(e){
// 		e.preventDefault();
// 		console.log("삭제버튼누름");
// 	});
	
	// 칼로리 계산기
	$("#time").on("input", function(){
		var kcal = "${kcalVo.kcal}";
		var time = "${kcalVo.k_time}";
		
		// 해당 운동에 대한 수식 변수 구하기
		var num = kcal / time ;
		console.log(num);
		
		$("#td_kcal").html($(this).val() * num);
	});
});
</script>
<style>
table {
	border-collapse: collapse;
	 border-top: 1px solid #444444;
/* 	 margin-left: auto; */
/*     margin-right: auto; */
	 width: 600px;
}
 th, td {
    border-bottom: 1px solid #444444;
     border-left: 1px solid #444444;
    padding: 10px;
  }

th:first-child, td:first-child {
    border-left: none;
  }
</style>
<%-- ${kcalVo } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/admin/updateKcal" method="post">
			<input type="hidden" name="kno" value="${kcalVo.kno}"/>
			<div>
			<h2>운동 칼로리 사전</h2>
				<article class="single-post">
					<h3>Donec id dolor in erat imperdiet.</h3>
					<ul class="list-inline">
						<li class="list-inline-item">by <a href="">Admin</a></li>
						<li class="list-inline-item">Nov 22, 2016</li>
					</ul>
					<img src="images/blog/post-4.jpg" alt="article-01">
					<table>
					<colgroup ></colgroup>
					<tbody>
						<tr>
							<th>운동종목</th>
							<td>${kcalVo.k_name}</td>
						</tr>
						<tr>
							<th>소요시간</th>
							<td><input type="number" id="time" value="${kcalVo.k_time}">분</td>
						</tr>
						<tr>
							<th>칼로리</th>
							<td><span id="td_kcal">${kcalVo.kcal}</span>kcal</td>
						</tr>
						<tr>
							<th>난이도</th>
							<td>${kcalVo.k_dgree}</td>
						</tr>
					</tbody>
				</table>
				</article>
			</div>
<!-- 				<div class="form-group"> -->
<!-- 					<label for="k_name"> -->
<!-- 						운동 종목 -->
<!-- 					</label> -->
<%-- 					<input type="text" class="form-control" id="k_name" name="k_name" value="${kcalVo.k_name}" readonly="readonly"/> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="k_time"> -->
<!-- 						소요시간  -->
<!-- 					</label> -->
<%-- 					<input type="text" class="form-control" id="k_time" name="k_time" value="${kcalVo.k_time}" readonly="readonly"/> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="kcal"> -->
<!-- 						칼로리  -->
<!-- 					</label> -->
<%-- 					<input type="text" class="form-control" id="kcal" name="kcal" value="${kcalVo.kcal}" readonly="readonly"/> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="k_dgree"> -->
<!-- 						난이도  -->
<!-- 					</label> -->
<%-- 					<input type="text" class="form-control" id="k_dgree" name="k_dgree" value="${kcalVo.k_dgree}" readonly="readonly"/> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="exampleInputFile"> -->
<!-- 						이미지 -->
<!-- 					</label> -->
<!-- 					<input type="file" class="form-control-file" id="fileKcal" style="display: none;"/> -->
<!-- 				</div> -->
<!-- 				<button type="button" class="btn btn-primary" id="btnUpdateKcal"> -->
<!-- 					수정 -->
<!-- 				</button> -->
<!-- 				<button type="submit" class="btn btn-success" -->
<!-- 						id="btnUpdateRunKcal" style="display: none;">수정완료</button> -->
<%-- 				<a class="btn btn-danger" href="/admin/deleteKcal?kno=${kcalVo.kno}"  --%>
<!-- 					id="btnDeleteKcal">삭제</a> -->
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>