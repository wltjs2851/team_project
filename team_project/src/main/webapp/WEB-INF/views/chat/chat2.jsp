<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />

</head>
<style>


/* 보낸 사람 말풍선 */
.alert-primary:after {
	content: '';
    position: absolute;
    right: 0;
    top: 120%;
    width: 0;
    height: 0;
    border: 8px solid transparent;
    border-left-color: #CCE5FF;
    border-right: 0;
    border-bottom: 0;
    margin-top: -26.5px;
    margin-right: -8px;
}

/* 수신 말풍선 */
.alert-secondary:after {
	content: '';
	position: absolute;
	left: 0;
	top: 120%;
	width: 0;
	height: 0;
	border: 8px solid transparent;
	border-right-color: #E7E8EA;
	border-left: 0;
	border-bottom: 0;
	margin-top: -26.5px;
    margin-left: -8px;
}

#message {
	padding-top: 20px;
	width: 299px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid grey;
}

#send {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom : 2px solid grey;
}

</style>
<!-- PLUGINS CSS STYLE -->
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="/resources/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/fonts.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		beforeEnter = document.getElementById("beforeEnter");
		afterEnter = document.getElementById("afterEnter");
		
		var nick;
		
		
		document.getElementById("enter").addEventListener("click", function() {
			//웹 소켓 연결해주는 함수 호출
			connect();
		});
		document.getElementById("exit").addEventListener("click", function() {
			//연결을 해제해주는 함수 호출
			disconnect();
		});
		document.getElementById("send").addEventListener("click", function() {
			//연결을 해제해주는 함수 호출
			send();
		});
		
