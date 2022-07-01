<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<script>
$(function() {
	$(".tab-content > div").hide();
	$(".nav-tabs a").click(function() {
		$(".tab-content > div").hide().filter(this.hash).fadeIn();
		$(".nav-tabs a").removeClass("active");
		$(this).addClass("active");
		return false;
	}).filter(":eq(0)").click();
	
	// 강퇴 버튼
	$(".btnBan").click(function() {
		console.log("click");
		var that = $(this);
		var nickname = that.attr("data-value");
		console.log(nickname);
		var gno = "${groupVo.gno}";
		var url = "/group/banMember/" + nickname + "/" + gno;
// 		var sData = {
// 				"gno" : gno
// 		}
		
		$.get(url,function(rData) {
			console.log(rData);
			if (rData == "true") {
				alert("그룹원 강퇴 성공");
				that.parent().fadeOut("slow");
			}
		});
	});
	
	// 그룹장 변경
	$(".btnUpdateGLeader").click(function() {
		console.log("Click");
		
		var that = $(this);
		var g_leader = that.attr("data-value");
		console.log("g_leader: ", g_leader);
		
		var gno = "${groupVo.gno}";
		console.log("gno: " , gno);
		var url = "/groupboard/leaveGroup/" + g_leader + "/" + gno;
		console.log("url: ", url);
		
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "false") {
				alert("그룹장 변경 완료");
				$(".btnBan").fadeOut("slow");
				$(".btnUpdateGLeader").fadeOut("slow");
				$("#updateGroupInfo").fadeOut("slow");
				$("#leaveModal").fadeIn("slow");
				$("#leader").text(g_leader);
			}
		});
	});
	
	// 그룹 탈퇴 버튼
	$("#leaveGroup").click(function() {
		console.log("click");
		$("#modal-734488").trigger("click");
	});
	
	// 모달, 탈퇴 버튼(일반 그룹원)
	$("#leave").click(function() {
		console.log("Click");
		var nickname = "${loginVo.nickname}";
		var gno = ${groupVo.gno};
		var url = "/group/deleteMember/" + nickname + "/" + gno;
// 		var sData = {
// 				"gno" : gno
// 		}
		
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				alert("탈퇴 완료");
				$("#btnModalClose").trigger("click");
				$("#leaveGroup").fadeOut("slow");
			}
		});
	});
	
	// 신고 팝업
	$(".report").click(function(e) {
		e.preventDefault();
		console.log("신고 클릭");
		var nickname = $(this).next().val();
		var gno = $("#gno").val();
		console.log(gno);
		var url = "/groupboard/reportForm/" + nickname + "/" + gno;
		var option = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "신고 페이지", option);
	});
	
	
	$(".reportList").click(function(e) {
		e.preventDefault();
		console.log("click");
		var nickname = $(this).next().val();
		console.log(nickname);
		var gno = $("#gno").val();
		console.log(gno);
		
		var url = "/groupboard/reportList/" + nickname + "/" + gno;
		var option = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "회원 신고 목록", option);
	});
});
</script>

<%-- ${ groupVo } --%>
<!-- <hr> -->
<%-- ${ groupJoinMember } --%>
<!-- <hr> -->
<%-- ${ count } --%>

<!-- 그룹 탈퇴 모달 -->
<div class="row">
	<div class="col-md-12">
		 <a id="modal-734488" href="#modal-container-734488" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
		
		<div class="modal fade" id="modal-container-734488" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							그룹 탈퇴
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						정말로 탈퇴하시겠습니까?
					</div>
					<div class="modal-footer">
						 
						<button id="leave" type="button" class="btn btn-primary">
							탈퇴
						</button> 
						<button type="button" id="btnModalClose" class="btn btn-secondary" data-dismiss="modal">
							취소
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				
				<div class="col-md-2"></div>
			
				<div class="col-md-8">
				
				<div style="margin: 20px;"><img src="/groupboard/displayImage?filename=${groupVo.g_pic}" alt="그룹 사진"></div>
				
<!-- 					<h2> -->
<%-- 						그룹 이름: ${ groupVo.g_name } --%>
<!-- 					</h2> -->
					
<!-- 					<h3> -->
<!-- 						그룹 소개 -->
<!-- 					</h3> -->
<!-- 					<p> -->
<%-- 						${ groupVo.g_intro } --%>
<!-- 					</p> -->
					<div class="tabbable" id="tabs-367776">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active show" href="#tab1" data-toggle="tab">그룹 정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab2" data-toggle="tab">그룹원</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="active" id="tab1">
								<p>
