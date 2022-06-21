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
		var fc_comment = $("#fc_comment").val();
		var userid = "${loginVo.userid}";
		var fno = "${freeVo.fno}";
		var u_pic = "${loginVo.u_pic}";
		var url = "/free/addFreeComment";
		sendData = {
				"fc_comment" : fc_comment,
				"userid" : userid,
				"fno" : fno,
				"u_pic" : u_pic
		};
		console.log(sendData);
		$.post(url, sendData, function(receiveData) {
			console.log(receiveData);
			$("#fc_comment").val("");
			$("#btnComment").css("color", "white");
			getCommentList();
		});
	});
	
	function getCommentList() {
		var fno = "${freeVo.fno}";
		var url = "/free/commentFreeList/" + fno;
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
					cmt += "<img src='/free/displayImage?filename=" + this.u_pic + 
							"' class='rounded-circle z-depth-2' width=40px>";
				}
				cmt +=this.userid + "</p>";
				cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 100%'>"
							+ this.fc_comment + "</textarea>";
				cmt += "<button type='button' class='btnModify btn btn-outline-warning' data-fcno=" + this.fcno +
							" style='width: 80px; height:50px; padding: 1% 0'>수정</button>";
				cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-fcno=" + this.fcno + 
						 " style='display: none; width: 80px; height:50px; padding: 1% 0'>수정완료</button>";
						 cmt += "<button type='button' class='btnDelete btn btn-outline-danger' data-fcno=" + this.fcno +
						 " style='width: 80px; height:50px; padding: 1% 0'>삭제</button>";
				cmt += "<hr>";
				cmt += "</div>";
				$("#comment").append(cmt);
			})
		});
	}
	
	$("#comment").on("click", ".btnModify", function() {
		var fcno = $(this).attr("data-fcno");
		var btnModifyRun = $(this).next();
		console.log(fcno);
		var comment = $(this).prev();
		$(this).hide();
		btnModifyRun.show();
		console.log(comment);
		comment.removeAttr("disabled");
		btnModifyRun.click(function() {
			var fcno = btnModifyRun.attr("data-fcno");
			var fc_comment = comment.val();
			var sendData = {
					"fcno" : fcno,
					"fc_comment" : fc_comment
			};
			var url = "/free/modifyFreeComment"
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
		var fcno = $(this).attr("data-fcno");
		var url = "/free/removeFreeComment/" + fcno;
		$.get(url, function(receivedData) {
			console.log(receivedData);
			if(receivedData == "true") {
				getCommentList();
			}
		});
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
		var url = "/free/updateLike";
		var sendData = {
				"fno" : "${ freeVo.fno }",
				"userid" : "${ loginVo.userid }",
				"f_like" : parseInt(span.text()),
				"like_cnt" : like_cnt
		}
		$.post(url, sendData, function(receivedData) {
			console.log("receivedData: ", receivedData);
			if(receivedData == 1) {
				like.css("color", "red");
		 		span.text(parseInt(span.text().trim()) + 1);
		 		span.css("color", "red");
		 		like_cnt = receivedData;
			} else {					
				like.css("color", "graytext");
			 	span.text(parseInt(span.text().trim()) - 1);
				span.css("color", "graytext");
			 	like_cnt = receivedData;
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
				<h2>[${ freeVo.fname }] ${ freeVo.f_title }</h2>
				<p style="color: #888;">${ freeVo.userid } &nbsp; ${ freeVo.f_regdate }</p>
				<hr>
			</div>
			<div>
				${ freeVo.f_content }
				<hr>
			</div>
			<div>
				<i class="fa-solid fa-heart" style="color: red; font-size: 25px;" ></i><span id="span_like">${ freeVo.f_like }</span>
				<c:if test="${ freeVo.userid == loginVo.userid }">
					<a href="/free/modifyFreeForm?fno=${ freeVo.fno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-warning"
						style="width: 60px; height:40px; padding: 0.7% 0">수정</a>
					<a href="/free/removeFreeRun?fno=${ freeVo.fno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-danger"
						style="width: 60px; height:40px; padding: 0.7% 0">삭제</a>
				</c:if>
				<a href="/free/freeList?page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-outline-primary"
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
					<input type="hidden" id="userid" class="form-control">
					<textarea onkeyup="adjustHeight();" rows="4" id="fc_comment"
						style="width: 100%; resize: none;" placeholder="댓글 입력"></textarea>
					<button type="button" id="btnComment" class="btn btn-primary"
						style="width: 80px; height: 50px; padding: 1% 0; float: right; margin-top: 5px;">댓글달기</button>
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