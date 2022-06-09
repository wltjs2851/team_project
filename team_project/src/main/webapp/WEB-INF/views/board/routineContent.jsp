<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>


<style>
	textarea:focus {
		outline: none;
	}
	
	button {
		width: 90px; 
		height:50px; 
		padding: 0% 1%";
	}
	
	p:{
		color: black;
	}
</style>

<script>
$(function() {
	
	getCommentList();
	
	$("#btnComment").click(function() {
		var urc_comment = $("#urc_comment").val();
		var userid = $("#userid").val();
		var uno = "${routineVo.uno}";
		var u_pic = "${loginVo.u_pic}";
		var url = "/routine/addRoutineComment";
		sendData = {
				"urc_comment" : urc_comment,
				"userid" : userid,
				"uno" : uno,
				"u_pic" : u_pic
		};
		console.log(sendData);
		$.post(url, sendData, function(receiveData) {
			console.log(receiveData);
			$("#urc_comment").val("");
			$("#btnComment").css("color", "white");
			getCommentList();
		});
	});
	
	function getCommentList() {
		var uno = "${routineVo.uno}";
		var url = "/routine/commentRoutineList/" + uno;
		$.get(url, function(receivedData) {
			console.log(receivedData);
			$("#comment > div").empty();
			$.each(receivedData, function() {
				console.log(this);
				var cmt = "";
				cmt += "<div style='width:100%; word-break:break-all;word-wrap:break-word;'>";
				cmt += "<p style='font-size: large; font-weight: bold;'>";
				if(this.u_pic == null) {
					cmt += "<img src='/resources/images/board/personDefault.png' class='rounded-circle z-depth-2' width=40px>";
				} else {
					cmt += "<img src='/routine/displayImage?filename=" + this.u_pic + 
							"' class='rounded-circle z-depth-2' width=40px>";
				}
				cmt +=this.userid + "</p>";
				cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 100%'>"
							+ this.urc_comment + "</textarea>";
				cmt += "<button type='button' class='btnModify btn btn-outline-warning' data-urcno=" + this.urcno +
							" style='width: 80px; height:50px; padding: 1% 0'>수정</button>";
				cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-urcno=" + this.urcno + 
						 " style='display: none; width: 80px; height:50px; padding: 1% 0'>수정완료</button>";
						 cmt += "<button type='button' class='btnDelete btn btn-outline-danger' data-urcno=" + this.urcno +
						 " style='width: 80px; height:50px; padding: 1% 0'>삭제</button>";
				cmt += "<hr>";
				cmt += "</div>";
				$("#comment").append(cmt);
			})
		});
	}
	
	$("#comment").on("click", ".btnModify", function() {
		var urcno = $(this).attr("data-urcno");
		var btnModifyRun = $(this).next();
		console.log(urcno);
		var comment = $(this).prev();
		$(this).hide();
		btnModifyRun.show();
		console.log(comment);
		comment.removeAttr("disabled");
		btnModifyRun.click(function() {
			var rcno = btnModifyRun.attr("data-urcno");
			var urc_comment = comment.val();
			var sendData = {
					"urcno" : urcno,
					"urc_comment" : urc_comment
			};
			var url = "/routine/modifyRoutineComment"
			$.post(url, sendData, function(receivedData) {
				console.log(receivedData);
				if(receivedData == "true") {
					comment.attr("disabled", true);
					$(".btnModify").show();
					$(".btnModifyRun").hide();
					getCommentList();
				}
			});
		});
	});
	
	$("#comment").on("click", ".btnDelete", function() {
		var urcno = $(this).attr("data-urcno");
		var url = "/routine/removeRoutineComment/" + urcno;
		$.get(url, function(receivedData) {
			console.log(receivedData);
			if(receivedData == "true") {
				getCommentList();
			}
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
				<h2>${ recipeVo.r_title }</h2>
				<p style="color: #888;">${ routineVo.userid } &nbsp; ${ routineVo.ur_regdate }</p>
				<hr>
			</div>
			<div>
				${ routineVo.ur_content }
				<hr>
			</div>
			<div>
				<i class="fa-solid fa-heart" style="color: red; font-size: 25px;" >좋아요</i>
				<a href="/routine/modifyRoutineForm?uno=${ routineVo.uno }" class="btn btn-warning"
					style="width: 60px; height:40px; padding: 0.7% 0">수정</a>
				<a href="/routine/modifyRoutineForm?uno=${ routineVourno }" class="btn btn-danger"
					style="width: 60px; height:40px; padding: 0.7% 0">삭제</a>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<hr>
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-9">
					<input type="text" placeholder="댓글 입력" id="urc_comment" class="form-control">
				</div>
				<div class="col-md-2">
					<input type="text" placeholder="userid" id="userid" class="form-control">
				</div>
				<div class="col-md-1">
					<button type="button" id="btnComment" class="btn btn-primary"
						style="width: 80px; height:50px; padding: 1% 0">댓글달기</button>
				</div>
			</div>

			<div class="row" style="margin-top: 20px; margin-left: 3px;" id="comment">
			</div>
			<br>
			<br>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>