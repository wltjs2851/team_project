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
		var url = "/admin/heart";
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
		var userid = $("#userid").val();
		var reno = "${recommendVo.reno}";

		var sData = {
			"re_comment" : content,
			"userid" : userid,
			"reno" : reno
		};
		console.log(sData);

		var url = "/reccomment/insertComment";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
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

			$("#table_comment_list tr:gt(0)").remove();

			$.each(rData, function() {
				var tr = $("#table_clone tr").clone();
				var tds = tr.find("td");
				tds.eq(0).text(this.recno);
				tds.eq(1).text(this.re_comment);
				tds.eq(2).text(this.re_regdate);

				// 삭제버튼 찾기
				tds.find(".btnCommentDelete").attr(
						"data-recno", this.recno);
				// 수정 버튼
				tds.find(".btnCommentModify").attr(
						"data-recno", this.recno);
				$("#table_comment_list").append(tr);
			});
		});
	}

	// 댓글 삭제 버튼 
	$("#table_comment_list").on(
			"click",
			".btnCommentDelete",
			function() {
				console.log("댓글 삭제 버튼 눌림");
				var recno = $(this).attr("data-recno");
				console.log(recno);
				var url = "/reccomment/deleteComment/"
						+ recno;
				$.get(url, function(rData) {
					console.log(rData);
					if (rData == "true") {
						getCommentList();
					}
				});
			});

	// 댓글 수정 버튼 
	$("#table_comment_list")
			.on(
					"click",
					".btnCommentModify",
					function() {
						console.log("댓글 수정 버튼 눌림");
						$(this).fadeOut("slow");
						$(this)
								.next(
										".btnModifyRunComment")
								.fadeIn("slow");
						var tr = $(this).parents("tr"); //-> console확인
						console.log(tr);
						var tr_content = tr.find("td")
								.eq(1);
						var re_comment = tr.find("td")
								.eq(1).text();
						console.log(tr_content);
						console.log(re_comment);
						$(tr_content)
								.html(
										"<input type='text' class='contentModify' value='" + re_comment +"'/>");

						// 		$(this).fadeOut("slow");
						// 		$(this).next("#btnModifyRunComment").fadeIn("slow");
						$(".btnModifyRunComment").attr(
								"data-recno",
								$(this).attr("data-recno"));
					});

	// 댓글 수정 저장 버튼
	$("#table_comment_list").on(
			"click",
			".btnModifyRunComment",
			function() {
				console.log("댓글 수정완료 버튼 누름");
				var re_comment = $(this).parents("tr")
						.find(".contentModify").val();
				var recno = $(this).attr("data-recno");
				console.log("recno:" + recno);
				console.log("re_comment:" + re_comment);
				var sData = {

					"re_comment" : re_comment,
					"recno" : recno
				}
				var url = "/reccomment/updateComment";
				$.post(url, sData, function(rData) {
					console.log("rData:", rData);
					if (rData == "true") {
						getCommentList();
					}
				});
			});

	getCommentList();
});
</script>
<%-- ${recommendVo} --%>
<%-- ${heart} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<div>
		<h3 class="widget-header" style="display: inline-block;"><a href="/admin/listRecommend">추천 운동법</a></h3></div>
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
						href="/admin/updateRecommendForm?reno=${recommendVo.reno }">수정</a>
					<a type="button" class="btn btn-danger"
						href="/admin/deleteRecommend?reno=${recommendVo.reno}">삭제</a>
				</c:when>
			</c:choose>	
			
			<!-- 		댓글달기 -->
			<div class="row">
				<div class="col-md-10">
					<input type="text" id="re_comment" class="form-control"
						placeholder="댓글을 입력해주세요">
					<input type="hidden" id="userid" value="${loginVo.userid }">
				</div>
				<div class="col-md-1">
					<button type="button" id="btnComment"
						class="btn btn-sm btn-primary" style="width: 60px; height:50px; padding: 1% 0">완료</button>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<!-- 			<div class="col-md-8"> -->
				<table style="display: none;" id="table_clone">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button type="button"
								class="btn btn-sm btn-warning btnCommentModify">수정</button>
							<button type="button"
								class="btn btn-sm btn-outline-success btnModifyRunComment"
								style="display: none;">수정완료</button>
						</td>
						<td>
							<button type="button"
								class="btn btn-sm btn-danger btnCommentDelete">삭제</button>
						</td>
					</tr>
				</table>
				<table class="table" id="table_comment_list">
					<tr>
						<td>#</td>
						<td>내용</td>
						<td>날짜</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>