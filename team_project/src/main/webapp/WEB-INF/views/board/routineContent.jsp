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
		var userid = "${loginVo.userid}";
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
				var cmt = "";
				cmt += "<div style='width:100%; word-break:break-all;word-wrap:break-word;'>";
				cmt += "<div class='row'><p style='font-size: large; font-weight: bold;'>";
				if(this.u_pic == null) {
					cmt += "<img src='/resources/images/board/personDefault.png' class='rounded-circle z-depth-2' width=40px>";
				} else {
					cmt += "<img src='/free/displayImage?filename=" + this.u_pic + 
							"' class='rounded-circle z-depth-2' width=40px style='margin-right: 10px;'>";
				}
				cmt +=this.userid + "</p>";
				cmt += "<div class='dropdown' style='float:right'>"
				cmt += "	<button class='btn dropdown-toggle' style='background-color: #ffffff; width: 20px; height:36px; padding: 1% 0; margin-left: 10px' type='button' id='dropdownMenuButton' data-toggle='dropdown'>";
				cmt += "		<i class='fas fa-ellipsis-v'></i></button>";
				cmt += "	<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>";
				if("${loginVo.userid}" == this.userid) {				
					cmt += "		<button class='dropdown-item btnModify' type='button' data-urcno='" + this.urcno +"'>수정</button>"
					cmt += "		<button class='dropdown-item btnDelete' type='button' data-urcno='" + this.urcno +"'>삭제</button>"
				} else {
					cmt += "		<button class='dropdown-item btnReport' type='button' data-urcno='" + this.urcno +
						"' data-user='" + this.userid + "'>신고</button>"
				}
				cmt += "</div></div>";
				cmt += "</div>"
				cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 97%; height:58px; margin-bottom: 10px;'>"
							+ this.urc_comment + "</textarea>";
				if("${loginVo.userid}" == this.userid) {	
					cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-urcno='" + this.urcno + 
							 "' style='display: none; width: 80px; height:40px; padding: 0.7% 0'>수정완료</button>";
				}
				cmt += "<hr style='width:98%; margin-left: 0px; padding-left: 0;'>"; 
				cmt += "</div>";
				$("#comment").append(cmt);
			})
		});
	}
	
	$("#comment").on("click", ".btnModify", function() {
		var urcno = $(this).attr("data-urcno");
		var btnModifyRun = $(this).parent().parent().parent().parent().find(".btnModifyRun");
		console.log(btnModifyRun);
		var comment = btnModifyRun.prev();
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
	
	$("#comment").on("click", ".btnReport", function() {
		var urcno = $(this).attr("data-urcno");
		var receiver = $(this).attr("data-user");
		var sender = "${loginVo.userid}";
		var url = "/reportBoard/reportBoardPop?urcno=" + urcno + "&sender=" + sender + "&receiver=" + receiver;
		var option = "width = 350px, height=400px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"신고",option);
	});
	
	var like_cnt = ${like_cnt};
	console.log(like_cnt);
	var span = $("#span_like");
	
	if (like_cnt > 0){
		// 좋아요 1 이상인 경우
		$("i.fa-heart").css("color", "red");
	} else {
		$("i.fa-heart").css("color", "graytext");
	}
	
	var is_like;
	
	$("i.fa-heart").click(function() {
		var like = $(this);
		var url = "/routine/updateLike";
		var sendData = {
				"uno" : "${ routineVo.uno }",
				"userid" : "${ loginVo.userid }",
				"ur_like" : parseInt(span.text()),
				"like_cnt" : like_cnt
		}
		$.post(url, sendData, function(receivedData) {
			console.log("receivedData: ", receivedData);
			if(receivedData == 1) {
				like.css("color", "red");
		 		span.text(parseInt(span.text().trim()) + 1);
		 		like_cnt = receivedData;
			} else {					
				like.css("color", "graytext");
			 	span.text(parseInt(span.text().trim()) - 1);
			 	like_cnt = receivedData;
			}
		});
	});
	
	function adjustHeight() {
		var textEle = $('textarea');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight);
		}
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
				<h2>${ routineVo.ur_title }</h2>
				<p style="color: #888;">${ routineVo.userid } &nbsp; ${ routineVo.ur_regdate }</p>
				<hr>
			</div>
			<div>
				${ routineVo.ur_content }
				<hr>
			</div>
			<div>
				<i class="fa-solid fa-heart" style="color: red; font-size: 25px;" ></i><span id="span_like">${ routineVo.ur_like }</span> &nbsp;
				<c:if test="${ routineVo.userid == loginVo.userid }">
				<a href="/routine/modifyRoutineForm?uno=${ routineVo.uno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-warning"
					style="width: 60px; height:40px; padding: 0.7% 0">수정</a>
				<a href="/routine/removeRoutineRun?uno=${ routineVo.uno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-danger"
					style="width: 60px; height:40px; padding: 0.7% 0">삭제</a>
				</c:if>
				<a href="/routine/routineList?page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-outline-primary"
					style="width: 60px; height:40px; padding: 0.7% 0">목록</a>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<hr>
			<div class="col" style="margin-top: 20px;">
				<div>	
					<textarea onkeyup="adjustHeight();" rows="4"
					id="urc_comment" style="width: 100%; resize: none;" placeholder="댓글 입력"></textarea>
					<button type="button" id="btnComment" class="btn btn-primary"
						style="width: 80px; height: 50px; padding: 1% 0; float: right; margin-top: 5px;">댓글달기</button>
				</div>
			</div>

			<div class="row" style="margin-top: 55px; margin-left: 3px;" id="comment">
			</div>
			<br>
			<br>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>