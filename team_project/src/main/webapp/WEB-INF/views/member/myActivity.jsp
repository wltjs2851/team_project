<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(function(){
	var modifyResult = "${modifyResult}";
	if (modifyResult == "true") {
		alert("회원정보 수정 완료");
	}
	
	$("#chatRoom").click(function(e){
		e.preventDefault();
		console.log("채팅방 입장");	
		var url = "/chat/chat";
		var option = "width = 650px, height=800px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "그룹 채팅방 입장", option);
	});
	$(".like_tr").click(function() {
		var post = $("#tab").find("a.active").data("post");
		var no = $(this).find("td").eq(0).html();
		if (post == "fno") {
			url = "/free/freeContent?" + post + "=" + no;
		} else if (post == "gbno") {
			var gno = $(this).prev().val();
			url = "/groupboard/groupRead?" + post + "=" + no + "&gno=" + gno;
		} else if (post == "rno") {
			url = "/recipe/recipeForm?" + post + "=" + no;
		} else if (post == "uno") {
			url = "/routine/routineContent?" + post + "=" + no;
		} else if (post == "reno") {
			url = "/recommend/selectByReno?" + post + "=" + no;
		}
		location.href = url;
	});
});	
</script>
<hr>
<div class="row">
	<div class="col-md-2">
		<ul class="nav flex-column nav-pills">
			<li class="nav-item">
				<a class="nav-link" href="myPage">메뉴</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="modifyForm">회원정보 수정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" style="background-color: #fd9a9a;">활동내용</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">나의 그룹</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/calendar/cal">나의 일정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="deleteForm">회원탈퇴</a>
			</li>
		</ul>
	</div>
	<div class="col-md-8">
		<div class="tabbable" id="tabs-341613">
			<br><h2>내가 좋아요 한 글</h2>
			<ul class="nav nav-tabs" id="tab">
				<li class="nav-item">
					<a class="nav-link active" href="#tab1" data-toggle="tab" data-post="fno">자유</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab2" data-toggle="tab" data-post="gbno">그룹</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab3" data-toggle="tab" data-post="rno">식단</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab4" data-toggle="tab" data-post="uno">루틴</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab5" data-toggle="tab" data-post="reno">추천운동</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div class="myLikeContent">
						<table class="table">
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${freeLike}" var="freeVo">
								<tr class="like_tr">
									<td>${freeVo.fno}</td>
									<td>${freeVo.f_title}</td>
									<td>${freeVo.userid}</td>
									<td>${freeVo.f_like}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab2">
					<div class="myLikeContent">
						<table class="table">
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${groupBoardLike}" var="groupBoardVo">
							<input type="hidden" id="hideGno" value="${groupBoardVo.gno}">
								<tr class="like_tr">
									<td>${groupBoardVo.gbno}</td>
									<td>${groupBoardVo.gb_title}</td>
									<td>${groupBoardVo.userid}</td>
									<td>${groupBoardVo.gb_like}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab3">
					<div class="myLikeContent">
						<table class="table">
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${recipeLike}" var="recipeVo">
								<tr class="like_tr">
									<td>${recipeVo.rno}</td>
									<td>${recipeVo.r_title}</td>
									<td>${recipeVo.userid}</td>
									<td>${recipeVo.r_like}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab4">
					<div class="myLikeContent">
						<table class="table">
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${routineLike}" var="routineVo">
								<tr class="like_tr">
									<td>${routineVo.uno}</td>
									<td>${routineVo.ur_title}</td>
									<td>${routineVo.userid}</td>
									<td>${routineVo.ur_like}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab5">
					<div class="myLikeContent">
						<table class="table">
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${recommendLike}" var="recommendVo">
								<tr class="like_tr">
									<td>${recommendVo.reno}</td>
									<td>${recommendVo.re_title}</td>
									<td>${recommendVo.userid}</td>
									<td>${recommendVo.re_like}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
