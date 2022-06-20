<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<script>
$(function() {
	var create_result = "${create_result}";
	if(create_result == "true") {
		alert("작성 완료");
	}
	
	var update_result = "${update_result}";
	if(update_result == "true") {
		alert("수정 완료");
	}
	
	var delete_result = "${delete_result}";
	if(delete_result == "true") {
		alert("삭제 완료");
	}
	
	var frmPaging = $("#frmPaging");
	
	// 검색 버튼
	$("#btnSearch").click(function() {
		console.log("click");
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		console.log("searchType: ", searchType);
		console.log("keyword: ", keyword);
		
		frmPaging.find("input[name=searchType]").val(searchType);
		frmPaging.find("input[name=keyword]").val(keyword);
		frmPaging.attr("action", "/groupboard/groupMain/${gno}");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 그룹 탈퇴 버튼
	$("#leaveGroup").click(function() {
		console.log("click");
		$("#modal-734488").trigger("click");
	});
	
	// 모달, 탈퇴 버튼(일반 그룹원)
	$("#leave").click(function() {
		console.log("Click");
		var userid = "${loginVo.userid}";
		var gno = ${groupVo.gno};
		var url = "/group/deleteMember/" + userid + "/" + gno;
// 		var sData = {
// 				"gno" : gno
// 		}
		
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				alert("탈퇴 완료");
				$("#btnModalClose").trigger("click");
			}
		});
	});
	
	// 그룹 채팅방 팝업
	$("#chatRoom").click(function(e){
		e.preventDefault();
		console.log("채팅방 입장");	
		var url = "/chat/chat";
		var option = "width = 650px, height=800px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "그룹 채팅방 입장", option);
	});
	
	// 그룹장 변경 팝업
// 	$("#updateGLeader").click(function(e) {
// 		e.preventDefault();
// 		console.log("그룹장 변경");
// 		var gno = ${groupVo.gno};
// 		var url = "/groupboard/updateGLeader/" + gno;
// 		var option = "width = 500px, height=200px, top=300px, left=300px, scrollbars=yes";
// 		window.open(url, "그룹장 변경", option);
// 	});
});
</script>

<%@ include file="/WEB-INF/views/groupboard/frmPaging.jsp" %>

${ groupVo }
<hr>
${ loginVo }
<hr>
${ groupJoinMember }


<!-- 그룹 탈퇴 누르면 뜨는 모달창 -->
<div class="row">
	<div class="col-md-12">
		 <a id="modal-734488" href="#modal-container-734488" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
		
		<div class="modal fade" id="modal-container-734488" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							그룹 탈퇴
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						정말로 탈퇴하시겠습니까?
					</div>
					<div class="modal-footer">
						 
						<button id="leave" type="button" class="btn btn-primary">
							탈퇴
						</button> 
						<button type="button" id="btnModalClose" class="btn btn-secondary" data-dismiss="modal">
							취소
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>

<!-- <!-- 그룹장이 그룹탈퇴 누르면 뜨는 모달창 --> -->
<!-- <div class="row"> -->
<!-- 	<div class="col-md-12"> -->
<!-- 		 <a id="modal-405504" href="#modal-container-405504" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a> -->
		
<!-- 		<div class="modal fade" id="modal-container-405504" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 			<div class="modal-dialog" role="document"> -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h5 class="modal-title" id="myModalLabel"> -->
<!-- 							그룹장 변경 -->
<!-- 						</h5>  -->
<!-- 						<button type="button" class="close" data-dismiss="modal"> -->
<!-- 							<span aria-hidden="true">×</span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body"> -->
<!-- 						<select name="groupMember" id="groupMember"> -->
						
<%-- 							<c:forEach items="${ groupJoinMember }" var="groupJoinVo"> --%>
<%-- 								<option value="${ groupJoinVo.userid }">${ groupJoinVo.userid }</option> --%>
<%-- 							</c:forEach> --%>
							
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
						 
<!-- 						<button type="button" class="btn btn-primary"> -->
<!-- 							변경하고 탈퇴하기 -->
<!-- 						</button>  -->
<!-- 						<button type="button" class="btn btn-secondary" data-dismiss="modal"> -->
<!-- 							Close -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 			</div> -->
			
<!-- 		</div> -->
		
