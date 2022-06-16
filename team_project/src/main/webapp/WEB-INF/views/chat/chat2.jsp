<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		beforeEnter = document.getElementById("beforeEnter");
		afterEnter = document.getElementById("afterEnter");
		
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
		var websocket;
		//입장 버튼을 눌렀을 때 호출되는 함수
		function connect() {
			websocket = new WebSocket("ws://192.168.0.95/chat-ws");
			console.log(websocket);
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
			websocket.onclose = onClose;
			
			$("#nickname").attr("readonly", true);
// 			$("#enter").attr("disabled", true);
			$("#enter").css("display", "none"); // 입장 하면 입장 버튼 사라짐 
// 			$("#enter").removeAttr();
		}
		//퇴장 버튼을 눌렀을 때 호출되는 함수
		function disconnect() {
			msg = document.getElementById("nickname").value;
			websocket.send(msg + "님이 퇴장하셨습니다");
			websocket.close();
			window.close();
		}
		//보내기 버튼을 눌렀을 때 호출될 함수
		function send() {
			nickname = document.getElementById("nickname").value;
			msg = document.getElementById("message").value;
			websocket.send(nickname + ":" + msg);
			document.getElementById("message").value = "";
		}
		//웹 소켓에 연결되었을 때 호출될 함수
		function onOpen() {
			nickname = document.getElementById("nickname").value;
			afterEnter = document.getElementById("afterEnter");
			afterEnter.style.display = 'block';
			websocket.send(nickname + "님 입장하셨습니다.");
		}
		//웹 소켓에서 연결이 해제 되었을 때 호출될 함수
		function onMessage(evt) {
			data = evt.data;
			chatarea = document.getElementById("chatarea");
			chatarea.innerHTML = data + "<br/>" + chatarea.innerHTML
		}
		// 커밋용
		function onClose() {
		}
	});
</script>
<%-- ${nickname } --%>
<%-- ${gno } --%>
<body>
	<h1>(그룹명) 채팅 방</h1>
	<div id="beforeEnter">
		닉네임 : <input type="text" id="nickname" value="${nickname }" readonly="readonly"/> 
				<input type="button" id="enter" value="입장" />
	</div>
	<div id="afterEnter" style="display: none">
		<input type="button" id="exit" value="퇴장" /><br />
		<div id="chatarea"
			style="width: 400px; height: 400px; border: 1px solid; overflow: scroll;"></div>
		<input type="text" id="message" /> <input type="button" id="send"
			value="보내기" />
	</div>
</body>
</html>