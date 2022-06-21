<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<link href='/resources/css/calendar.css' rel='stylesheet' />
</head>
<script>
	$(function() {
		var jsonCal = ${jsonCal};
		var thisYear = new Date().getFullYear();
		var thisMonth = new Date().getMonth() + 1;
		var thisDate = new Date().getDate();
		var thisToday = thisYear + '_' + thisMonth + '_' + thisDate;
		var divToday = $(".dateBoard .divDate[data-today=" + thisToday + "]");
		var selectDate = thisToday;
		var that = divToday;
		divToday.attr("style", "background: aliceblue;");
		$("#main-day").html(thisToday.substring(0, 4) + "년 " + thisToday.substring(5, 6) + "월 " + thisToday.substring(7) + "일");
		$(".dateBoard").on("click", ".divDate", function() {
			that = $(this);
			var thatSpan = that.find("span").attr("data-check");
			selectDate = $(this).attr("data-today");
			var myDate = selectDate.substring(0, 4) + "년 " + selectDate.substring(5, 6) + "월 " + selectDate.substring(7) + "일";
			var userid = "${loginVo.userid}";
			$("#main-day").html(myDate);
			$(".todo-content").html("");
			$.each(jsonCal, function() {
				if (this.start1 == that.attr("data-today")) {
// 					$(".todo-content").append("<input class='checkList' value='" + this.cno + "' data-today='" + selectDate +  "' type='checkbox'><label>" + this.content + "</label><br>");
					$(".todo-content").append("<label>" + this.content + "</label><br>");
// 					$(".todo-content").append("<input class='checkList' value='" + this.cno + "' data-today='" + selectDate +  "' type='checkbox' checked><label>" + this.content + "</label><br>");
// 					$(".todo-content").append("<label>" + this.content + "</label><br>");
				}
			});
		});
		function getCalendarList() {
			var divDate = $(".dateBoard .divDate[data-today]");
			divDate.find("span").remove();
			divDate.find("br").remove();
			var url = "/calendar/newCalendar";
			var userid = "${loginVo.userid}";
			var sData = {
				'userid' : userid,
				'start1' : selectDate
			};
			$.get(url, sData, function(rData) {
				jsonCal = rData;
			$.each(divDate, function() {
				var data = this.dataset.today;
				var thisDiv = this;
				$.each(jsonCal, function(e) {
					if (this.start1 == data) {
// 						$(thisDiv).append("<br><span data-check='" + this.checklist + "' data-cno='" + this.cno + "'>" + this.content + "</span>");
						$(thisDiv).append("<span data-check='" + this.checklist + "' data-cno='" + this.cno + "' style='color: orange; margin-right: 10px;'><i class='fa-solid fa-flag'></i></span>");
					}
				});
			});
			});
		}
		$("#prevMonth").click(function() {
			var prevDay = new Date(date.setMonth(date.getMonth() - 1));
			var prevYear = prevDay.getFullYear();
			var prevMonth = prevDay.getMonth() + 1;
			var sData = {
				'month' : prevYear + '_' + prevMonth,
				'userid' : '${loginVo.userid}'
			};
			console.log(sData);
			$.get('/calendar/cal3', sData, function(rdata) {
				jsonCal = rdata;
				makeCalendar(prevDay);
				getCalendarList();
			});
			console.log("get after");
			
		});
		$("#nextMonth").click(function() {
			var nextDay = new Date(date.setMonth(date.getMonth() + 1));
			var nextYear = nextDay.getFullYear();
			var nextMonth = nextDay.getMonth() + 1;
			var sData = {
				'month' : nextYear + '_' + nextMonth,
				'userid' : '${loginVo.userid}'
			};
			console.log(sData);
			$.get('/calendar/cal3', sData, function(rdata) {
				jsonCal = rdata;
				makeCalendar(nextDay);
				getCalendarList();
			});
			
		});
		getCalendarList();
		$("#input-data").click(function() {
			var insertContent = $("#input-box").val();
			var url = "/calendar/save";
			var userid = "${loginVo.userid}";
			var sData = {
				'userid' : userid,
				'content' : insertContent,
				'start1' : selectDate
			};
			if (insertContent != null && insertContent != "") {
				$.post(url, sData, function(rData) {
					console.log(rData);
					if(rData == "true") {
// 						that.append("<br><span>" + insertContent + "</span>");
// 						that.append("<br><span style='color: #7CFC00;'>●</span>");
// 						$(".todo-content").append("<br><input class='checkList' data-today='" + selectDate + "' type='checkbox'><label>" + insertContent + "</label>");
						$(".todo-content").append("<label>" + insertContent + "</label>");
						$("#input-box").val("");
					} else if (rData == "false") {
						alert("이러다 다~ 죽어");
					}
					getCalendarList();
				});
			}
		});
// 		$("#update-check").click(function() {
// // 			var insertContent = $("todo-content").text();
// 			var insertContent = $(".checkList").next("label").text();
// 			var url = "/calendar/update";
// 			var userid = "${loginVo.userid}";
// 			var checklist = $(".checkList").prop("checked");
// 			var cno = 0;
// 			var sData = {
// 				'userid' : userid,
// 				'content' : insertContent,
// 				'start1' : selectDate,
// 				'checklist' : checklist,
// 				'cno' : cno
// 			};
// 			if (insertContent != null && insertContent != "") {
// 				$.post(url, sData, function(rData) {
// 					if(rData == "true"){
// 						$("#input-box").val("");
// 						// 클릭했던 날짜부분의 check->true
// 						that.children("span").attr("data-check", "true");
// 					} else if (rData == "false") {
// 						$("#input-box").val("");
// 						that.children("span").attr("data-check", "false");
// 					}
// 				});
// // 				getCalendarList();
// 			}
// 		});
	});
</script>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<div class='rap left'>
					<div class="header">
						<div id="prevMonth">
							<img class="arrows" src="/resources/images/prev.png">
						</div>
						<h2 class='dateTitle'></h2>
						<div id="nextMonth">
							<img class="arrows" src="/resources/images/next.png">
						</div>
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
			</div>
			<div class="col-md-4 colRight">
				<div class="right">
					<div class="content-left">
				        <div class="main-wrap">
				          <div id="main-day" class="main-day"></div>
				        </div>
				        <div class="todo-wrap">
				          <div class="todo-title">오늘의 일정</div>
				          <div class="todo-content"></div>
				          <div class="input-wrap">
				            <input type="text" placeholder="please write here!!" id="input-box" class="input-box form-control">
				            <button type="button" id="input-data" class="btn btn-outline-primary"><span>INPUT</span></button>
<!-- 				            <button type="button" id="update-check" class="btn btn-warning"><span>CHECK</span></button> -->
				            <div id="input-list" class="input-list"></div>
				          </div>
				        </div>
      				</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="/resources/js/calendar.js"></script>
</html>
<%@include file="/WEB-INF/views/include/footer.jsp" %>