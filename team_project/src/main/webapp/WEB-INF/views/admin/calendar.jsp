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
<style>
.deleteCal {
	cursor: pointer;
}
</style>
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
			that.removeAttr("style", "background: aliceblue;");
			selectDate = $(this).attr("data-today");
			var myDate = selectDate.split("_")[0] + "년 " + selectDate.split("_")[1] + "월 " + selectDate.split("_")[2] + "일";
			var userid = "${loginVo.userid}";
			$("#main-day").html(myDate);
			$(".todo-content").html("");
			that = $(this);
			that.css("style", "background: aliceblue;");
			$.each(jsonCal, function(e) {
			var thatSpan = that.find("span").eq(e).attr("data-check");
				if (this.start1 == that.attr("data-today")) {
					if (this.checklist == 'true') {
						if (thatSpan == "false") {
							$(".todo-content").append("<input class='checkList' data-today='" + selectDate +  "' type='checkbox'><label>" + this.content + "</label><a class='deleteCal'>&times;</a><br>");
						} else {
							$(".todo-content").append("<input class='checkList' data-today='" + selectDate +  "' type='checkbox' checked><label>" + this.content + "</label><a class='deleteCal'>&times;</a><br>");
						}
					} else {
						if (thatSpan == "true") {
							$(".todo-content").append("<input class='checkList' data-today='" + selectDate +  "' type='checkbox' checked><label>" + this.content + "</label><a class='deleteCal'>&times;</a><br>");
						} else {
							$(".todo-content").append("<input class='checkList' data-today='" + selectDate +  "' type='checkbox'><label>" + this.content + "</label><a class='deleteCal'>&times;</a><br>");
						}
					}
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
						if (this.checklist == "false") {
							$(thisDiv).append("<span data-check='" + this.checklist + "' data-cno='" + this.cno + "' style='color: orange; margin-right: 8px;'><i class='fas fa-circle'></i></span>");
						} else {
// 							$(thisDiv).append("<span data-check='" + this.checklist + "' data-cno='" + this.cno + "' style='color: green; margin-right: 8px;'><img src='/resources/images/stamp.png'/></span>");
							$(thisDiv).attr("style", "padding-right: 0px;");
							$(thisDiv).attr("style", "padding-left: 0px;");
							$(thisDiv).html("<img src='/resources/images/stamp.png' style='width:95px;'/>");
						}
						return false;
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
			$.get('/calendar/cal3', sData, function(rdata) {
				jsonCal = rdata;
				makeCalendar(prevDay);
				getCalendarList();
			});
			
		});
		$("#nextMonth").click(function() {
			var nextDay = new Date(date.setMonth(date.getMonth() + 1));
			var nextYear = nextDay.getFullYear();
			var nextMonth = nextDay.getMonth() + 1;
			var sData = {
				'month' : nextYear + '_' + nextMonth,
				'userid' : '${loginVo.userid}'
			};
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
					if(rData == "true") {
						$(".todo-content").append("<input class='checkList' data-today='" + selectDate + "' type='checkbox'><label>" + insertContent + "</label><a class='deleteCal'>&times;</a><br>");
						$("#input-box").val("");
					} else if (rData == "false") {
						alert("일정은 4개까지 가능합니다.");
					}
					getCalendarList();
				});
			}
		});
		$("#update-check").click(function() {
			var url = "/calendar/update";
			var userid = "${loginVo.userid}";
			for (var i = 0; i < $(".todo-content").find("input").length; i++) {
				var insertContent = $(".checkList").eq(i).next("label").text();
				var checklist = $(".checkList").eq(i).prop("checked");
				var sData = {
					'userid' : userid,
					'content' : insertContent,
					'start1' : selectDate,
					'checklist' : checklist
				};
				if (insertContent != null && insertContent != "") {
					$.post(url, sData, function(rData) {
						if(rData == "true"){
							$("#input-box").val("");
							// 클릭했던 날짜부분의 check->true
							that.children("span").attr("data-check", "true");
						} else if (rData == "false") {
							$("#input-box").val("");
							that.children("span").attr("data-check", "false");
						}
					});
				}
			}
			getCalendarList();
		});
		$(".right").on("click", ".deleteCal", function() {
			var text = $(this).prev().html();
			var userid = "${loginVo.userid}";
			var url = "/calendar/deleteCal";
			var sData = {
				"content" : text,
				"userid" : userid,
				"start1" : selectDate
			};
			$(this).next().remove();
			$(this).prev().remove();
			$(this).prev().remove();
			$(this).remove();
			$.post(url, sData, function(rData) {
				if (rData == "true") {
					alert("일정 삭제 완료");
					getCalendarList();
				}
			});
		});
		divToday.click();
	});
</script>
<body>
	<div class="container-fluid">
		<div class="row" style="margin-bottom: 50px;">
			<div class="col-md-2"></div>
			<div class="col-md-5">
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
			<div class="col-md-3 colRight">
				<div class="right">
					<div class="content-left">
				        <div class="main-wrap">
				          <div id="main-day" class="main-day"></div>
				        </div>
				        <div class="todo-wrap">
				          <div class="todo-title">오늘의 일정</div>
				          <div class="todo-content"></div>
				          <div class="input-wrap">
				            <input type="text" placeholder="please write here!!" id="input-box" class="input-box form-control" style="margin-bottom: 10px;">
				            <button type="button" id="input-data" class="btn btn-outline-primary"><span>INPUT</span></button>
				            <button type="button" id="update-check" class="btn btn-outline-warning"><span>CHECK</span></button>
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