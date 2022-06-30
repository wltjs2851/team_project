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

<%-- ${ groupVo.g_leader } --%>
<!-- <hr> -->
<%-- ${ groupJoinMember } --%>

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
			selectDate = $(this).attr("data-today");
			var myDate = selectDate.split("_")[0] + "년 " + selectDate.split("_")[1] + "월 " + selectDate.split("_")[2] + "일";
			var userid = "${loginVo.userid}";
			$("#main-day").html(myDate);
			$(".todo-content").html("");
			$.each(jsonCal, function(e) {
			var thatSpan = that.find("span").eq(e).attr("data-check");
// 			console.log(thatSpan);
			console.log(this.gc_content);
			
				if (this.gc_date == that.attr("data-today")) {
					if (this.checklist == 'true') {
						if (thatSpan == "false") {
							$(".todo-content").append("<span class='checkList' data-today='" + selectDate +  "' type='checkbox'><input type='text' class='inputContent form-control' readonly id='inputContent' value='" + this.gc_content + "'>" + 
									"<c:if test='${loginVo.userid == groupVo.g_leader}'>" +
									"<button type='button' data-gcno='" + this.gcno + "' id='update' style='width: 70px; height:40px; padding: 2% 0' class='update btn btn-outline-warning'>UPDATE</button>" + 
									"<button type='button'style='display: none; width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='upadateRun btn btn-outline-warning'>DONE</button>" + 
									"<button type='button' style='width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='delete btn btn-outline-danger'>DELETE</button>" + 
									"</c:if><br>");
						} else {
							$(".todo-content").append("<span class='checkList' data-today='" + selectDate +  "' type='checkbox' checked><input type='text' class='inputContent form-control' readonly id='inputContent' value='" + this.gc_content + "'>" + 
									"<c:if test='${loginVo.userid == groupVo.g_leader}'>" +
									"<button type='button' data-gcno='" + this.gcno + "' id='update' style='width: 70px; height:40px; padding: 2% 0' class='update btn btn-outline-warning'>UPDATE</button>" + 
									"<button type='button'style='display: none; width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='upadateRun btn btn-outline-warning'>DONE</button>" + 
									"<button type='button' style='width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='delete btn btn-outline-danger'>DELETE</button>" + 
									"</c:if><br>");
						}
					} else {
						if (thatSpan == "true") {
							$(".todo-content").append("<span class='checkList' data-today='" + selectDate +  "' type='checkbox' checked><input type='text' class='inputContent form-control' readonly id='inputContent' value='" + this.gc_content + "'>" + 
									"<c:if test='${loginVo.userid == groupVo.g_leader}'>" +
									"<button type='button' data-gcno='" + this.gcno + "' id='update' style='width: 70px; height:40px; padding: 2% 0' class='update btn btn-outline-warning'>UPDATE</button>" + 
									"<button type='button'style='display: none; width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='upadateRun btn btn-outline-warning'>DONE</button>" + 
									"<button type='button' style='width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='delete btn btn-outline-danger'>DELETE</button>" + 
									"</c:if><br>");
						} else {
							$(".todo-content").append("<span class='checkList' data-today='" + selectDate +  "' type='checkbox'><input type='text' class='inputContent form-control' readonly id='inputContent' value='" + this.gc_content + "'>" + 
									"<c:if test='${loginVo.userid == groupVo.g_leader}'>" +
									"<button type='button' data-gcno='" + this.gcno + "' id='update' style='width: 70px; height:40px; padding: 2% 0' class='update btn btn-outline-warning'>UPDATE</button>" + 
									"<button type='button'style='display: none; width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='upadateRun btn btn-outline-warning'>DONE</button>" + 
									"<button type='button' style='width: 70px; height:40px; padding: 2% 0' data-gcno='" + this.gcno + "' class='delete btn btn-outline-danger'>DELETE</button>" + 
									"</c:if><br>");
						}
					}
				}
			});
			
		});
		
		function getCalendarList() {
			var divDate = $(".dateBoard .divDate[data-today]");
			divDate.find("span").remove();
			divDate.find("br").remove();
			var url = "/groupcal/groupCalendar";
			var gno = "${groupVo.gno}";
			var sData = {
				'gno' : gno,
				'gc_date' : selectDate
			};
// 			console.log(sData);
			$.get(url, sData, function(rData) {
				console.log(rData);
				jsonCal = rData;
				$.each(divDate, function() {
					var data = this.dataset.today;
// 					console.log("data: ", data);
					var thisDiv = this;
					$.each(jsonCal, function(e) {
						if (this.gc_date == data) {
							console.log("gc_date: ", this.gc_date);
							$(thisDiv).append("<span style='color: orange; margin-right: 10px;'><i class='fa-solid fa-flag'></i></span>");
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
			var url = "/groupcal/insertGroupCal";
			var gno = "${groupVo.gno}";
			var sData = {
					'gno' : gno,
				'gc_content' : insertContent,
				'gc_date' : selectDate
			};
			if (insertContent != null && insertContent != "") {
				$.post(url, sData, function(rData) {
					console.log(rData);
					if(rData == "true") {
						$("#todo-content").append("<span class='checkList' data-today='" + selectDate + "' type='checkbox'><label>" + insertContent + "</label>");
						$("#input-box").val("");
					} else if (rData == "false") {
						alert("이러다 다~ 죽어");
					}
					getCalendarList();
				});
			}
		});
		
		// 일정 수정
		$(".todo-content").on("click", ".update", function() {
			console.log("click");

// 			var gcno = $(this).attr("data-gcno");
// 			$(this).prev().find(".inputContent").attr("readonly", false);
			$(this).prev().attr("readonly", false);
			
			$(this).fadeOut("slow");
			$(this).next().fadeIn("slow");
		});
		
		$(".todo-content").on("click", ".upadateRun", function() {
			console.log("Click");
			var that = $(this);
			
			var url = "/groupcal/updateCal";
			var gcno = $(this).attr("data-gcno");
			var gc_content = $(this).parent().find(".inputContent").val();
			var inputContent = $(this).parent().find(".inputContent");
			
			console.log("gcno: ", gcno);
			console.log("gc_content: ", gc_content);
			
			var sData = {
					"gcno" : gcno,
					"gc_content" : gc_content
			}
			
			console.log("updateFinish, sData: ", sData);
			
			$.post(url, sData, function(rData) {
				console.log("updateFinish, rData: ", rData);
				
				if(rData == "true") {
					inputContent.attr("readonly", true);
					that.fadeOut("slow");
					$(".update").fadeIn("slow");
				}
			});
		});
		
		// 일정 삭제
		$(".todo-content").on("click", ".delete", function() {
			console.log("click");
			
			var gcno = $(this).attr("data-gcno");
			console.log("gcno: ", gcno);
			var sData = {
					"gcno" : gcno
			}
			var url = "/groupcal/deleteCal";
			
			$(this).prev().remove();
			$(this).prev().remove();
			$(this).prev().remove();
			$(this).remove();
			
			$.post(url, sData, function(rData) {
				console.log(rData);
				
				if(rData == "true") {
					getCalendarList();
				}
			});
		});
	});
</script>
<body>
	<div style="margin: 50px;" class="container-fluid">
		<div class="row">
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
				          <div class="todo-content" id="todo-content"></div>
				          <c:if test="${ loginVo.userid == groupVo.g_leader }">
					          <div style="padding: 2%" class="input-wrap">
					            <input type="text" placeholder="please write here!!" id="input-box" class="input-box form-control">
					            <button type="button" id="input-data" class="btn btn-outline-primary"><span>INPUT</span></button>
<!-- 					            <button type="button" id="update" class="btn btn-outline-warning"><span>UPDATE</span></button> -->
					            <button type="button" style="display: none;" id="updateFinish" class="btn btn-outline-warning"><span>FINISH</span></button>
					            <div id="input-list" class="input-list"></div>
					          </div>
				          </c:if>
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