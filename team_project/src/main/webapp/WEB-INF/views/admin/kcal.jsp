<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<!-- <h1>관리자게시판-칼로리사전</h1> -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<!-- 운동 칼로리 검색 -->
			<div class="row">
				<div class="col-md-12">
					<input type="text" id="keyword" placeholder="검색어 입력">
					<button type="button" id="btnCalSearch"
						class="btn btn-xs btn-outline-success">검색</button>
				</div>
			</div>
			<!-- 운동 칼로리 목록 -->
			<!-- 시영씨 파이팅♥ -->
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>운동</th>
								<th>강도</th>
								<th>소요시간</th>
								<th>칼로리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>수영</td>
								<td>보통</td>
								<td>100kcal</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
