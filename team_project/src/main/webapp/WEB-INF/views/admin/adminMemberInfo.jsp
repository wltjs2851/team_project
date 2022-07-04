<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
</head>
<style>
.card-title {
	margin-top: 5px;
	margin-bottom: 0px;
}
.card-body {
	width: 100%;
}

.d-flex {
	width: 35%;
	float: left;
}

.userInfo {
	width: 65%;
	float: right;
}

th, td {
	padding: 7px;
}

.groupMember{
	padding: 7px;
}

.hide1 {
	display: none;
}

.hide2 {
	display: none;
}
</style>
<!-- PLUGINS CSS STYLE -->
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link href="/resources/plugins/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/admin.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#minimize1").click(function(){
		console.log("최소화 클릭");
		var cardBody = $("#card-body");
		console.log(cardBody);
		if (cardBody.hasClass('hide1')){
			// 숨겨져 있다면
			console.log("if");
			cardBody.removeClass('hide1');
		} else {
			// 숨겨지지 않았다면
			console.log("else");
			cardBody.addClass('hide1');
			$(this).css("display", "none");
			$("#plus1").css("display", "");
		}
	});
	
	$("#plus1").click(function(){
		console.log("최대화 클릭");
		var cardBody = $("#card-body");
		console.log(cardBody);
		if (cardBody.hasClass('hide1')){
			// 숨겨져 있다면
			console.log("if");
			cardBody.removeClass('hide1');
			$(this).css("display", "none");
			$("#minimize1").css("display", "");
		} else {
			// 숨겨지지 않았다면
			console.log("else");
			cardBody.addClass('hide1');
			$(this).css("display", "none");
			$("#minimize1").css("display", "");
		}
	});
	
	$("#minimize2").click(function(){
		console.log("최소화 클릭");
		var cardBody = $("#card-body2");
		console.log(cardBody);
		if (cardBody.hasClass('hide2')){
			// 숨겨져 있다면
			console.log("if");
			cardBody.removeClass('hide2');
		} else {
			// 숨겨지지 않았다면
			console.log("else");
			cardBody.addClass('hide2');
			$(this).css("display", "none");
			$("#plus2").css("display", "");
		}
	});
	
	$("#plus2").click(function(){
		console.log("최대화 클릭");
		var cardBody = $("#card-body2");
		console.log(cardBody);
		if (cardBody.hasClass('hide2')){
			// 숨겨져 있다면
			console.log("if");
			cardBody.removeClass('hide2');
			$(this).css("display", "none");
			$("#minimize2").css("display", "");
		} else {
			// 숨겨지지 않았다면
			console.log("else");
			cardBody.addClass('hide2');
			$(this).css("display", "none");
			$("#minimize2").css("display", "");
		}
	});
});
</script>
<%-- ${memberVo } --%>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<br>
			<div class="card">
				<div class="card-header border-0">
					<div class="d-flex justify-content-between" style="width: 100%;">
						<h3 class="card-title">회원 정보</h3>
						<a href="/admin/board?nickname=${param.nickname}"> 작성글/댓글 보기</a>
					</div>
				</div>
				<div class="card-body">
					<div class="d-flex">
						<div style="padding-right: 60px;padding-top: 25px;padding-left: 25px;">
							<c:choose>
								<c:when test="${empty memberVo.u_pic}">
									<img class="rounded-circle" width="150px;" height="auto"
										style="align-items: center; overflow: hidden;"
										src="/resources/images/profile.png" alt="프로필">
								</c:when>
								<c:otherwise>
									<img class="rounded-circle" width="150px" height="auto"
										src="/member/displayImage?filename=${memberVo.u_pic}"
										alt="프로필" style="overflow: hidden;">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="userInfo">
						<table>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${memberVo.userid}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${memberVo.username}</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>${memberVo.nickname}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${memberVo.email}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${memberVo.address}</td>
								</tr>
								<tr>
									<th>가입일</th>
									<td>${memberVo.regdate}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
<!-- 				card-body 끝 -->
			</div> 