<!-- 	</div> -->
<!-- </div> -->


<!--================================
=            Page Title            =
=================================-->
<section class="page-title">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2 text-center">
				<!-- Title text -->
				<h3>${ groupVo.g_name }</h3>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>
<!--==================================
=            Blog Section            =
===================================-->

<section class="blog section">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">
			
			<c:forEach items="${ groupList }" var="groupBoardVo">
				<!-- Article 01 -->
				<article>
					<!-- Post Image -->
					<div class="image">
						<c:choose>
							<c:when test="${ empty groupBoardVo.gb_pic }">
								<div></div>
							</c:when>
							<c:otherwise>
								<img alt="게시글 사진" style="max-width: 50%; height: auto;" src="/groupboard/displayImage?filename=${groupBoardVo.gb_pic}" width="100" height="100">
							</c:otherwise>
						</c:choose>
					</div>
					<!-- Post Title -->
					<h3>${ groupBoardVo.gb_title }</h3>
					<ul class="list-inline">
						<li class="list-inline-item">
							by ${ groupBoardVo.userid }
							<button class="btn dropdown-toggle" style="background-color: #ffffff; width: 20px; height:50px; padding: 1% 0" type="button" id="dropdownMenuButton" data-toggle="dropdown">
										
											<i class='fas fa-ellipsis-v'></i>
										
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										
										<c:if test="${ groupVo.g_leader == loginVo.userid }">
											 <a class="dropdown-item disabled" href="/groupboard/groupDelete?gbno=${ groupBoardVo.gbno }&gno=${ groupBoardVo.gno }">삭제</a>
											 <a class="dropdown-item" href="/groupboard/groupUpdateForm?gbno=${ groupBoardVo.gbno }">수정</a>
										</c:if>
											 <a class="dropdown-item" href="#">회원 정보 보기</a>
											 
										</div>
							</li>
						<li class="list-inline-item">${ groupBoardVo.gb_regdate }</li>
					</ul>
					<!-- Post Description -->
					<p>${ groupBoardVo.gb_content }</p>
					
					<div>
				   		<i class='far fa-comment-alt'></i> ${ groupBoardVo.gb_comment }
						<i class='far fa-heart'></i> ${ groupBoardVo.gb_like }
					</div>
					
					<!-- Read more button -->
					<a href="/groupboard/groupRead?gbno=${ groupBoardVo.gbno }&gno=${ groupBoardVo.gno }" class="btn btn-transparent">Read More</a>
				</article>
				
			</c:forEach>
			
			</div>
			<div class="col-md-10 offset-md-1 col-lg-3 offset-lg-0">
				<div class="sidebar">
				
<!-- 				<aside class="sidebar-container widget-area sidebar-primary" style="position: fixed; top: 30px bottom: 270px;"> -->
				<div class="list-group">
						 <a href="#" class="list-group-item list-group-item-action active">Home</a>
						<div class="list-group-item">
							<h2>그룹 소개</h2>
						</div>
						<div class="list-group-item">
<!-- 							<h4 class="list-group-item-heading"> -->
<!-- 								그룹 소개 -->
<!-- 							</h4> -->
							<p class="list-group-item-text">
								${ groupVo.g_intro }
<!-- 								...(달력을 넣어서 그룹 일정 표시하도록,,?) -->
							</p>
						</div>
						
						<div class="list-group-item justify-content-between">
						
							<div>
							<select id="searchType">
								<option value="t"
									<c:if test="${ searchDto.searchType == 't' }">
										selected
									</c:if>
								>제목</option>
								<option value="c"
									<c:if test="${ searchDto.searchType == 'c' }">
										selected
									</c:if>
								>내용</option>
								<option value="w"
									<c:if test="${ searchDto.searchType == 'w' }">
										selected
									</c:if>
								>작성자</option>
							</select>
							<a href="/groupboard/groupMain/${ groupVo.gno }" class="btn-primary" style="width: 50px; height:50px; padding: 2% 0">검색 초기화</a>
							</div>
							
							<div class="widget search p-0">
								<div class="input-group">
								    <input type="text" class="form-control" id="keyword" value="${searchDto.keyword}" placeholder="Search...">
								    <span id="btnSearch" class="input-group-addon"><i class="fa fa-search"></i></span>
							    </div>
							</div>
							
