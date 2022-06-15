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
		divToday.attr("style", "background: #FFEBEE;");
		
		$(".dateBoard").on("click", ".divDate", function() {
			var that = $(this);
			var insertContent = prompt("일정을 입력해주세요.");
			var selectDate = $(this).attr("data-today");
			var userid = "${loginVo.userid}";
			console.log(selectDate);
			console.log(insertContent);
			console.log(userid);
			
// 			if(userid == "${groupVo.g_leader}") {
				
				var url = "/calendar/save";
				var sData = {
					'userid' : userid,
					'content' : insertContent,
					'start1' : selectDate
				};
				if (insertContent != null && insertContent != "") {
					$.post(url, sData, function(rData) {
						console.log(rData);
						if(rData == "true"){
							that.append("<br><span>" + insertContent + "</span>");
	// 						getCalendarList();
						}
					});
	// 				getCalendarList();
				}
			
// 			}
		});
		function getCalendarList() {
			var divDate = $(".dateBoard .divDate[data-today]");
			$.each(divDate, function() {
				var data = this.dataset.today;
				var thisDiv = this;
				$.each(jsonCal, function() {
					console.log("this:", this);
					if (this.start1 == data) {
						$(thisDiv).append("<br><span>" + this.content + "</span>");
					}
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
				console.log(rdata, "rData");
				jsonCal = rdata;
				console.log(jsonCal, "jsonCal");
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
				console.log(rdata, "rData");
				jsonCal = rdata;
				console.log(jsonCal, "jsonCal");
				makeCalendar(nextDay);
				getCalendarList();
			});
			
		});
		getCalendarList();
	});
</script>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-9">
				
				<div class='rap'>
						<div class="header">
							<div id="prevMonth"><img class="arrows" src="/resources/images/prev.png"></div>
							<h2 class='dateTitle'></h2>
							<div id="nextMonth"><img class="arrows" src="/resources/images/next.png"></div>
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
				<div class="col-md-3">
				
				<span id="span"></span>
				
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/calendar.js"></script>
</html>
<%@include file="/WEB-INF/views/include/footer.jsp" %>