<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<link href='/resources/css/calendar.css' rel='stylesheet'/>
</head>
<script>
$(function() {
	var thisYear = new Date().getFullYear();
	var thisMonth = new Date().getMonth() + 1;
	var thisDate = new Date().getDate();
	var thisToday = thisYear + '_' + thisMonth + '_' + thisDate;
	var divToday = $(".dateBoard .divDate[data-today=" + thisToday + "]");
// 	divToday.attr("style", "background: #FFEBEE;");
// 	$('<div style="width:80px; height:60px;"></div>').appendTo(divToday);
	$('<div><span>Today</span></div>').appendTo(divToday);
// 	divToday.prepend("<img src='/resources/imgaes/smile.png'/>");

// 	var selectDate = $(".dateBoard").attr("data-today");
// 	var divSelectday = $(".dateBoard .divDate[data-today=" + selectDate + "]");
	
	
	$(".dateBoard").on("click",".divDate", function() {
		
		var thisYear = new Date().getFullYear();
		var thisMonth = new Date().getMonth() + 1;
		var thisDate = new Date().getDate();
		var thisToday = thisYear + '_' + thisMonth + '_' + thisDate;
		console.log("thisToday:" + thisToday);
		var divToday = $(".dateBoard .divDate[data-today=" + thisToday + "]");
// 		divToday.attr("style", "background: skyblue;");
		
	 	var insertContent = prompt("일정을 입력해주세요.");
		var selectDate = $(this).attr("data-today");
		var divSelectday = $(".dateBoard .divDate[data-today=" + selectDate + "]");
		var userid = "${loginVo.userid}";
		console.log(selectDate);
	 	console.log(insertContent);
	 	console.log(userid);
	 	var url = "/calendar/save";
	 	var sData = {
		 		'userid' : userid,
		 		'content' : insertContent,
		 		'start1' : selectDate
		 	};
	 	if (insertContent != null && insertContent != "") {
	 		$.post(url, sData, function(rData) {
	 			console.log(rData);
	 			if (rData == "true"){
// 	 				getCalList();
	 				divSelectday.attr("style", "background: #FFEBEE;");
	 	 			$('<div style="width:80%;"><span><img src="/resources/images/smile.png"/></span></div>').appendTo(divSelectday);
	 			}
	 		});
	 	}
	});
	
	// 일정 목록 
// 	function getCalList(){
// 		var userid = "${loginVo.userid}";
// 		var url = "/calendar/list/" + userid;
// 		$.get(url, function(rData){
// 			console.log("getCalList:" + rData);
			
// 			});
// 		});
});
</script>
<body>
${calList}
<c:forEach items="${calList }" var="cal">
	<div>${cal.content }</div>
</c:forEach>
	<div class='rap'>
		<div class="header">
			<div class="btn prevDay" id="prevMonth"></div>
			<h2 class='dateTitle'></h2>
			<div class="btn nextDay" id="nextMonth"></div>
		</div>

		<div class="grid dateHead">
			<div>일</div>
			<div>월</div>
			<div>화</div>
			<div>수</div>
			<div>목</div>
			<div>금</div>
			<div>토</div>
		</div>

		<div class="grid dateBoard"></div>
	</div>
</body>
<script type="text/javascript" src="/resources/js/calendar.js"></script>
</html>