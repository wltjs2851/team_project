<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 달력 기본 틀 -->
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<script src='/resources/fullcalendar/main.js'></script>
<!-- Full Calendar 한글 표기 설정 -->
<script src='/resources/fullcalendar/locales/ko.js'></script>
<script>
	//팝업 
	function click_add() {
		console.log("팝업 누름");
		var url = "schedulePopup";
		var name = "schedulePopup";
		var option = "width = 600, height = 600, left = 100, top = 50, location = no"
		window.open(url, name, option)
	}
	// 달력 화면 
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},

			//       initialDate: '2020-09-12',
			locale : "ko", // 한글 출력
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			editable : true,
			selectable : true,
			events : [ {
				title : 'Business Lunch',
				start : '2020-09-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Meeting',
				start : '2020-09-13T11:00:00',
				constraint : 'availableForMeeting', // defined below
				color : '#257e4a'
			}, {
				title : 'Conference',
				start : '2020-09-18',
				end : '2020-09-20'
			}, {
				title : 'Party',
				start : '2020-09-29T20:00:00'
			},

			// areas where "Meeting" must be dropped
			{
				groupId : 'availableForMeeting',
				start : '2020-09-11T10:00:00',
				end : '2020-09-11T16:00:00',
				display : 'background'
			}, {
				groupId : 'availableForMeeting',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00',
				display : 'background'
			},

			// red areas where no events can be dropped
			{
				start : '2020-09-24',
				end : '2020-09-28',
				overlap : false,
				display : 'background',
				color : '#ff9f89'
			}, {
				start : '2020-09-06',
				end : '2020-09-08',
				overlap : false,
				display : 'background',
				color : '#ff9f89'
			} ]
		});

		calendar.render();
	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.add-button {
	position: absolute;
	top: 1px;
	right: 230px;
	background: #2C3E50;
	border: 0;
	color: white;
	height: 35px;
	border-radius: 3px;
	width: 157px;
}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<!-- 			달력 공간 -->
			<div class="col-md-8">
				<!-- 				달력 본체 -->
				<div id='calendar'></div>
				<!-- 				일정 추가 -->
				<!-- 				<div> -->
				<!-- 					<button class="add-button" type="button" onclick="click_add();"> -->
				<!-- 					일정 추가 -->
				<!-- 					</button> -->
				<!-- 				</div> -->
			</div>
			
			<div>
				<button class="add-button" type="button" onclick="click_add();">
					일정 추가</button>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>