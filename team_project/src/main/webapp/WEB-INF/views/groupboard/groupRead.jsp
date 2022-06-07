<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function() {
	$("#btnCommentInsert").click(function() {
		console.log("click");
		var gbc_content = $("#c_content").val();
		var userid = $("#c_userid").val();
		var gbno = "${groupBoardVo.gbno}";
		var sData = {
				"gbc_content" : gbc_content,
				"userid" : userid,
				"gbno" : gbno
		}
		console.log("sData: ", sData);
		
		var url = "/groupcomment/insertGroupComment";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if(rData == "true") {
				getCommentList();
			}
		});
	});
	
	function getCommentList() {
		var gbno = "${groupBoardVo.gbno}";
		console.log(gbno);
		var url = "/groupcomment/groupCommentList/" + gbno;
		$.get(url, function(rData) {
			console.log(rData); 
			$("#table_comment_list tr:gt(0)").remove();
			
			$.each(rData, function() {
				var tr = $("#table_clone tr").clone();
				var tds = tr.find("td");
				
				tds.eq(0).text(this.gbcno);
				tds.eq(1).text(this.gbc_content);
				tds.eq(2).text(this.userid);
				tds.eq(3).text(this.gbc_regdate);
				tds.find(".btnCommentDelete").attr("data-gbcno", this.gbcno);
				tds.find(".btnCommentModify").attr("data-gbcno", this.gbcno);
				
				$("#table_comment_list").append(tr);
			});
		});
	}
	
	getCommentList();
});
</script>

${ groupBoardVo }
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-9">
					<h2>
						${ groupBoardVo.gb_title }
					</h2>
					<p>
						작성자: ${ groupBoardVo.userid }, 작성일: ${ groupBoardVo.gb_regdate }
					</p>
					<div>
						${ groupBoardVo.gb_content }
					</div>
					
					<c:choose>
					<c:when test="{empty groupBoardVo.gb_pic}">
						<div><img alt="사진 있으면 보이게 없으면 안보이게" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" /></div>
					</c:when>
					<c:otherwise>
						<div><img src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}" alt="작성자가 올린 사진"></div>
					</c:otherwise>
					</c:choose>
				
				
				<!-- 좋아요 --> 
				<i class="fas fa-heart" style="margin: 30px; font-size: 30px; color: graytext; cursor: pointer;" data-gbno="${ groupBoardVo.gbno }"></i>
				<span style="font-size: 30px;">${ boardVo.like_count }</span>
				
				<!-- 댓글 -->
				<div class="row">
					<div class="col-md-9">
						<input type="text" id="c_content" class="form-control" placeholder="댓글을 입력해주세요">
					</div>
					<div>
						<button type="button" id="btnCommentInsert" class="btn btn-sm btn-primary">완료</button>
					</div>
				</div>
				
				<div class="row" style="margin-top:30px;">
					<div class="col-md-12">
						<table style="display:none;" id="table_clone">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button type="button"
										class="btn btn-sm btn-warning btnCommentModify">수정</button>
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
								<td>작성자</td>
								<td>날짜</td>
								<td>수정</td>
								<td>삭제</td>
							</tr>
						</table>
					</div>
				</div>
				
				
				</div>
				<div class="col-md-3">
				
				<aside class="column dotcom__aside bottom-12">
					<div class="list-group">
						 <a href="#" class="list-group-item list-group-item-action active">Home</a>
						<div class="list-group-item">
							그룹 명
						</div>
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								그룹 소개
							</h4>
							<p class="list-group-item-text">
								...
							</p>
						</div>
						<div class="list-group-item justify-content-between">
							Help <span class="badge badge-secondary badge-pill">14</span>
						</div> <a href="#" class="list-group-item list-group-item-action active justify-content-between">Home <span class="badge badge-light badge-pill">14</span></a>
					</div>
					<nav>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="/groupboard/groupWriteForm">글쓰기</a>
							</li>
							<li class="breadcrumb-item">
								<a href="#">활동 정보</a>
							</li>
							<li class="breadcrumb-item">
								<a href="">그룹 탈퇴</a>
							</li>
						</ol>
					</nav>
					<div class="row">
						<div>
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
								<div class="card-block">
									<h5 class="card-title">
										Card title
									</h5>
									<p class="card-text">
										그룹원
									</p>
									<p>
										<a class="btn btn-primary" href="#">쪽지보내기</a>
									</p> 
								</div>
							</div>
						</div>
					</div>
					</aside>
				
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>