<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	

	$(".selectId").click(function(e){
		e.preventDefault();
		console.log("회원상세조회");	
		var userid = $(this).attr("data-id");
		console.log("userid:", userid);
		var url = "/admin/info?userid=" + userid;
		var option = "width = 800px, height=800px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "그룹 채팅방 입장", option);
	});
});
</script>
<%-- ${lastestMember } --%>
<h1>회원전체목록</h1>
<%-- ${memberList } --%>
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item"><a class="nav-link" href="/admin/main">메뉴</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="modifyForm"
				style="background-color: #fd9a9a;">회원</a></li>
			<li class="nav-item"><a class="nav-link" href="myPoint">신고
					내역</a></li>
			<li class="nav-item"><a class="nav-link" href="#">나의 그룹</a></li>
			<li class="nav-item"><a class="nav-link" href="#">나의 일정</a></li>
			<li class="nav-item"><a class="nav-link" href="deleteForm">회원탈퇴</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="chatRoom"
				style="cursor: pointer;">채팅방</a></li>
		</ul>
	</div>
	<div class="col-md-8">
		<table class="table">
			<thead>
				<tr align="center">
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>나이(성별)</th>
					<th>이메일</th>
					<th>주소</th>
					<th>가입일</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${memberList }" var="memberVo">
				<tr>
					<td><a class="selectId" data-id="${memberVo.userid }">${memberVo.userid }</a></td>
					<td>${memberVo.username }</td>
					<td>${memberVo.nickname }</td>
					<td>${memberVo.age }세(
					<c:choose>
						<c:when test="${memberVo.gender == 'F' }"><i class="fa-solid fa-neuter"></i></c:when>
						<c:otherwise><i class="fa-solid fa-mars"></i></c:otherwise>
					</c:choose>
					)</td>
					<td>${memberVo.email }</td>
					<td>${memberVo.address }</td>
					<td>${memberVo.regdate }</td>
					<td></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>