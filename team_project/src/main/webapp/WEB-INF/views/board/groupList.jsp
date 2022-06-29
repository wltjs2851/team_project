<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="popular_product" style="padding: 3% 10%;" >
	<a class="btn btn-warning" href="/group/addGroupForm" style="width: 110px; height:50px; padding: 1% 0">그룹 만들기</a><br><br>
	<div class="row" id="groupDiv">
	</div>
	<div id="loading" style="display: none; text-align: center; margin-top: 30px;">
		<i class="fa-solid fa-spinner" style="font-size: 30px;"></i>
	</div>
</div>

<script>
$(function() {
	var joinResult = "${joinResult}";
	if(joinResult == "true") {
		alert("그룹에 가입하셨습니다.");
	}
	
	getGroupList();

	window.onscroll = function(e) {
	      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight)
	      if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
	      $("#loading").show();
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
		if ("${locationVo}" != null && "${locationVo}" != '') {
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
 		  			div += "<div class='col-lg-3 col-md-6 col-sm-6 group'" + 
 		  			"onclick=location.href='/group/groupForm?gno=" + this.gno +
 		  			"'	style=cursor:pointer; display: none;' id='groupList'>";
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
		$("#loading").hide();
 	}
 });
</script>
<%@include file="/WEB-INF/views/include/footer.jsp" %>