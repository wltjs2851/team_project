<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	var updateRecommend_result = "${updateRecommend_result}";
	if (updateRecommend_result == "true") {
		alert("추천 운동글 수정 완료");
	}

	// 좋아요
	var heartval = ${heart};
	var span = $("i.fa-heart").next();
	
	if (heartval > 0){
		// 좋아요 1 이상인 경우
		console.log(heartval);
		$("i.fa-heart").css("color", "red");
		$("i.fa-heart").prop("name", heartval);
	} else {
		// 좋아요가 하나도 없는 경우 
		console.log(heartval);
		$("i.fa-heart").css("color", "black");
		$("i.fa-heart").prop("name", heartval);
	}
	
	// 좋아요 - 하트 클릭 시
	$("i.fa-heart").click(function(){
		console.log("좋아요 클릭");
		
		var that = $("i.fa-heart");
		var reno = that.attr("data-reno");
		console.log(reno);
		var heart = that.prop("name");
		console.log(heart);
		var url = "/recommend/heart";
		var sData = {
				"reno" : reno,
				"heart" : that.prop('name')
		};
		
		$.post(url, sData, function(rData){
			console.log("rData:", rData);
			that.prop('name', rData);
			
			if(rData == 1){
				$("i.fa-heart").css("color", "red");
				span.text(parseInt(span.text().trim()) + 1);
			} else {
				$("i.fa-heart").css("color", "black");
				span.text(parseInt(span.text().trim()) - 1);
			}
		});
		
		
	});
	
	// 댓글 달기 버튼 
	$("#btnComment").click(function() {
		// 		e.preventDefault();
		console.log("댓글 달기")
		var content = $("#re_comment").val();
		var nickname = "${loginVo.nickname}";
		var reno = "${recommendVo.reno}";
		var u_pic = "${loginVo.u_pic}";
		var sData = {
			"re_comment" : content,
			"nickname" : nickname,
			"reno" : reno,
			"u_pic" : u_pic
		};
		console.log(sData);

		var url = "/reccomment/insertComment";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
				$("#re_comment").val("");
				$("#btnComment").css("color", "white");
				getCommentList();
			}
		});
	});

	// 댓글 목록 얻기 
	function getCommentList() {
		var reno = "${recommendVo.reno}";
		var url = "/reccomment/listComment/" + reno;
		$.get(url, function(rData) {
			console.log(rData);
			$("#comment > div").empty();
			$.each(rData, function() {
				var cmt = "";
				cmt += "<div style='width:100%; word-break:break-all;word-wrap:break-word;'>";
				cmt += "<div class='row'><p style='font-size: large; font-weight: bold;'>";
				if(this.u_pic == null) {
					cmt += "<img src='/resources/images/board/personDefault.png' class='rounded-circle z-depth-2' width=40px>";
				} else {
					cmt += "<img src='/recommend/displayImage?filename=" + this.u_pic + 
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
						cmt += "		<button class='dropdown-item btnModify' type='button' data-recno='" + this.recno +"'>수정</button>"
						cmt += "		<button class='dropdown-item btnDelete' type='button' data-recno='" + this.recno +"'>삭제</button>"
					} else {
						cmt += "		<button class='dropdown-item btnReport' type='button' data-recno='" + this.recno +
							"' data-user='" + this.nickname + "'>신고</button>"
					}
					cmt += "</div></div>";
					cmt += "</div>"
					cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 97%; height:58px; margin-bottom: 10px;'>"
								+ this.re_comment + "</textarea>";
					if("${loginVo.nickname}" == this.nickname) {	
						cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-recno='" + this.recno + 
								 "' style='display: none; width: 80px; height:40px; padding: 0.7% 0'>수정완료</button>";
					}
					cmt += "<hr style='width:98%; margin-left: 0px; padding-left: 0;'>"; 
					cmt += "</div>";
				}
				$("#comment").append(cmt);
			});
		});
	}
	
	//댓글 수정
	$("#comment").on("click", ".btnModify", function() {
		var recno = $(this).attr("data-recno");
		var btnModifyRun = $(this).parent().parent().parent().parent().find(".btnModifyRun");
		console.log(btnModifyRun);
		var comment = btnModifyRun.prev();
		btnModifyRun.show();
		console.log(comment);
		comment.removeAttr("disabled");
		btnModifyRun.click(function() {
			var recno = btnModifyRun.attr("data-recno");
			var re_comment = comment.val();
			var sendData = {
					"recno" : recno,
					"re_comment" : re_comment
			};
			var url = "/reccomment/updateComment"
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
	
	//댓글 삭제
	$("#comment").on("click", ".btnDelete", function() {
		var recno = $(this).attr("data-recno");
		var url = "/reccomment/deleteComment/" + recno;
		$.get(url, function(receivedData) {
			console.log(receivedData);
			if(receivedData == "true") {
				getCommentList();
			}
		});
	});
	
	//댓글 신고
	$("#comment").on("click", ".btnReport", function() {
		var recno = $(this).attr("data-recno");
		var receiver = $(this).attr("data-user");
		var sender = "${loginVo.nickname}";
		var url = "/reportBoard/reportBoardPop?recno=" + recno + "&sender=" + sender + "&receiver=" + receiver;
		var option = "width = 350px, height=400px, top=300px, left=300px, scrollbars=yes";
		window.open(url,"신고",option);
	});

	getCommentList();
	
	function adjustHeight() {
		var textEle = $('textarea');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight);
	}
});
</script>
<%-- ${recommendVo} --%>
<%-- ${heart} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<div>
		<h3 class="widget-header" style="display: inline-block;"><a href="/recommend/listRecommend">추천 운동법</a></h3></div>
			<hr>
			<div>
			<h2>${recommendVo.re_title }</h2>
			<hr>
			</div>
			<div>
				${recommendVo.re_content }
				<hr>
			</div>
<!-- 			좋아요 -->
				<div>
					<i class="fas fa-heart"
						style="text-align:center; margin: 15px; font-size: 30px; color: graytext; cursor: pointer;" 
								data-reno="${recommendVo.reno}"></i>
					<span style="font-size: 20px;">${recommendVo.re_like}</span>
				</div>
<!-- 			게시글 수정 -->
			<c:choose>
				<c:when test="${loginVo.userid == 'admin01'}">
					<a type="button" class="btn btn-primary" id="btnUpdateRecommend"
						href="/recommend/updateRecommendForm?reno=${recommendVo.reno }">수정</a>
					<a type="button" class="btn btn-danger"
						href="/recommend/deleteRecommend?reno=${recommendVo.reno}">삭제</a>
				</c:when>
			</c:choose>	
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
					id="re_comment" style="width: 100%; resize: none;" placeholder="댓글 입력"></textarea>
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