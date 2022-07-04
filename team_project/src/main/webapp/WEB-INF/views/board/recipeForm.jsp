<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		font-size: 18px;
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
		var nickname = "${loginVo.nickname}";
		var rno = "${recipeVo.rno}";
		var u_pic = "${loginVo.u_pic}";
		var url = "/recipe/addRecipeComment";
		sendData = {
				"rc_comment" : rc_comment,
				"nickname" : nickname,
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
							cmt += "		<button class='dropdown-item btnModify' type='button' data-rcno='" + this.rcno +"'>수정</button>"
							cmt += "		<button class='dropdown-item btnDelete' type='button' data-rcno='" + this.rcno +"'>삭제</button>"
						} else {
							cmt += "		<button class='dropdown-item btnReport' type='button' data-rcno='" + this.rcno +
								"' data-user='" + this.nickname + "'>신고</button>"
						}
						cmt += "</div></div>";
						cmt += "</div>"
					cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 97%; height:100px; margin-bottom: 10px;'>"
								+ this.rc_comment + "</textarea>";
					if("${loginVo.nickname}" == this.nickname) {	
						cmt +=	"<button type='button' class='btnModifyRun btn btn-outline-success' data-rcno=" + this.rcno + 
								 " style='display: none; width: 80px; height:40px; padding: 0.7% 0'>수정완료</button>";
					}
					cmt += "<hr style='width:98%; margin-left: 0px; padding-left: 0;'>"; 
					cmt += "</div>";
				}
				$("#comment").append(cmt);
			})
		});
	}
	
	$("#comment").on("click", ".btnModify", function() {
		var rcno = $(this).attr("data-rcno");
		var btnModifyRun = $(this).parent().parent().parent().parent().find(".btnModifyRun");
		console.log(rcno);
		var comment = btnModifyRun.prev();
		btnModifyRun.show();
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
	
	$("#comment").on("click", ".btnDelete", function() {
		var rcno = $(this).attr("data-rcno");
		var url = "/recipe/removeRecipeComment/" + rcno;
		$.get(url, function(receivedData) {
			console.log(receivedData);
			if(receivedData == "true") {
				getCommentList();
			}
		});
	});
	
	$("#comment").on("click", ".btnReport", function() {
		var rcno = $(this).attr("data-rcno");
		var receiver = $(this).attr("data-user");
		var sender = "${loginVo.nickname}";
		var url = "/reportBoard/reportBoardPop?rcno=" + rcno + "&sender=" + sender + "&receiver=" + receiver;
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
		var url = "/recipe/updateLike";
		var sendData = {
				"rno" : "${ recipeVo.rno }",
				"nickname" : "${ loginVo.nickname }",
				"r_like" : parseInt(span.text()),
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
});
</script>

<div class="container-fluid">
	<c:choose>
	<c:when test="${ recipeVo.visible == 0 }">
	<div class="row">
		<div class="col-md-2"></div>
		<c:choose>
			<c:when test="${ recipeVo.r_product == ' ' || empty recipeVo.r_product }">
				<div class="col-md-8">
			</c:when>
			<c:otherwise>
				<div class="col-md-7">
			</c:otherwise>
		</c:choose>
			<div>
				<h2>${ recipeVo.r_title }</h2>
				<p style="color: #888;">${ recipeVo.nickname } &nbsp; ${ recipeVo.r_regdate }</p>
				<hr>
			</div>
			<div>
				${ recipeVo.r_content }
			<hr>
			</div>
			<div class="row" style="margin-left: 10px;">
<%-- 				<i class="fa-solid fa-heart" style="font-size: 25px;" ></i><p style="font-size: 25px"><span id="span_like">${ recipeVo.r_like }</span> &nbsp; --%>
				<i class="fa-solid fa-heart" style="font-size: 25px; margin-top: 5px; margin-left: 5px;" ></i><p style="font-size: 25px; margin-right: 10px;"><span id="span_like">${ recipeVo.r_like }</span></p> &nbsp;
				<c:if test="${recipeVo.nickname == loginVo.nickname}">
				<a href="/recipe/modifyRecipeForm?rno=${ recipeVo.rno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}" 
					class="btn btn-warning" style="width: 60px; height:40px; padding: 0.7% 0;">수정</a>
				<a href="/recipe/recipeRemoveRun?rno=${ recipeVo.rno }&page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}"
					 class="btn btn-danger" style="width: 60px; height:40px; padding: 0.7% 0; margin-left: 8px;">삭제</a>
				</c:if>
				<c:choose>
					<c:when test="${param.page != null}">
						<a href="/recipe/recipeList?page=${param.page}&perPage=10&searchType=${param.searchType}&keyword=${param.keyword}"
				 class="btn btn-outline-primary" style="width: 60px; height:40px; padding: 0.7% 0; margin-left: 8px;">목록</a>
					</c:when>
					<c:otherwise>
						<a href="/recipe/recipeList"
				 class="btn btn-outline-primary" style="width: 60px; height:40px; padding: 0.7% 0; margin-left: 8px;">목록</a>
					</c:otherwise>
				</c:choose>
			</div>
			<hr>
			<div class="col" style="margin-top: 20px;">
				<div>
					<input type="hidden" id="nickname" class="form-control">
					<textarea onkeyup="adjustHeight();" rows="4" id="rc_comment"
						style="width: 100%; resize: none;" placeholder="댓글 입력"></textarea>
					<button type="button" id="btnComment" class="btn btn-primary"
						style="width: 80px; height: 50px; padding: 1% 0; float: right; margin-top: 5px;">댓글달기</button>
				</div>
			</div>
			<div class="row" style="margin-top: 55px; margin-left: 22px" id="comment">
			</div>
			<br>
			<br>
		</div>
		<c:choose>
			<c:when test="${ recipeVo.r_product == ' ' || empty recipeVo.r_product }">
				<div class="col-md-2"></div>
			</c:when>
			<c:otherwise>	
				<div class="col-md-3" style='padding-right:15%'>
				<h2>추천상품</h2>
				${fn:replace(recipeVo.r_product, '×', '')}
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	</c:when>
	<c:otherwise>
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
				<h2>${ recipeVo.r_title }</h2>
				<p style="color: #888;">${ routineVo.nickname } &nbsp; ${ recipeVo.r_regdate }</p>
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