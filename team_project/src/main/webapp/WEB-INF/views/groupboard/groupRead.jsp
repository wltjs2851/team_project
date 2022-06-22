<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function() {
	
	var update_result = "${update_result}";
	if(update_result == "true") {
		alert("수정 완료");
	}
	
	// 댓글 입력
	$("#btnCommentInsert").click(function() {
		console.log("click");
		var count = $(".count").val();
		console.log("count: ", count);
		var gbc_content = $("#c_content").val();
		var userid = $("#c_userid").val();
		var gbno = "${groupBoardVo.gbno}";
		var sData = {
				"gbc_content" : gbc_content,
				"userid" : userid,
				"gbno" : gbno
		}
		console.log("sData: ", sData);
		
		var url = "/groupcomment/insertGroupComment";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if(rData == "true") {
				$(".count").text("${groupBoardVo.gb_comment + 1}");
// 				$(".count").val(text(${count + 1}));
				getCommentList();
			}
		});
	});
	
	function getCommentList() {
		var gbno = "${groupBoardVo.gbno}";
		console.log(gbno);
		var url = "/groupcomment/groupCommentList/" + gbno;
		$.get(url, function(rData) {
			console.log(rData); 
			$("#table_comment_list tr:gt(0)").remove();
			
			$.each(rData, function() {
				var tr = $("#table_clone tr").clone();
				var tds = tr.find("td");
				
				tds.eq(0).text(this.gbcno);
				tds.eq(1).text(this.gbc_content);
				tds.eq(2).text(this.userid);
				tds.eq(3).text(this.gbc_regdate);
				tds.find(".btnCommentDelete").attr("data-gbcno", this.gbcno);
				tds.find(".btnCommentModify").attr("data-gbcno", this.gbcno);
				
				$("#table_comment_list").append(tr);
			});
		});
	}
	
	// 좋아요
	var heart = ${heart};
	var span = $("i.fa-heart").next();
	
	if(heart > 0) {
		console.log(heart);
		$("i.fa-heart").css("color", "red");
		$("i.fa-heart").prop("name", heart);
	} else {
		// 좋아요가 하나도 없는 경우 
		console.log(heart);
		$("i.fa-heart").css("color", "graytext");
		$("i.fa-heart").prop("name", heart);
	}
	
	// 하트 클릭
	$("i.fa-heart").click(function(){
		console.log("클릭");
		
		var that = $("i.fa-heart");
		var gbno = that.attr("data-gbno");
		console.log(gbno);
		
		var heart = that.prop("name");
		console.log(heart);
		
		var url = "/groupboard/heart";
		var sData = {
				"gbno" : gbno,
				"heart" : heart
		};
		
		$.post(url, sData, function(rData){
			console.log("rData:", rData);
			that.prop("name", rData);
			
			if(rData == 1){
				$("i.fa-heart").css("color", "red");
				$("#like").text("${groupBoardVo.gb_like + 1}");
// 				span.text(parseInt(span.text().trim()) + 1);
			} else {
				$("i.fa-heart").css("color", "graytext");
				$("#like").text("${groupBoardVo.gb_like}");
// 				span.text(parseInt(span.text().trim()) - 1);
			}
		});
	});
	
	// 댓글 삭제
	$("#table_comment_list").on("click", ".btnCommentDelete", function() {
		console.log("댓글 삭제 버튼");
		var gbcno = $(this).attr("data-gbcno");
		var url = "/groupcomment/deleteGroupComment/" + gbcno;
		var gbno = "${groupBoardVo.gbno}";
		
		var sData = {
				"gbno" : gbno
		}
		
		$.get(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
// 				$(".count").text("${count}");
// 				$(".count").val(text(${groupBoardVo.gb_comment - 1}));
				getCommentList();
			}
		});
	});
	
	// 댓글 수정 버튼
	$("#table_comment_list").on("click", ".btnCommentModify", function() {
		$("#modal-402154").trigger("click");
		var tr = $(this).parents("tr");
		console.log(tr);
		var gbc_content = tr.find("td").eq(1).text();
		console.log(gbc_content);
		$("#modalContent").val(gbc_content);
		$("#btnModalSave").attr("data-gbcno", $(this).attr("data-gbcno"));
	});
	
	// 모달창 저장 버튼
	$("#btnModalSave").click(function() {
		var gbc_content = $("#modalContent").val();
		var gbcno = $(this).attr("data-gbcno");
		var sData = {
				"gbc_content" : gbc_content,
				"gbcno"	  : gbcno
		};
		var url = "/groupcomment/updateGroupComment";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
				getCommentList();
				$("#btnModalClose").trigger("click");
			}
		});
	});
	
	getCommentList();
});
</script>

<%-- ${ groupBoardVo } --%>
<!-- <hr> -->
<%-- ${ groupVo } --%>
<%-- ${ heart } --%>
<%-- ${ count } --%>

