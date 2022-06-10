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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
//       initialDate: '2020-09-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      local : 'ko',
      // 선택하면 
      select: function(arg) {
        var title = prompt('Event Title:');
      
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          });
          
          console.log({ title, start: arg.startStr, end: arg.endStr });
          $.ajax({
        	 type : "PATCH",
          	url : "${pageContext.request.contextPath}/calendar/add",
          	dataType: "json",
          	data: JSON.stringify({
          		title,
          		start: arg.startStr,
          		end: arg.endStr,
          	}),
          	success : function (result){
          		console.log("DB 입력 성공");
          	},
          });
        }
        
        calendar.unselect()
      }, // select
      
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      }, // eventClick
      
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: []
       
      
    }); // new Fullcalendar
    
    calendar.addEvent({
        title: '테스트',
        start: new Date("2022-06-01"),
        end: new Date("2022-06-10"),
        allDay: true
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

</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<!-- 			달력 공간 -->
			<div class="col-md-8">
				<!-- 				달력 본체 -->
				<div id='calendar'></div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>