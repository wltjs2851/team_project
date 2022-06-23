<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- <script>
$(function() {
	var joinResult = "${joinResult}";
	if(joinResult == "true") {
		alert("그룹에 가입하셨습니다.");
	}

	var currentPage=1;
	var isLoading=false;
	
	$(window).on("scroll",function(){
	    //위로 스크롤된 길이
	    let scrollTop=$(window).scrollTop();
	    //웹브라우저의 창의 높이
	    let windowHeight=$(window).height();
	    //문서 전체의 높이
	    let documentHeight=$(document).height();
	    //바닥까지 스크롤 되었는 지 여부를 알아낸다.
	    let isBottom=scrollTop+windowHeight + 10 >= documentHeight;

	    if(isBottom){
	        //만일 현재 마지막 페이지라면
	        if(currentPage == "${totalPageCount}" || isLoading){
	            return; //함수를 여기서 끝낸다.
	        }
	        //현재 로딩 중이라고 표시한다.
	        isLoading=true;
	        //요청할 페이지 번호를 1 증가시킨다.
	        currentPage++;
	        //추가로 받아올 페이지를 서버에 ajax 요청을 하고
	        console.log("inscroll"+currentPage);
	        getGroupList();

	    }; 
	});
	
 	var url = "/group/groupList2";
 	var startRow = 1;
 	sendData = {
 			"startRow" : startRow
 	}
 	$.get(url, sendData, function(recievedData) {
 		console.log(recievedData);
 		console.log("first");
 		$.each(recievedData, function() {
 			var div = "";
 			div += "<div class='col-lg-3 col-md-6 col-sm-6 group' onclick='location.href ='/group/groupForm?gno=" + this.gno +
 						"'' style=cursor:pointer; display: none;' id='groupList'>";
 			div += "<div class='product_item'><div style='text-align: center;'>";
 			if(this.g_pic == null) {
 				div += "<img src='/resources/images/board/groupDefault.png'" +
 				"class='img-thumbnail' alt='group image' style='height: 280px'>";
 			} else {
 				div += "<img src='/group/displayImage?filename=" + this.g_pic +
 					"' class='img-thumbnail' alt='group image' style='height: 280px; text-align: center;'>";
 			}
 			div += "<div class='comment'><h5>" + this.g_name + "</h5>" + this.g_intro + "<br>";
 			div += "<i class='fa-solid fa-user-group'></i>" + this.g_present + "/" + this.g_attend + "</div>";
 			div += "</div></div></div>";
 			$("#groupDiv").append(div);
 		});
 	});
	
	function getGroupList() {
		console.log($("#groupDiv > div").length);
		var startRow2 = $("#groupDiv > div").length + 1;
		  $.ajax({
		      url :"/group/groupList2",
		      type : "get",
		      dataType : "json",
		      data : {
		         "startRow" : startRow2
		      },
		      success : function(rData){
		         console.log("ajax", rData);
		         $.each(rData, function() {
 		  			var div = "";
 		  			div += "<div class='col-lg-3 col-md-6 col-sm-6 group' onclick='location.href ='/group/groupForm?gno=" + this.gno +
		  						"'' style=cursor:pointer; display: none;' id='groupList'>";
 		  			div += "<div class='product_item'><div style='text-align: center;'>"; 		  			if(this.g_pic == null) {
 		  				div += "<img src='/resources/images/board/groupDefault.png'" +
		  				"class='img-thumbnail' alt='group image' style='height: 280px'>";
		  			} else {
		  				div += "<img src='/group/displayImage?filename=" + this.g_pic +
		  					"' class='img-thumbnail' alt='group image' style='height: 280px; text-align: center;'>";
		  			}
		  			div += "<div class='comment'><h5>" + this.g_name + "</h5>" + this.g_intro + "<br>";
		  			div += "<i class='fa-solid fa-user-group'></i>" + this.g_present + "/" + this.g_attend + "</div>";
 		  			div += "</div></div></div>";
 		  			$("#groupDiv").append(div);
 		  		});      
 		      }
 		   });

 	}
 });
</script> -->

<div class="popular_product" style="padding: 3% 10%;" >
	<a class="btn btn-warning" href="/group/addGroupForm" style="width: 110px; height:50px; padding: 1% 0">그룹 만들기</a><br><br>
	<div class="row" id="groupDiv">
<%-- 		<c:forEach items="${ groupList }" var="groupVo"> --%>
<%-- 		<div class="col-lg-3 col-md-6 col-sm-6 group" onclick="location.href ='/group/groupForm?gno=${groupVo.gno}'"  --%>
<!-- 			style="cursor:pointer; display: none;" id="groupList"> -->
<!-- 			<div class="product__item"> -->
<!-- 				<div style="text-align: center;"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${ empty groupVo.g_pic }"> --%>
<!-- 							<img src="/resources/images/board/groupDefault.png" -->
<!-- 								class="img-thumbnail" alt="group image" style="height: 280px"> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<img src="/group/displayImage?filename=${ groupVo.g_pic }" --%>
<!-- 								class="img-thumbnail" alt="group image" style="height: 280px; text-align: center;"> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 					<div class="comment"> -->
<%-- 						<h5>${ groupVo.g_name }</h5> --%>
<%-- 						${ groupVo.g_intro }<br> --%>
<%-- 						<i class="fa-solid fa-user-group"></i> ${ groupVo.g_present }/${ groupVo.g_attend } --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 		</c:forEach> --%>
	</div>