// 		window.addEventListener("beforeunload", disconnect(){
// 			disconnect();
// 		});
		var websocket;
		
		//입장 버튼을 눌렀을 때 호출되는 함수
		function connect() {
			websocket = new WebSocket("ws://192.168.0.95/chat-ws/${gno}");
// 			websocket = new WebSocket("ws://localhost/chat-ws/${gno}");
			console.log(websocket);
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
			websocket.onclose = onClose;
			
			$("#nickname").attr("readonly", true);
			$("#enter").css("display", "none"); // 입장 하면 입장 버튼 사라짐 
			$("#exit").css("display", "");
			
		}
		
		//퇴장 버튼을 눌렀을 때 호출되는 함수
		function disconnect() {
			nickname = document.getElementById("nickname").value;
			if (window.confirm("퇴장하면 채팅 기록이 사라집니다. \n퇴장하시겠습니까?")){
				websocket.send(nickname + "님이 퇴장하셨습니다");
			}
			
			// 퇴장하면 
			var chatInterval = setInterval(function() {
				$.get("/chat/getChatters/${gno}/o", function(rData) {
					console.log(rData);
					websocket.close();
					window.close();
				});
			}, 1000); 
		}
		//보내기 버튼을 눌렀을 때 호출될 함수
		function send() {
			nickname = document.getElementById("nickname").value;
			msg = document.getElementById("message").value;
// 			websocket.send(nickname);
			websocket.send(nickname + " : " + msg);
// 			websocket.send(msg);
			document.getElementById("message").value = "";
		}
		//웹 소켓에 연결되었을 때 호출될 함수
		function onOpen() {
			$("#attend").css("display","");
			nickname = document.getElementById("nickname").value;
			afterEnter = document.getElementById("afterEnter");
			afterEnter.style.display = 'block';
			websocket.send(nickname + " 님 입장하셨습니다.");
			var chatInterval = setInterval(function() {
				$.get("/chat/getChatters/${gno}/i", function(rData) {
					console.log(rData);
// 					var attendNick = $(".p_attend").attr("data-nick");
// 					var p_attend = $(".p_attend");
// 					$(".p_attend").each(function(i) {
// 						if(rData[i] == $(".p_attend").eq(i).attr("data-nick")){
// 							console.log("되어라");
// 							$(".p_attend[data-nick='"+ rData[i] +"']").find("i").css("color", "#FFDF59");
// 						} else {
// 							$(".p_attend[data-nick='"+ rData[i] +"']").find("i").css("color", "silver");
// 						}
// 					});
					// ['홍']
					for(var i = 0; i < $(".p_attend").length; i++){
						var dataNick = $(".p_attend").eq(i).attr("data-nick");
						console.log("dataNick:", dataNick);
						var isBeing = rData.includes(dataNick);
						var color = "";
						if (rData.includes(dataNick)) {
							color = "#FFDF59";
						} else {
							color = "silver";
						}
						$(".p_attend").eq(i).find("i").css("color", color);
					}
				});
			}, 1000);
		}
		//웹 소켓에 메시지를 보낼 때 호출될 함수
		function onMessage(evt) {
			console.log(evt);
			nickname = document.getElementById("nickname").value;
			data = evt.data;
			var message = data.search(":");
			
			var count = data.indexOf(" ");
			console.log("count:", count);
			var nick = data.substring(0, count);
			console.log("nick:", nick);
			chatarea = document.getElementById("chatarea");
			if(message > 0){
				if(nick == "${loginVo.nickname}"){
//	 				chatarea.innerHTML = "<font color = 'red'>" + data + "</font>"+ "<br/>" + chatarea.innerHTML
					chatarea.innerHTML = "<span class='alert alert-primary' style='float:right; margin-right:10px;'>" + data + "</span>"+ "<br><br><br>" + chatarea.innerHTML
//	 				chatarea.innerHTML = "<class='alert alert-success'>" + data + "<br/>" + chatarea.innerHTML
//	 				chatarea.append("<span>"+ data +"</span>");
				} else if (nick != "${loginVo.nickname}"){
					chatarea.innerHTML = "<span class='alert alert-secondary' style='margin-top:80px; top:13px; margin-left:10px;'>" + data + "</span>"+ "<br><br><br>" + chatarea.innerHTML
				} 
			} else {
				chatarea.innerHTML = "<div style='text-align:center;'><span>" + data + "</span></div><br>" + chatarea.innerHTML;
			}
			console.log("채팅방 입장 및 메시지 전송");
		}
		// 커밋용
		function onClose() {
		}
		
		
	});
</script>
<%-- ${nickname } --%>
<%-- ${gno } --%>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-7">
			<br>
			<h1>(${g_name }) 채팅 방</h1>
			<hr>
			<div id="beforeEnter">
				닉네임 : <input type="text" id="nickname" value="${nickname }" readonly="readonly" style="border: hidden;"/> 
						<input type="button" id="enter" value="입장" class="btn btn-outline-warning"/>
						<input type="button" id="exit" value="퇴장" class="btn btn-outline-danger" style="display:none;"/>
			</div>
			<div id="afterEnter" style="display: none; padding-top: 10px;">
					<div id="chatarea"
						style="width: 400px; height: 400px; border: 1px solid; overflow: auto; border-radius: 20px; border-color: silver;"></div>
					<div style="padding-top: 10px; padding-left: 5px;">
						<input type="text" id="message" /> 
						<input type="button" id="send"
							value="보내기" />
					</div>
			</div>
			
			</div>
		<div class="col-md-4">
			<br>
			<div id="attend" style="display:none; padding-top: 120px;padding-left: 40px;">
			<strong>${g_name }</strong><br>채팅 참여자
<%-- 			${groupJoinMember} --%>
			<br><br>
			<c:forEach items="${g_nickname }" var="nick" varStatus="status">
				<p class="p_attend" data-nick="${g_nickname[status.index ]}">${nick}
					<i class='fas fa-lightbulb' style='font-size:24px; color:silver;'></i>
					</p>
			</c:forEach>
			</div>
		</div>
		</div>
		
	</div>
</body>
</html>