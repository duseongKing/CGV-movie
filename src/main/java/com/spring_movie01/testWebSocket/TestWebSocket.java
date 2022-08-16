package com.spring_movie01.testWebSocket;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

public class TestWebSocket extends TextWebSocketHandler {
	
	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished() 호출 " );
		System.out.println("session.getId() : " + session.getId());
		sessionList.add(session);
		System.out.println("sessionList.size() : " + sessionList.size());
		
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		System.out.println("session.getId() : " + session.getId());
		sessionList.remove(session);
		System.out.println("sessionList.size() : " + sessionList.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage() 호출");
		System.out.println("session.getId() : " + session.getId());
		System.out.println("message.getPayload() : " + message.getPayload());
		Gson gson = new Gson();
		TestMsgDto testMsg = gson.fromJson( message.getPayload(), TestMsgDto.class);
		//testDao.insert(testMsg);
		//INSERT
		System.out.println(testMsg);
		
		
		for( int i = 0; i < sessionList.size(); i++) {
			if( !sessionList.get(i).getId().equals(session.getId()) ) {
				
				Map<String, Object> sessionMap = sessionList.get(i).getAttributes();
				String loginId = (String)sessionMap.get("loginId");
				System.out.println("loginId : " + loginId);
				if(loginId != null) {
					sessionList.get(i).sendMessage( new TextMessage( message.getPayload() ) );
				}
			}
		}
		
	}
	
	
	
	
	
}
