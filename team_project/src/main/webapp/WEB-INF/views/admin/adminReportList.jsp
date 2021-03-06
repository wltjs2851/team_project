<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- ${lastestMember } --%>
<script>
$(function(){
	$(".reportUpdate").click(function(e){
		e.preventDefault();
		console.log("신고내역조회");	
		var rbno = $(this).attr("data-rbno");
		console.log("신고번호:", rbno);
		var url = "/admin/reportUpdateForm?rbno=" + rbno;
		var option = "width = 500px, height=300px, scrollbars=yes";
		window.open(url, "신고내역 접수", option);
	});
});
</script>
<h1>신고내역</h1>
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item"><a class="nav-link" href="/admin/main">메뉴</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/admin/memberList"
				>회원</a></li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/group">그룹 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/reportBoard" style="background-color: #fd9a9a;">신고 내역</a>
			</li>
		</ul>
	</div>
	<div class="col-md-8">
		<div class="card" style="margin-bottom: 20px;">
			<div class="card-header border-0">
				<div class="d-flex justify-content-between">
					<h3 class="card-title">게시판 신고 목록</h3>
				</div>
			</div>
			<div class="card-body">
				<div class="d-flex">
<!-- 					<div class="row"> -->
						<div class="col-md-12">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>게시판</th>
										<th>신고사유</th>
										<th>신고한 회원</th>
										<th>신고받은 회원</th>
										<th>신고 날짜</th>
										<th>상태</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${reportBoardVo }" var="report">
									<tr>
										<td>${report.rbno }</td>
										<td>
											<c:choose>
												<c:when test="${report.rno > 0}">식단게시판</c:when>
												<c:when test="${report.uno > 0}">루틴게시판</c:when>
												<c:when test="${report.fno > 0}">자유게시판</c:when>
												<c:when test="${report.fcno > 0}">자유게시판 댓글</c:when>
												<c:when test="${report.rcno > 0}">식단게시판 댓글</c:when>
												<c:when test="${report.recno > 0}">추천운동게시판 댓글</c:when>
												<c:when test="${report.urcno > 0}">루틴게시판 댓글</c:when>
											</c:choose>
										</td>
										<td>${report.rep_cause }</td>
										<td>${report.sender }</td>
										<td>${report.receiver }</td>
										<td>${report.rep_regdate }</td>
										<td>
											<c:choose>
												<c:when test="${report.rep_state == '0'}">처리 전</c:when>
												<c:otherwise>처리 완료 </c:otherwise>
											</c:choose>
										</td>
										<td>
<%-- 											<a href="/admin/reportUpdateForm?rbno=${report.rbno }" class="btn btn-sm btn-warning">신고 접수</a> --%>
											<c:choose>
												<c:when test="${report.rep_state == '1'}">
													<a><button class="btn btn-sm btn-secondary reportUpdate" data-rbno="${report.rbno }" 
														style="width: 110px; height: 30px; padding: 1% 0"
													disabled="disabled">신고 접수</button></a>
												</c:when>
												<c:otherwise>
													<a><button class="btn btn-sm btn-danger reportUpdate" 
														style="width: 110px; height: 30px; padding: 1% 0"
													data-rbno="${report.rbno }">신고 접수</button></a>
												</c:otherwise>
											</c:choose>
											
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
<!-- 					</div> -->
				</div>
				<!-- /.d-flex -->

				<div class="position-relative mb-4">
					<div class="chartjs-size-monitor">
						<div class="chartjs-size-monitor-expand">
							<div class=""></div>
						</div>
						<div class="chartjs-size-monitor-shrink">
							<div class=""></div>
						</div>
					</div>
					<canvas id="visitors-chart" height="0"
						style="display: block; width: 639px; height: 0px;"
						class="chartjs-render-monitor" width="639"></canvas>
				</div>

			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>