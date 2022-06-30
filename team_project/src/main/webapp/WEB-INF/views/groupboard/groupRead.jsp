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
		var gbc_content = $("#c_content").val(); // c_content: 댓글 입력하는 곳
		var userid = $("#c_userid").val();
		var gbno = "${groupBoardVo.gbno}";
		var u_pic = "${loginVo.u_pic}";
		var gno = "${groupBoardVo.gno}"
		var sData = {
				"gbc_content" : gbc_content,
				"userid" : userid,
				"gbno" : gbno,
				"u_pic" : u_pic,
				"gno" : gno
		}
		console.log("sData: ", sData);
		
		var url = "/groupcomment/insertGroupComment";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if(rData == "true") {
				$("#c_content").val("");
				$(".count").text("${groupBoardVo.gb_comment + 1}");
// 				$(".count").val(text(${count + 1}));
				getCommentList();
			}
		});
	});

	// 신고 팝업
	$("#comment").on("click", ".report", function() {
// 		var gbcno = $(this).attr("data-gbcno");
		var userid = $(this).next().val();
		console.log(userid);
		var gno = $("#gno").val();
		var url = "/groupboard/reportForm/" + userid + "/" + gno;
		var option = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"신고",option);
	});
	
	function getCommentList() {
		var gbno = "${groupBoardVo.gbno}";
		var url = "/groupcomment/groupCommentList/" + gbno;
		$.get(url, function(rData) {
			console.log(rData);
			$("#comment > div").empty();
			$.each(rData, function() {
				console.log("u_pic: ", this.u_pic);
				var cmt = "";
				cmt += "<div style='width:100%; word-break:break-all;word-wrap:break-word;'>";
				cmt += "<div class='row'><p style='font-size: large; font-weight: bold;'>";
				if(this.u_pic == null) {
					cmt += "<img src='/resources/images/board/personDefault.png' class='rounded-circle z-depth-2' width=40px>";
				} else {
					cmt += "<img src='/groupboard/displayImage?filename=" + this.u_pic + 
							"' class='rounded-circle z-depth-2' width=40px style='margin-right: 10px;'>";
				}
				cmt += this.userid + "</p>";
				
				cmt += "<div class='dropdown' style='float:right'>"
				cmt += "	<button class='btn dropdown-toggle' style='background-color: #ffffff; width: 20px; height:36px; padding: 1% 0; margin-left: 10px' type='button' id='dropdownMenuButton' data-toggle='dropdown'>";
				cmt += "		<i class='fas fa-ellipsis-v'></i></button>";
				if("${loginVo.userid}" == this.userid) {
					
					cmt += "	<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>";
					cmt += "		<button class='dropdown-item btnModify' type='button' data-gbcno=" + this.gbcno +">수정</button>"
					cmt += "		<button class='dropdown-item btnDelete' type='button' data-gbcno=" + this.gbcno +">삭제</button>"
					cmt += "</div></div>";
				} else {
					cmt += "	<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>";
// 					cmt += "<i id='report' class='report fa-solid fa-handcuffs'><a class='dropdows-item' href='#' 
// 				 	data-user='${ groupBoardVo.userid }''>신고하기</a></i>"
					cmt += "		<a class='dropdown-item' href='/groupboard/memberInfo?userid=" + this.userid + "'>회원 정보 보기</a>";
					cmt += "		<i id='report' class='report fa-solid fa-handcuffs'><a class='dropdows-item' href='#' data-user='" + this.userid + "'>신고하기</a></button></i>";
					cmt += " <input type='hidden' id='userid' name='userid' value='" + this.userid + "'>";
					cmt += " <input type='hidden' id='gno' name='gno' value='${ groupBoardVo.gno }'>";
					cmt += "</div></div>";
				}
				cmt += "</div>"
				cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 97%; height:58px; margin-bottom: 10px;'>"
					+ this.gbc_content + "</textarea>";
				if("${loginVo.userid}" == this.userid) {	
					cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-gbcno=" + this.gbcno + 
							 " style='display: none; width: 80px; height:40px; padding: 0.7% 0'>수정완료</button>";
				}	
				cmt += "<hr style='width:98%; margin-left: 0px; padding-left: 0;'>"; 
				cmt += "</div>";
				$("#comment").append(cmt);	
					
			})
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
		var gno = "${groupBoardVo.gno}"
		console.log(gbno);
		
		var heart = that.prop("name");
		console.log(heart);
		
		var url = "/groupboard/heart";
		var sData = {
				"gbno" : gbno,
				"heart" : heart,
				"gno" : gno
		};
		
		$.post(url, sData, function(rData){
			console.log("rData:", rData);
			that.prop("name", rData);
			
			if(rData == 1){
				$("i.fa-heart").css("color", "red");
// 				$("#like").text("${groupBoardVo.gb_like + 1}");
				span.text(parseInt(span.text().trim()) + 1);
			} else {
				$("i.fa-heart").css("color", "graytext");
// 				$("#like").text("${groupBoardVo.gb_like}");
				span.text(parseInt(span.text().trim()) - 1);
			}
		});
	});
	
	// 댓글 삭제
	$("#comment").on("click", ".btnDelete", function() {
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
	$("#comment").on("click", ".btnModify", function() {
		var gbcno = $(this).attr("data-gbcno");
		var btnModifyRun = $(this).parent().parent().parent().parent().find(".btnModifyRun");
		console.log(btnModifyRun);
		var comment = btnModifyRun.prev();
		btnModifyRun.show();
		console.log(comment);
		comment.removeAttr("disabled");
		btnModifyRun.click(function() {
			var gbcno = btnModifyRun.attr("data-gbcno");
			console.log(gbcno);
			var gbc_content = comment.val();
			console.log(gbc_content);
			var sData = {
					"gbcno" : gbcno,
					"gbc_content" : gbc_content
			};
			var url = "/groupcomment/updateGroupComment";
			$.post(url, sData, function(rData) {
				console.log(rData);
				if(rData == "true") {
					comment.attr("disabled", true);
					$(".btnModify").show();
					$(".btnModifyRun").hide();
					getCommentList();
				}
			});
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



<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				
				<div class="col-md-2"></div>
			
				<div class="col-md-8">
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
					<c:if test="${ loginVo.userid == groupBoardVo.userid }">
					<table>
						<tr>
							<td><a href="/groupboard/groupUpdateForm?gbno=${ groupBoardVo.gbno }" class="btn btn-sm btn btn-outline-warning">수정</a></td>
							<td><a href="/groupboard/groupDelete?gbno=${ groupBoardVo.gbno }&gno=${groupBoardVo.gno}" class="btn btn-sm btn-outline-danger">삭제</a></td>
						</tr>
					</table>
					</c:if>
				
				<!-- 댓글 -->
				<div class="comments">
<%-- 				댓글[<span class="count">${ groupBoardVo.gb_comment }</span>] --%>
				</div>
				<div class="row">
					<div class="col-md-9">
						<input type="text" id="c_content" class="form-control" placeholder="댓글을 입력해주세요">
						<input type="hidden" value="${ loginVo.userid }" id="c_userid" class="form-control">
					</div>
					<div>
						<button type="button" id="btnCommentInsert" class="btn btn-sm btn-outline-primary">완료</button>
					</div>
				
				<div class="row col-md-9" style="margin-top: 20px; margin-left: 20px;" id="comment">
					<div style="display: none;">
						<button type="button" class="btn btn-sm btn-outline-warning btnCommentModify"
							style="width: 10%; height:50px; padding: 1% 0">수정</button>
						<button type="submit" class="btn btn-sm btn-outline-success btnCommentModifyRun" 
							style="display: none; width: 10%; height:50px; padding: 1% 0">수정완료</button>
					</div>
				</div>
				
				</div>
				
				</div>
				<div class="col-md-2">
				
<!-- 				<aside class="main-sidebar sidebar-dark-primary elevation-4"> -->
					<div class="list-group">
						 <a style="background-color: #2D5082;" href="#" class="list-group-item list-group-item-action active">Home</a>
						<div class="list-group-item">
							<h2>${ groupVo.g_name }</h2>
						</div>
						<div class="list-group-item">
							<p class="list-group-item-text">
								${ groupVo.g_intro }
							</p>
						</div>
						<div class="list-group-item justify-content-between">
							<a href="/groupboard/groupMain/${ groupBoardVo.gno }?gbno=${groupBoardVo.gbno}?gno=${param.gno}?page=${param.page}">그룹 메인으로</a>
						</div>
							<a style="background-color: #2D5082;" href="/group/groupInfo?gno=${ groupBoardVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
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
				
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>