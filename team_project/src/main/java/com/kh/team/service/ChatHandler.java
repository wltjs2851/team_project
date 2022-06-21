package com.kh.team.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// chat2.jsp 

@Component
public class ChatHandler extends TextWebSocketHandler {
	private static Map<String, List<WebSocketSession>> map = new HashMap<String, List<WebSocketSession>>();
//			new ArrayList<WebSocketSession>();
	// 클라이언트가 접속 했을 때 호출될 메소드
	// 클라이언트가 접속 했을 때 호출되는 메소드
	
	
	// 클라이언트가 연결에 성공했을 때 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String uri = session.getUri().toString();
		System.out.println(uri.toString());
		String gno = uri.substring(uri.lastIndexOf("/") + 1); 
		List<WebSocketSession> list = map.get(gno);
		
		
		if (list == null) {
			list = new ArrayList<WebSocketSession>();
			map.put(gno, list);
		} 
		list.add(session);
		System.out.println("연결됨:" + session.getId());
		
		System.out.println("afterConnectionEstablished, map:" + map);
		System.out.println("chatlist:" + list);
		System.out.println("chatlist,hashCode:" + list.hashCode());
		System.out.println("this,hashCode:" + this.hashCode());
		System.out.println("하나의 클라이언트가 연결됨 ");
	}

	// 클라이언트가 메시지를 보냈을 때 호출되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String uri = session.getUri().toString();
		System.out.println(uri.toString());
		String gno = uri.substring(uri.lastIndexOf("/") + 1); 
		List<WebSocketSession> list = map.get(gno);
		
		// 전송된 메시지를 List의 모든 세션에 전송
		String msg = message.getPayload();
		for (WebSocketSession s : list) {
			s.sendMessage(new TextMessage(session.getAcceptedProtocol() + "" + msg));
		}
		
		
	}

	// 클라이언트의 접속이 해제 되었을 때 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("클라이언트와 연결 해제됨");
		String uri = session.getUri().toString();
		System.out.println(uri.toString());
		String gno = uri.substring(uri.lastIndexOf("/") + 1); 
		List<WebSocketSession> list = map.get(gno);
		list.remove(session);
		
		// 채팅방에 남아있는 사람이 없다면 채팅방 삭제 
		if (list.size() == 0) {
			map.remove(gno);
		}
		
		System.out.println("afterConnectionClosed, map:" + map);
	}
}
