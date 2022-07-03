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
		var nickname = "${loginVo.nickname}";
		var uno = "${routineVo.uno}";
		var u_pic = "${loginVo.u_pic}";
		var url = "/routine/addRoutineComment";
		sendData = {
				"urc_comment" : urc_comment,
				"nickname" : nickname,
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
				cmt +=this.nickname + "</p>";
				if(this.visible == 1) {
					cmt += "</div><div style='margin-bottom: 15px;'><h3>관리자에 의해 규제된 댓글입니다.<h3>";
					cmt += "</div><hr style='width:98%; margin-left: 0px; padding-left: 0;'>"; 
				} else {
					cmt += "<div class='dropdown' style='float:right'>"
					cmt += "	<button class='btn dropdown-toggle' style='background-color: #ffffff; width: 20px; height:36px; padding: 1% 0; margin-left: 10px' type='button' id='dropdownMenuButton' data-toggle='dropdown'>";
					cmt += "		<i class='fas fa-ellipsis-v'></i></button>";
					cmt += "	<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>";
					if("${loginVo.nickname}" == this.nickname) {				
						cmt += "		<button class='dropdown-item btnModify' type='button' data-urcno='" + this.urcno +"'>수정</button>"
						cmt += "		<button class='dropdown-item btnDelete' type='button' data-urcno='" + this.urcno +"'>삭제</button>"
					} else {
						cmt += "		<button class='dropdown-item btnReport' type='button' data-urcno='" + this.urcno +
							"' data-user='" + this.nickname + "'>신고</button>"
					}
					cmt += "</div></div>";
					cmt += "</div>"
					cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 97%; height:58px; margin-bottom: 10px;'>"
								+ this.urc_comment + "</textarea>";
					if("${loginVo.nickname}" == this.nickname) {	
						cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-urcno='" + this.urcno + 
								 "' style='display: none; width: 80px; height:40px; padding: 0.7% 0'>수정완료</button>";
					}
					cmt += "<hr style='width:98%; margin-left: 0px; padding-left: 0;'>"; 
					cmt += "</div>";
				}
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
		var sender = "${loginVo.nickname}";
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
				"nickname" : "${ loginVo.nickname }",
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
	<c:choose>
	<c:when test="${ routineVo.visible == 0 }">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
				<h2>${ routineVo.ur_title }</h2>
				<p style="color: #888;">${ routineVo.nickname } &nbsp; ${ routineVo.ur_regdate }</p>
				<hr>
			</div>
			<div>
				${ routineVo.ur_content }
				<hr>
			</div>
			<div class="row" style="margin-left: 10px; height: 40px;">
				<i class="fa-solid fa-heart" style="font-size: 25px; margin-top: 5px; margin-left: 5px;" ></i><p style="font-size: 25px; margin-right: 10px;"><span id="span_like">${ routineVo.ur_like }</span></p> &nbsp;
				<c:if test="${ routineVo.nickname == loginVo.nickname }">
				<a href="/routine/modifyRoutineForm?uno=${ routineVo.uno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-warning"
					style="width: 60px; height:40px; padding: 0.7% 0;">수정</a>
				<a href="/routine/removeRoutineRun?uno=${ routineVo.uno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-danger"
					style="width: 60px; height:40px; padding: 0.7% 0; margin-left: 8px;">삭제</a>
				</c:if>
				<a href="/routine/routineList?page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-outline-primary"
					style="width: 60px; height:40px; padding: 0.7% 0; margin-left: 8px;">목록</a>
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
	</c:when>
	<c:otherwise>
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
				<h2>${ routineVo.ur_title }</h2>
				<p style="color: #888;">${ routineVo.nickname } &nbsp; ${ routineVo.ur_regdate }</p>
				<hr>
				<div style="text-align: center; margin-bottom: 100px; margin-top: 100px;">
					<h1>관리자에 의해 규제된 글입니다.</h1>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
		</div>
	</c:otherwise>
	</c:choose>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>