</div>

<script>
$(function() {
	var joinResult = "${joinResult}";
	if(joinResult == "true") {
		alert("그룹에 가입하셨습니다.");
	}

// 	var currentPage=1;
// 	var isLoading=false;
	
// 	$(window).on("scroll",function(){
// 	    //위로 스크롤된 길이
// 	    let scrollTop=$(window).scrollTop();
// 	    //웹브라우저의 창의 높이
// 	    let windowHeight=$(window).height();
// 	    //문서 전체의 높이
// 	    let documentHeight=$(document).height();
// 	    //바닥까지 스크롤 되었는 지 여부를 알아낸다.
// 	    let isBottom=scrollTop+windowHeight + 10 >= documentHeight;

// 	    if(isBottom){
// 	        //만일 현재 마지막 페이지라면
// 	        if(currentPage == "${totalPageCount}" || isLoading){
// 	            return; //함수를 여기서 끝낸다.
// 	        }
// 	        //현재 로딩 중이라고 표시한다.
// 	        isLoading=true;
// 	        //요청할 페이지 번호를 1 증가시킨다.
// 	        currentPage++;
// 	        //추가로 받아올 페이지를 서버에 ajax 요청을 하고
// 	        console.log("inscroll"+currentPage);
// 	        getGroupList();

// 	    }; 
// 	});

	var count = 2;
    window.onscroll = function(e) {
      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight)
      if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
        setTimeout(function(){
        	getGroupList();
        }, 1000)  
      }
    }
	
	function getGroupList() {
		console.log($("#groupDiv > div").length);
		var startRow = $("#groupDiv > div").length + 1;
		var dno = "";
		var sno = "";
		var sgno = "";
		if (${locationVo != null}) {
			dno = "${locationVo.dno}";
			sno = "${locationVo.sno}";
			sgno = "${locationVo.sgno}";
		}
		if ("${locationVo}" == "") {
			console.log("locationVo == null")
			$.ajax({
		      url :"/group/groupList2",
		      type : "get",
		      dataType : "json",
		      data : {
		         "startRow" : startRow
		      },
		      success : function(rData){
		         console.log("ajax", rData);
		         $.each(rData, function() {
 		  			var div = "";
 		  			div += "<div class='col-lg-3 col-md-6 col-sm-6 group' onclick='location.href ='/group/groupForm?gno=" + this.gno +
		  						"'' style=cursor:pointer; display: none;' id='groupList'>";
 		  			div += "<div class='product_item'><div style='text-align: center;'>"; 		  			if(this.g_pic == null) {
 		  				div += "<img src='/resources/images/board/groupDefault.png'" +
		  				"class='img-thumbnail' alt='group image' style='height: 280px'>";
		  			} else {
		  				div += "<img src='/group/displayImage?filename=" + this.g_pic +
		  					"' class='img-thumbnail' alt='group image' style='height: 280px; text-align: center;'>";
		  			}
		  			div += "<div class='comment'><h5>" + this.g_name + "</h5>" + this.g_intro + "<br>";
		  			div += "<i class='fa-solid fa-user-group'></i>" + this.g_present + "/" + this.g_attend + "</div>";
 		  			div += "</div></div></div>";
 		  			$("#groupDiv").append(div);
 		  		});      
 		      }
 		   });
		} else {
			console.log("else");
			$.ajax({
			      url :"/group/groupList2",
			      type : "get",
			      dataType : "json",
			      data : {
			         "startRow" : startRow,
			         "dno" : dno,
			         "sno" : sno,
			         "sgno" : sgno
			      },
			      success : function(rData){
			         console.log("ajax", rData);
			         $.each(rData, function() {
	 		  			var div = "";
	 		  			div += "<div class='col-lg-3 col-md-6 col-sm-6 group' onclick='location.href ='/group/groupForm?gno=" + this.gno +
			  						"'' style=cursor:pointer; display: none;' id='groupList'>";
	 		  			div += "<div class='product_item'><div style='text-align: center;'>"; 		  			if(this.g_pic == null) {
	 		  				div += "<img src='/resources/images/board/groupDefault.png'" +
			  				"class='img-thumbnail' alt='group image' style='height: 280px'>";
			  			} else {
			  				div += "<img src='/group/displayImage?filename=" + this.g_pic +
			  					"' class='img-thumbnail' alt='group image' style='height: 280px; text-align: center;'>";
			  			}
			  			div += "<div class='comment'><h5>" + this.g_name + "</h5>" + this.g_intro + "<br>";
			  			div += "<i class='fa-solid fa-user-group'></i>" + this.g_present + "/" + this.g_attend + "</div>";
	 		  			div += "</div></div></div>";
	 		  			$("#groupDiv").append(div);
	 		  		});      
	 		      }
	 		   });
		}
 	}
 });
</script>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
