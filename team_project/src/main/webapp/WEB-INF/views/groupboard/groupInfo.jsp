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
		var userid = that.attr("data-value");
		console.log(userid);
		var gno = "${groupVo.gno}";
		var url = "/group/deleteMember/" + userid + "/" + gno;
// 		var sData = {
// 				"gno" : gno
// 		}
		
		$.get(url,function(rData) {
			console.log(rData);
			if (rData == "true") {
				alert("그룹원 삭제 성공");
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
		var userid = "${loginVo.userid}";
		var gno = ${groupVo.gno};
		var url = "/group/deleteMember/" + userid + "/" + gno;
// 		var sData = {
// 				"gno" : gno
// 		}
		
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				alert("탈퇴 완료");
				$("#btnModalClose").trigger("click");
			}
		});
	});
	
	// 신고 팝업
	$(".report").click(function(e) {
		e.preventDefault();
		console.log("신고 클릭");
		var userid = $(this).next().val();
		var gno = $("#gno").val();
		console.log(gno);
		var url = "/groupboard/reportForm/" + userid + "/" + gno;
		var option = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "신고 페이지", option);
	});
});
</script>

${ groupVo }
<hr>
${ groupJoinMember }
<hr>
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
				<div class="col-md-9">
					<h2>
						그룹 이름: ${ groupVo.g_name }
					</h2>
					
					<h3>
						그룹 소개
					</h3>
					<p>
						${ groupVo.g_intro }
					</p>
					
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
									위치: ${ groupVo.g_location }<br>
									운동: ${ groupVo.excercise_type }<br>
									최대 인원수: ${ groupVo.g_attend }<br>
									개설 날짜: ${ groupVo.g_regdate }<br>
									그룹 정보(개설 날짜, 위치, 모임 목적, 최대 인원수)
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>
									그룹원 목록(그룹장일 경우 강퇴 버튼 보이게)
									<div>
									
									<div>
										그룹장: <span id="leader">${ groupVo.g_leader }</span>
									</div>
									
									<c:forEach items="${groupJoinMember}" var="groupJoinVo">
										<div style="margin: 10px;">
										<span>${ groupJoinVo.userid }</span>
										
										<button class="btn dropdown-toggle" style="background-color: #ffffff; width: 20px; height:50px; padding: 1% 0" type="button" id="dropdownMenuButton" data-toggle="dropdown">
							
								<i class='fas fa-ellipsis-v'></i>
							
							</button>
							
							<!-- 신고 관련 -->
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							
							<c:if test="${ groupVo.g_leader == loginVo.userid }">
								 <a class="dropdown-item disabled" href="#">신고 목록</a>
							</c:if>
								 <a class="dropdown-item" href="#">회원 정보 보기</a>
								 <i id="report" class="report fa-solid fa-handcuffs"><a class="dropdows-item" href="#" 
								 	data-user="${ groupBoardVo.userid }">신고하기</a></i>
								 <input type="hidden" id="userid" name="userid" value="${ groupBoardVo.userid }">
								 <input type="hidden" id="gno" name="gno" value="${ groupBoardVo.gno }">
							</div>
										
										<c:if test="${ groupVo.g_leader == loginVo.userid }">
											<button data-value="${ groupJoinVo.userid }" class="btnBan btn btn-danger" id="btnBan" style="width: 40px; height:30px; padding: 1% 0">강퇴</button>
											<button data-value="${ groupJoinVo.userid }" class="btnUpdateGLeader btn btn-default" id="btnUpdateGLeader" style="width: 90px; height:30px; padding: 1% 0">권한 넘기기</button>
										</c:if>
										
											<i id="report" class="report fa-solid fa-handcuffs"><a class="btn btn-danger" style="width: 40px; height:30px; padding: 1% 0" href="#" 
											 	data-user="${ groupBoardVo.userid }">신고</a></i>
											<input type="hidden" id="userid" name="userid" value="${ groupJoinVo.userid }">
											<input type="hidden" id="gno" name="gno" value="${ groupVo.gno }">
										
										</div>
									</c:forEach>
									
									</div>

								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
				
				
					<aside class="column dotcom__aside bottom-12">
						<div class="list-group">
							 <a href="#" class="list-group-item list-group-item-action active">Home</a>
							<div class="list-group-item">
								<h2>${ groupVo.g_name }</h2>
							</div>
							<div class="list-group-item">
								<h4 class="list-group-item-heading">
									그룹 소개
								</h4>
								<p class="list-group-item-text">
									${ groupVo.g_intro }
									...
								</p>
							</div>
							<div class="list-group-item justify-content-between">
								<c:choose>
									<c:when test="${ groupVo.g_leader == loginVo.userid }">
										<a href="/group/groupForm?gno=${ groupVo.gno }" id="updateGroupInfo">그룹 정보 수정(그룹장만)</a>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
							</div>
								<a href="/groupboard/groupMain/${ groupVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
									그룹 메인으로
								</a>
						</div>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="/groupboard/groupWriteForm?gno=${ groupVo.gno }">글쓰기</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">활동 정보</a>
								</li>
								<c:if test="${ groupVo.g_leader == loginVo.userid }">
								
									<li id="leaveModal" class="breadcrumb-item" style="display:none;">
										<a href="#" id="leaveGroup">그룹 탈퇴</a>
									</li>
								
								</c:if>
							</ol>
						</nav>
						<div class="row">
							<div>
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">
											Card title
										</h5>
										<p class="card-text">
											그룹원
										</p>
										<p>
											<a class="btn btn-primary" href="#">쪽지보내기</a>
										</p> 
									</div>
								</div>
							</div>
						</div>
						</aside>
				
				
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>