<!-- 			카드 끝 -->

<!-- 			회원 가입한 그룹 내역 시작 -->
		<div><br>
			<div class="card">
	        <div class="card-header" style="width: 100%;">
	          <h3 class="card-title" >가입한 그룹 목록
	          <i class='fas fa-window-minimize' id="minimize1" style="float: right;"></i>
	          <i class='fas fa-plus' style="display: none; float: right;" id="plus1"></i></h3>
	        </div>
        <div class="card-body p-0" id="card-body">
          <table class="table table-striped projects">
          	<c:choose>
              	<c:when test="${not empty groupList }">
              <thead>
                  <tr style="text-align: center;">
                      <th style="width: 5%">
                          #
                      </th>
                      <th style="width: 15%">
                          그룹 이름
                      </th>
                      <th style="width: 45%;">
                          그룹 멤버
                      </th>
                      <th>
                          인원
                      </th>
                      <th style="width: 10%" class="text-center">
                          지역
                      </th>
                      <th style="width: 6%">
                      </th>
                  </tr>
              </thead>
              <tbody>
						<c:forEach items="${groupList }" var="list">
							<tr>
								<td>${list.gno }</td>
								<td>${list.g_name}</td>
								<td><c:forEach items="${groupInfo }" var="test">
										<c:if test="${list.gno == test.gno }">
<!-- 												<ul class="list-inline"> -->
										<li class="list-inline-item" style="text-align: center;">
										
<!-- 												<li class="list-inline-item"> -->
										<c:choose>
										<c:when test="${empty test.u_pic }">
										<img class="rounded-circle groupMember" width="60px;" height="auto" style="align-items: center; overflow: hidden;"
										src="/resources/images/profile.png" alt="프로필"><br>
										</c:when>
										<c:otherwise>
										<img class="rounded-circle groupMember" width="60px;" height="auto" style="align-items: center; overflow: hidden;"
										src="/member/displayImage?filename=${test.u_pic}" alt="프로필"><br>
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${list.g_leader == test.userid }">
										<i class='fas fa-crown' style="color: orange;"></i>
											<strong>${test.userid }</strong>
										</c:when>
										<c:otherwise>${test.userid }</c:otherwise>
										</c:choose>
										</li>
<!-- 											</ul> -->
             							   </c:if>
									</c:forEach></td>
								<td>
									${list.g_present }/${list.g_attend }
								</td>
								<td class="project_progress"></td>
								<td class="project-state"></td>
								<td class="project-actions text-right"></td>
							</tr>
						</c:forEach>
						</tbody>
					</c:when>
				<c:otherwise>
					<div style="text-align: center;"><br>
					<p>가입한 그룹이 없습니다.</p>
					</div>
				</c:otherwise>
				</c:choose>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
		</div>
		
<!-- 		작성 글/댓글 -->
<%-- ${adminList } --%>
		<div><br>
			<div class="card">
	        <div class="card-header" style="width: 100%;">
	          <h3 class="card-title" >최근 작성 글
	          <i class='fas fa-window-minimize' id="minimize2" style="float: right;"></i>
	          <i class='fas fa-plus' style="display: none; float: right;" id="plus2"></i></h3>
	        </div>
        <div class="card-body p-0" id="card-body2">
          <table class="table table-striped projects">
          <c:choose>
          	<c:when test="${not empty adminList}">
              <thead>
                  <tr>
                      <th style="width: 5%">
                          #
                      </th>
                      <th style="width: 45%">
                          글 제목 
                      </th>
                      <th style="width: 20%">
                          작성일
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach items="${adminList }" var="admin">
				<tr>
					<td>${admin.number }</td>
					<td>${admin.title }</td>
					<td>${admin.regdate }</td>
				</tr>
			</c:forEach>	
			</tbody>
			</c:when>
			<c:otherwise>
				<div style="text-align: center;"><br>
					<p>작성한 글이 없습니다.</p>
					</div>
			</c:otherwise>
			</c:choose>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
		</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>