<%-- 							<input type="text" id="keyword" value="${searchDto.keyword}"> --%>
<!-- 							<button id="btnSearch" style="width: 50px; height:30px; padding: 1% 0" class="btn btn-success">검색</button> -->
							
						</div>	
						
						
							<a href="/group/groupInfo?gno=${ groupVo.gno }" class="list-group-item list-group-item-action active justify-content-between">
								그룹 정보 보기
							</a>
							<div>
							<a href="/chat/chat" class="list-group-item list-group-item-action active justify-content-between" id="chatRoom">
								그룹 채팅방
							</a>
							</div>
					</div>
					<nav>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="/groupboard/groupWriteForm?gno=${ groupVo.gno }">글쓰기</a>
							</li>
							<li class="breadcrumb-item">
								<!-- 차후 그룹의 일정을 확인할 수 있도록 -->
								<a href="/groupboard/activityInfo/${ groupVo.gno }">활동 정보</a>
							</li>
							<c:if test="${ loginVo.userid != groupVo.g_leader }">
								<li class="breadcrumb-item">
									<a href="#" id="leaveGroup">그룹 탈퇴</a>
								</li>
							</c:if>
						</ol>
					</nav>
					
<!-- 					</aside> -->
				
				
					<!-- Search Widget -->
<!-- 					<div class="widget search p-0"> -->
<!-- 						<div class="input-group"> -->
<!-- 						    <input type="text" class="form-control" id="expire" placeholder="Search..."> -->
<!-- 						    <span class="input-group-addon"><i class="fa fa-search"></i></span> -->
<!-- 					    </div> -->
<!-- 					</div> -->
<!-- 					Category Widget -->
<!-- 					<div class="widget category"> -->
<!-- 						Widget Header -->
<!-- 						<h5 class="widget-header">Categories</h5> -->
<!-- 						<ul class="category-list"> -->
<!-- 							<li><a href="">Appearel <span class="float-right">(2)</span></a></li> -->
<!-- 							<li><a href="">Accesories <span class="float-right">(5)</span></a></li> -->
<!-- 							<li><a href="">Business<span class="float-right">(7)</span></a></li> -->
<!-- 							<li><a href="">Entertaiment<span class="float-right">(3)</span></a></li> -->
<!-- 							<li><a href="">Education<span class="float-right">(9)</span></a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					Store Widget -->
<!-- 					<div class="widget related-store"> -->
<!-- 						Widget Header -->
<!-- 						<h5 class="widget-header">Related Store</h5> -->
<!-- 						<ul class="store-list md list-inline"> -->
<!-- 							<li class="list-inline-item"> -->
<!-- 								<a href=""><img src="images/popular-offer/populer-offer-02.png" alt="store-image"></a> -->
<!-- 							</li> -->
<!-- 							<li class="list-inline-item"> -->
<!-- 								<a href=""><img src="images/popular-offer/populer-offer-03.png" alt="store-image"></a> -->
<!-- 							</li> -->
<!-- 							<li class="list-inline-item"> -->
<!-- 								<a href=""><img src="images/popular-offer/populer-offer-04.png" alt="store-image"></a> -->
<!-- 							</li> -->
<!-- 							<li class="list-inline-item"> -->
<!-- 								<a href=""><img src="images/popular-offer/populer-offer-05.png" alt="store-image"></a> -->
<!-- 							</li> -->
<!-- 							<li class="list-inline-item"> -->
<!-- 								<a href=""><img src="images/popular-offer/populer-offer-06.png" alt="store-image"></a> -->
<!-- 							</li> -->
<!-- 							<li class="list-inline-item"> -->
<!-- 								<a href=""><img src="images/popular-offer/populer-offer-07.png" alt="store-image"></a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					Archive Widget -->
<!-- 					<div class="widget archive"> -->
<!-- 						Widget Header -->
<!-- 						<h5 class="widget-header">Archives</h5> -->
<!-- 						<ul class="archive-list"> -->
<!-- 							<li><a href="">January 2017</a></li> -->
<!-- 							<li><a href="">February 2017</a></li> -->
<!-- 							<li><a href="">March 2017</a></li> -->
<!-- 							<li><a href="">April 2017</a></li> -->
<!-- 							<li><a href="">May 2017</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>