<!-- 모달 -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-402154" href="#modal-container-402154" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-402154" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								댓글 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="modalContent">
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnModalSave">
								변경
							</button> 
							<button type="button" id="btnModalClose" class="btn btn-secondary" data-dismiss="modal">
								닫기
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
					<h2 style="margin: 20px;">
						${ groupBoardVo.gb_title }
					</h2>
					<hr style="margin: 20px;">
					<p style="margin: 20px;">
						작성자: ${ groupBoardVo.userid }, 작성일: ${ groupBoardVo.gb_regdate }
					</p>
					<div style="margin: 20px;">
						${ groupBoardVo.gb_content }
					</div>
					
					<div class="image">
						<c:choose>
							<c:when test="${empty groupBoardVo.gb_pic}">
								<div></div>
							</c:when>
						<c:otherwise>
							<div style="margin: 20px;"><img src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}" alt="작성자가 올린 사진"></div>
						</c:otherwise>
						</c:choose>
					</div>
				
				
				<!-- 좋아요 --> 
					<i class="fas fa-heart" style=" font-size: 30px; color: graytext; cursor: pointer;" data-gbno="${ groupBoardVo.gbno }"></i>
					<span id="like" style="font-size: 30px;">${ groupBoardVo.gb_like }</span>
				
				<!-- 수정, 삭제 버튼 -->
				<c:if test="${ loginVo.userid == groupVo.g_leader }">
					<c:if test="${ loginVo.userid == groupBoardVo.userid }">
					<table>
						<tr>
							<td><a href="/groupboard/groupUpdateForm?gbno=${ groupBoardVo.gbno }" class="btn btn-sm btn-success">수정</a></td>
							<td><a href="/groupboard/groupDelete?gbno=${ groupBoardVo.gbno }&gno=${groupBoardVo.gno}" class="btn btn-sm btn-danger">삭제</a></td>
						</tr>
					</table>
					</c:if>
				</c:if>
				
				<!-- 댓글 -->
				<div class="comments">
				댓글[<span class="count">${ groupBoardVo.gb_comment }</span>]
				</div>
				<div class="row">
					<div class="col-md-9">
						<input type="text" id="c_content" class="form-control" placeholder="댓글을 입력해주세요">
						<input type="hidden" value="${ loginVo.userid }" id="c_userid" class="form-control">
					</div>
					<div>
						<button type="button" id="btnCommentInsert" class="btn btn-sm btn-primary">완료</button>
					</div>
				</div>
				
				<div class="row" style="margin-top:30px;">
					<div class="col-md-12">
						<table style="display:none;" id="table_clone">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								
								<c:if test="${ loginVo.userid == groupBoardVo.userid }">
									<td>
										<button type="button"
											class="btn btn-sm btn-warning btnCommentModify">수정</button>
									</td>
									<td>
										<button type="button" 
											class="btn btn-sm btn-danger btnCommentDelete">삭제</button>
									</td>
								</c:if>
							</tr>
						</table>
						<table class="table" id="table_comment_list">
							<tr>
								<td>#</td>
								<td>내용</td>
								<td>작성자</td>
								<td>날짜</td>
								<td>수정</td>
								<td>삭제</td>
							</tr>
						</table>
					</div>
				</div>
				
				
				</div>
				<div class="col-md-3">
				
<!-- 				<aside class="main-sidebar sidebar-dark-primary elevation-4"> -->
					<div class="list-group">
						 <a href="#" class="list-group-item list-group-item-action active">Home</a>
						<div class="list-group-item">
							<h2>${ groupVo.g_name }</h2>
						</div>
						<div class="list-group-item">
							<p class="list-group-item-text">
								${ groupVo.g_intro }
							</p>
						</div>
						<div class="list-group-item justify-content-between">
							<a href="/groupboard/groupMain/${ groupBoardVo.gno }">그룹 메인으로</a>
						</div>
							<a href="/group/groupInfo?gno=${ groupBoardVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
								그룹 정보 보기
							</a>
					</div>
					<nav>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="/groupboard/groupWriteForm?gno=${ groupBoardVo.gno }">글쓰기</a>
							</li>
							<li class="breadcrumb-item">
								<a href="/groupboard/activityInfo/${ groupBoardVo.gno }">활동 정보</a>
							</li>
<!-- 							<li class="breadcrumb-item"> -->
<!-- 								<a href="">그룹 탈퇴</a> -->
<!-- 							</li> -->
						</ol>
					</nav>
<!-- 					<div class="row"> -->
<!-- 						<div> -->
<!-- 							<div class="card"> -->
<!-- 								<img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" /> -->
<!-- 								<div class="card-block"> -->
<!-- 									<h5 class="card-title"> -->
<!-- 										Card title -->
<!-- 									</h5> -->
<!-- 									<p class="card-text"> -->
<!-- 										그룹원 -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-primary" href="#">쪽지보내기</a> -->
<!-- 									</p>  -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					</aside> -->
				
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>