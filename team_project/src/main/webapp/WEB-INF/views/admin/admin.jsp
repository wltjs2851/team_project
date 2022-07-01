<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function() {
	var adminCheck = "${ifAdmin}";
	if (adminCheck == "false") {
		alert("권한이 없습니다.");
	} else if (adminCheck == "notLogin") {
		console.log(adminCheck);
		alert("관리자로 로그인해주세요.");
	}
});
</script>
<%-- ${lastestMember } --%>
<%-- ${lastestReport } --%>
<h1>관리자 페이지</h1>
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item">
				<a class="nav-link" style="background-color: #fd9a9a;">메뉴</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/memberList">회원 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/group">그룹 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/reportBoard">신고 내역</a>
			</li>
		</ul>
	</div>
	<div class="col-md-8">
		<div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">신규 회원 목록</h3>
                  <a href="/admin/memberList"> 회원 목록 전체보기</a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                <c:forEach items="${lastestMember }" var="last">
                	<div style="padding-right: 60px;">
                	<c:choose>
	                	<c:when test="${empty last.u_pic}">
							<img class="rounded-circle" width="150px;" height="auto" style="align-items: center; overflow: hidden;"
												src="/resources/images/profile.png" alt="프로필">
						</c:when>
						<c:otherwise>
		                  	<img class="rounded-circle" width="150px" height="auto"
												src="/member/displayImage?filename=${last.u_pic}"
												alt="프로필" style="overflow: hidden;">
						</c:otherwise>
					</c:choose>
					<div style="padding-top: 10px; padding-left: 5px; text-align: center;">
						<a>${last.userid }</a><br>
						<a>${last.username }</a>
					</div>
                 	 </div>
                </c:forEach>
<!--                   <p class="ml-auto d-flex flex-column text-right"> -->
<!--                   	<span>회원2</span> -->
<!--                   </p> -->
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="visitors-chart" height="0" style="display: block; width: 639px; height: 0px;" class="chartjs-render-monitor" width="639"></canvas>
                </div>

              </div>
            </div>
<!--             최근 신고목록 -->
		<div class="card" style="margin-top: 30px; margin-bottom: 30px;">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">최근 신고 목록</h3>
                  <a href="/admin/reportBoard"> 신고 목록 전체보기</a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
<%--                 ${lastestReport } --%>
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
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${lastestReport }" var="report">
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
									</tr>
								</c:forEach>
								</tbody>
							</table>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="visitors-chart" height="0" style="display: block; width: 639px; height: 0px;" class="chartjs-render-monitor" width="639"></canvas>
                </div>

              </div>
            </div>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>