<%-- 									위치: ${ groupVo.g_location }<br> --%>
<%-- 									운동: ${ groupVo.excercise_type }<br> --%>
<%-- 									최대 인원수: ${ groupVo.g_attend }<br> --%>
<%-- 									개설 날짜: ${ groupVo.g_regdate }<br> --%>
<!-- 									그룹 정보(개설 날짜, 위치, 모임 목적, 최대 인원수) -->
									
									<table class="table table-bordered table-hover table-sm">
				<tbody>
					<tr>
						<th class="w-25 text-secondary">그룹명</th>
						<th>${ groupVo.g_name }</th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th class="w-25 text-secondary">그룹장</th>
						<th>${ groupVo.g_leader }</th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th class="w-25 text-secondary">그룹 소개글</th>
						<th>${ groupVo.g_intro }</th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th class="w-25 text-secondary">운동</th>
						<th>${ groupVo.excercise_type }</th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th class="w-25 text-secondary">최대 인원수</th>
						<th>${ groupVo.g_attend }</th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th class="w-25 text-secondary">개설 날짜</th>
						<th>${ groupVo.g_regdate }</th>
					</tr>
				</tbody>
			</table>
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>
<!-- 									그룹원 목록(그룹장일 경우 강퇴 버튼 보이게) -->
									<div>
									
									<div>
										그룹장: <span id="leader">${ groupVo.g_leader }</span>
<%-- 										<p style="border-radius: 5em; padding: 0.5em; background: #E7B7B7;">그룹장: <span id="leader">${ groupVo.g_leader }</span></p> --%>
<%-- 										<p style="border-left: 10px solid #688FF4; padding: 0.5em; border-bottom: 2px solid #688FF4; ">그룹장: <span id="leader">${ groupVo.g_leader }</span></p> --%>
									</div>
									
									<c:forEach items="${groupJoinMember}" var="groupJoinVo">
										<div style="margin: 10px;">
										<span>${ groupJoinVo.nickname }</span>
										
										
										<c:if test="${ groupVo.g_leader == loginVo.userid || loginVo.userid == 'admin01' }">
											
											<button data-value="${ groupJoinVo.nickname }" class="btnBan btn btn-danger" id="btnBan" style="width: 40px; height:30px; padding: 1% 0">강퇴</button>
											<button data-value="${ groupJoinVo.userid }" class="btnUpdateGLeader btn btn-default" id="btnUpdateGLeader" style="width: 90px; height:30px; padding: 1% 0">권한 넘기기</button>
										</c:if>
										
											<i id="report" class="report fa-solid fa-handcuffs"><a class="btn btn-outline-danger" style="width: 40px; height:30px; padding: 1% 0" href="#" 
											 	data-user="${ groupBoardVo.nickname }">신고</a></i>
											<input type="hidden" id="nickname" name="nickname" value="${ groupJoinVo.nickname }">
											<input type="hidden" id="gno" name="gno" value="${ groupVo.gno }">
											
											<!-- 신고 관련 -->
											<button class="btn dropdown-toggle" style="background-color: #ffffff; width: 20px; height:50px; padding: 1% 0" type="button" id="dropdownMenuButton" data-toggle="dropdown">
											
												<i class='fas fa-ellipsis-v'></i>
											
											</button>
											
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											
											<c:if test="${ groupVo.g_leader == loginVo.userid || loginVo.userid == 'admin01' }">
												 <a id="reportList" class="reportList dropdown-item" href="#">신고 목록</a>
												 <input type="hidden" id="nickname" name="nickname" value="${ groupJoinVo.nickname }">
												 <input type="hidden" id="gno" name="gno" value="${ groupVo.gno }">
											</c:if>
												 <a class="dropdown-item" href="/groupboard/memberInfo?nickname=${ groupJoinVo.nickname }">회원 정보 보기</a>
											</div>
										
										</div>
									</c:forEach>
									
									</div>

								</p>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				<div class="col-md-2">
				
				
					<aside class="column dotcom__aside bottom-12">
						<div class="list-group">
							 <a style="background-color: #2D5082;" href="#" class="list-group-item list-group-item-action active">Home</a>
							<div class="list-group-item">
								<h2>${ groupVo.g_name }</h2>
							</div>
							<div class="list-group-item">
								<h4 class="list-group-item-heading">
									그룹 소개
								</h4>
								<p class="list-group-item-text">
									${ groupVo.g_intro }
								</p>
							</div>
							<div class="list-group-item justify-content-between">
									<c:if test="${ groupVo.g_leader == loginVo.userid }">
										<a href="/group/groupForm?gno=${ groupVo.gno }" id="updateGroupInfo">그룹 정보 수정</a>
									</c:if>
							</div>
								<a style="background-color: #2D5082;" href="/groupboard/groupMain/${ groupVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
									그룹 메인으로
								</a>
						</div>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="/groupboard/groupWriteForm?gno=${ groupVo.gno }">글쓰기</a>
								</li>
								<li class="breadcrumb-item">
									<a href="/groupboard/activityInfo/${ groupVo.gno }">활동 정보</a>
								</li>
								<c:if test="${ groupVo.g_leader == loginVo.userid }">
								
									<li id="leaveModal" class="breadcrumb-item" style="display:none;">
										<a href="#" id="leaveGroup">그룹 탈퇴</a>
									</li>
								
								</c:if>
							</ol>
						</nav>
						</aside>
				
				
				</div>
				
				
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>