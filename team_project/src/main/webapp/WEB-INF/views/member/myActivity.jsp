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
	var uri = window.location.href
	var type = uri.split("=");
	if (type[1] == "write") {
		$("#myTitle").html("내가 쓴 글");
	} else if (type[1] == "like") {
		$("#myTitle").html("내가 좋아요한 글");
	} else if (type[1] == "comment") {
		$("#myTitle").html("내가 쓴 댓글");
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
	$("#btnWrite").click(function() {
		location.href = "/member/myActivity?type=write";
// 		$("#myTitle").html("내가 쓴 글");
	});
	$("#btnComment").click(function() {
		location.href = "/member/myActivity?type=comment";
// 		$("#myTitle").html("내가 쓴 댓글");
	});
	$("#btnLike").click(function() {
		location.href = "/member/myActivity?type=like";
// 		$("#myTitle").html("내가 좋아요 한 글");
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
		<button type="button" class="btn btn-outline-danger" id="btnWrite">내가 쓴 글</button>
		<button type="button" class="btn btn-outline-danger" id="btnComment">내가 쓴 댓글</button>
		<button type="button" class="btn btn-outline-danger" id="btnLike">내가 좋아요 한 글</button>
		<div class="tabbable" id="tabs-341613">
			<br><h2 id="myTitle"></h2>
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
						<c:choose>
							<c:when test="${freeComment == null || freeComment == ''}">
							<tr>
								<th class="number">#</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="like">좋아요</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${free}" var="freeVo">
								<tr class="like_tr">
									<td>${freeVo.fno}</td>
									<td>${freeVo.f_title}</td>
									<td>${freeVo.userid}</td>
									<td>${freeVo.f_like}</td>
									<td>${freeVo.f_regdate}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th class="number">#</th>
								<th class="title">댓글</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${freeComment}" var="fcVo">
								<tr class="like_tr">
									<td>${fcVo.fno}</td>
									<td>${fcVo.fc_comment}</td>
									<td>${fcVo.userid}</td>
									<td>${fcVo.f_regdate}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab2">
					<div class="myLikeContent">
						<table class="table">
						<c:choose>
							<c:when test="${groupBoardComment == null || groupBoardComment == ''}">
							<tr>
								<th class="number">#</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="like">좋아요</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${groupBoard}" var="groupBoardVo">
							<input type="hidden" id="hideGno" value="${groupBoardVo.gno}">
								<tr class="like_tr">
									<td>${groupBoardVo.gbno}</td>
									<td>${groupBoardVo.gb_title}</td>
									<td>${groupBoardVo.userid}</td>
									<td>${groupBoardVo.gb_like}</td>
									<td>${groupBoardVo.gb_regdate}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th class="number">#</th>
								<th class="title">댓글</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${groupBoardComment}" var="gbcVo">
								<tr class="like_tr">
									<td>${gbcVo.gbno}</td>
									<td>${gbcVo.gbc_comment}</td>
									<td>${gbcVo.userid}</td>
									<td>${gbcVo.gbc_regdate}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab3">
					<div class="myLikeContent">
						<table class="table">
						<c:choose>
							<c:when test="${recipeComment == null || recipeComment == ''}">
							<tr>
								<th class="number">#</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="like">좋아요</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${recipe}" var="recipeVo">
								<tr class="like_tr">
									<td>${recipeVo.rno}</td>
									<td>${recipeVo.r_title}</td>
									<td>${recipeVo.userid}</td>
									<td>${recipeVo.r_like}</td>
									<td>${recipeVo.r_regdate}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th class="number">#</th>
								<th class="title">댓글</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${recipeComment}" var="reVo">
								<tr class="like_tr">
									<td>${reVo.rno}</td>
									<td>${reVo.rc_comment}</td>
									<td>${reVo.userid}</td>
									<td>${reVo.rc_regdate}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab4">
					<div class="myLikeContent">
						<table class="table">
						<c:choose>
							<c:when test="${routineComment == null || routineComment == ''}">
							<tr>
								<th class="number">#</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="like">좋아요</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${routine}" var="routineVo">
								<tr class="like_tr">
									<td>${routineVo.uno}</td>
									<td>${routineVo.ur_title}</td>
									<td>${routineVo.userid}</td>
									<td>${routineVo.ur_like}</td>
									<td>${routineVo.ur_regdate}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th class="number">#</th>
								<th class="title">댓글</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${routineComment}" var="roVo">
								<tr class="like_tr">
									<td>${roVo.uno}</td>
									<td>${roVo.urc_comment}</td>
									<td>${roVo.userid}</td>
									<td>${roVo.u_regdate}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="tab5">
					<div class="myLikeContent">
						<table class="table">
						<c:choose>
							<c:when test="${recommendComment == null || recommendComment == ''}">
							<tr>
								<th class="number">#</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="like">좋아요</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${recommend}" var="recommendVo">
								<tr class="like_tr">
									<td>${recommendVo.reno}</td>
									<td>${recommendVo.re_title}</td>
									<td>${recommendVo.userid}</td>
									<td>${recommendVo.re_like}</td>
									<td>${recommendVo.re_regdate}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th class="number">#</th>
								<th class="title">댓글</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
							</tr>
							<c:forEach items="${recommendComment}" var="recVo">
								<tr class="like_tr">
									<td>${recVo.reno}</td>
									<td>${recVo.re_comment}</td>
									<td>${recVo.userid}</td>
									<td>${recVo.re_regdate}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
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
