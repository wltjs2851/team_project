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
			$("#r_content").val("");
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
				cmt += "<p><div style='width:100%; word-break:break-all;word-wrap:break-word;'>";
				if(this.u_pic == null) {
					cmt += "<img src='/resources/images/board/personDefault.png' class='img-circle elevation-2' width=100>"
				} else {
					"<p><img src='/recipe/displayImage?filename='" + this.u_pic + 
							"class='img-circle elevation-2'>";
				}
				cmt +=this.userid + "</p>"
				cmt += "<textarea disabled class='txtComment form-control' style='resize: none; overflow:hidden; width : 100%'>" + this.rc_comment
					+ "</textarea>"
				cmt += "</div>";
				cmt += "<hr><br><br>"
				$("#comment").append(cmt);
			})
		});
	}
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/recipe/recipeModifyRun" method="post" enctype="multipart/form-data">
				<input type="hidden" name="rno" value="${ recipeVo.rno }">
				<div class="form-group">
					<label for="r_title"> 제목 </label>  
					<input type="text" class="form-control" id="r_title" name="r_title" value="${ recipeVo.r_title }" required disabled
						style="background-color: #FFFFFF;"/>
				</div>
				
				<div class="form-group">
					<div contentEditable="false"
						style="min-height: 100px; height: 100%; max-width: 100%;"
						class="form-control" id="r_content">
						<c:if test="${ not empty recipeVo.r_pic }">
							<img id="recipeImage" src="/recipe/displayImage?filename=${ recipeVo.r_pic }" data-image="${ recipeVo.r_pic }"
								style="width: 100px;" name="recipeImage">
							<br>
						</c:if>
						<textarea onkeyup="adjustHeight();" style="border: none; width: 100%; background-color: #FFFFFF; resize: none;" 
							name="r_content" disabled>${ recipeVo.r_content }</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="userid"> 사용자 </label>  
					<input type="text" class="form-control" id="userid" name="userid" required disabled value="${ recipeVo.userid }"
						style="background-color: #FFFFFF"/>
				</div>
				
				<div class="form-group">
					<label for="file"> File input </label> 
					<input type="file" class="form-control-file" id="file" name="file" disabled/>
					<p class="help-block">Example block-level help text here.</p>
				</div>
				<button type="button" class="btn btn-warning" id="btnModify"
					style="width: 80px; height:50px; padding: 1% 0">수정하기</button>
				<button type="submit" class="btn btn-success" id="btnModifyRun" 
					style="display: none; width: 80px; height:50px; padding: 1% 0">수정완료</button>
				<br>
				<br>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<hr>
			<div class="row" style="margin-top: 40px">
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

				<div class="row" style="margin-top: 40px" id="comment">
				</div>
			</div>
			<br>
			<br>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>