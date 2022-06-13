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
	$("#btnModify").click(function() {
		$("*[disabled]").attr("disabled", false);
// 		$("#r_content").attr("contentEditable", true);
		$(this).hide();
		$("#btnModifyRun").show();
	});
	
	$("#btnModifyRun").click(function() {
		var r_content = document.getElementById("r_content").innerHTML;
		r_content.
		console.log(r_content);
	});
	
	var textEle = $('textarea');
	textEle.on('keyup', function() {
	  adjustHeight();
	});
	
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight);
	}
	
	$("#file").change(function(){
	    setImageFromFile(this, "#recipeImage");
	});
	
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr("src", e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	getCommentList();
	
	$("#btnComment").click(function() {
		var rc_comment = $("#rc_comment").val();
		var userid = $("#userid").val();
		var rno = "${recipeVo.rno}";
		var u_pic = "${loginVo.u_pic}";
		var url = "/recipe/addRecipeComment";
		sendData = {
				"rc_comment" : rc_comment,
				"userid" : userid,
				"rno" : rno,
				"u_pic" : u_pic
		};
		console.log(sendData);
		$.post(url, sendData, function(receiveData) {
			console.log(receiveData);
			$("#rc_comment").val("");
			$("#btnComment").css("color", "white");
			getCommentList();
		});
	});
	
	function getCommentList() {
		var rno = "${recipeVo.rno}";
		var url = "/recipe/commentRecipeList/" + rno;
		$.get(url, function(receivedData) {
			console.log(receivedData);
			$("#comment > div").empty();
			$.each(receivedData, function() {
				console.log(this.u_pic);
				var cmt = "";
				cmt += "<div style='width:100%; word-break:break-all;word-wrap:break-word;'>";
				cmt += "<p style='font-size: large; font-weight: bold;'>";
				if(this.u_pic == null) {
					cmt += "<img src='/resources/images/board/personDefault.png' class='rounded-circle z-depth-2' width=40px>";
				} else {
					cmt += "<img src='/recipe/displayImage?filename=" + this.u_pic + 
							"' class='rounded-circle z-depth-2' width=40px>";
				}
				cmt +=this.userid + "</p>";
				cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 100%'>" + this.rc_comment
					+ "</textarea>";
				cmt += "<button type='button' class='btnModify btn btn-outline-warning' data-rcno=" + this.rcno +
					 " style='width: 80px; height:50px; padding: 1% 0'>수정</button>";
				cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-rcno=" + this.rcno + 
						 " style='display: none; width: 80px; height:50px; padding: 1% 0'>수정완료</button>";
						 cmt += "<button type='button' class='btnDelete btn btn-outline-danger' data-rcno=" + this.rcno +
						 " style='width: 80px; height:50px; padding: 1% 0'>삭제</button>";
				cmt += "<hr>";
				cmt += "</div>";
				$("#comment").append(cmt);
			})
		});
	}
	
	$("#comment").on("click", ".btnModify", function() {
		var rcno = $(this).attr("data-rcno");
		var btnModifyRun = $(this).next();
		console.log(rcno);
		var comment = $(this).prev();
		$(this).hide();
		btnModifyRun.show();
		console.log(comment);
		comment.removeAttr("disabled");
		btnModifyRun.click(function() {
			var rcno = btnModifyRun.attr("data-rcno");
			var rc_comment = comment.val();
			var sendData = {
					"rcno" : rcno,
					"rc_comment" : rc_comment
			};
			var url = "/recipe/modifyComment"
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
	
	var like_cnt = ${like_cnt};
	var span = $("span");
	
	if (like_cnt > 0){
		// 좋아요 1 이상인 경우
		$("i.fa-heart").css("color", "red");
	} else {
		$("i.fa-heart").css("color", "graytext");
	}
	
	var is_like;
	
	$("i.fa-heart").click(function() {
		var like = $(this);
		var url = "/recipe/updateLike";
		var sendData = {
				"rno" : "${ recipeVo.rno }",
				"userid" : "${ loginVo.userid }",
				"rlno" : "${ recipeVo.rlno }",
				"r_like" : "${ recipeVo.r_like }",
				"like_cnt" : like_cnt
		}
		$.post(url, sendData, function(receivedData) {
			console.log("receivedData: ", receivedData);
			if(receivedData == "true") {
				like.css("color", "graytext");
			 	span.text(parseInt(span.text().trim()) - 1);
			} else {					
				like.css("color", "red");
		 		span.text(parseInt(span.text().trim()) + 1);
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
				<p style="color: #888;">${ recipeVo.userid } &nbsp; ${ recipeVo.r_regdate }</p>
				<hr>
			</div>
			<div>
				${ recipeVo.r_content }
				<hr>
			</div>
			<div class="row">
				<i class="fa-solid fa-heart" style="font-size: 25px;" ></i><p style="font-size: 25px"><span>${ recipeVo.r_like }</span> &nbsp;
				<a href="/recipe/modifyRecipeForm?rno=${ recipeVo.rno }" class="btn btn-warning"
					style="width: 60px; height:40px; padding: 0.7% 0">수정</a>
				<a href="/recipe/modifyRecipeForm?rno=${ recipeVo.rno }" class="btn btn-danger"
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
					<input type="text" placeholder="댓글 입력" id="rc_comment" class="form-control">
				</div>
				<div class="col-md-2">
					<input type="text" placeholder="userid" id="userid" class="form-control">
				</div>
				<div class="col-md-1">
					<button type="button" id="btnComment" class="btn btn-primary"
						style="width: 80px; height:50px; padding: 1% 0">댓글달기</button>
				</div>

				<div class="row" style="margin-top: 20px; margin-left: 20px;" id="comment">
					<div style="display: none;">
						<button type="button" class="btn btn-sm btn-outline-warning btnCommentModify"
							style="width: 10%; height:50px; padding: 1% 0">수정</button>
						<button type="submit" class="btn btn-sm btn-outline-success btnCommentModifyRun" 
							style="display: none; width: 10%; height:50px; padding: 1% 0">수정완료</button>
					</div>
				</div>
			</div>
			<br>
			<br>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>