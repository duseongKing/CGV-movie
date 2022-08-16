package com.spring_movie01.messageWebSocket;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring_movie01.dto.MessageDto;

public class WebSocketMsgTest extends TextWebSocketHandler {

	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished() 호출 : " + session.getId());
		sessionList.add(session);
		Map<String, Object> connectMap = session.getAttributes();
		String loginId = (String)connectMap.get("loginId");
		if(loginId == null) {
			loginId = "비회원_"+session.getId();
		} else {
			loginId = loginId +"_"+session.getId();
		}
		Gson gson = new Gson();
		MessageDto msgDto = new MessageDto();
		msgDto.setMsgUserId(loginId);
		msgDto.setMsgComment("connect");
		for(int i = 0; i < sessionList.size(); i++) {
			if( !sessionList.get(i).getId().equals(session.getId())) {
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(msgDto)));
			}
		}
		
		// 접속중인 사용자 목록
		String userList = "";
		for(int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> conUserMap = sessionList.get(i).getAttributes();
			String conUserId = (String)conUserMap.get("loginId");
			if(conUserId == null) {
				conUserId = "비회원_"+sessionList.get(i).getId();
			} else {
				conUserId = conUserId + "_" + sessionList.get(i).getId();
			}
			userList = userList + conUserId+"++"; 
		}
		msgDto.setMsgUserId(userList);
		session.sendMessage(new TextMessage(gson.toJson(msgDto)));
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage() 호출 : " + session.getId());
		System.out.println("message.getPayload() : "+message.getPayload());
		Gson gson = new Gson();
		MessageDto msgDto = gson.fromJson(message.getPayload(), MessageDto.class);
		if(msgDto.getMsgUserId().length() <= 0) {
			msgDto.setMsgUserId("비회원_"+session.getId());
		}
		System.out.println(msgDto);
		for(int i = 0; i < sessionList.size(); i++) {
			if( !sessionList.get(i).getId().equals(session.getId())) {
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(msgDto)));
			}
		}
	}
	
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		sessionList.remove(session);
		Map<String, Object> connectMap = session.getAttributes();
		String loginId = (String)connectMap.get("loginId");
		if(loginId == null) {
			loginId = "비회원_"+session.getId();
		} else {
			loginId = loginId +"_"+session.getId();
		}
		Gson gson = new Gson();
		MessageDto msgDto = new MessageDto();
		msgDto.setMsgUserId(loginId);
		msgDto.setMsgComment("disConnect");
		for(int i = 0; i < sessionList.size(); i++) {
			sessionList.get(i).sendMessage(new TextMessage(gson.toJson(msgDto)));
		}
		
	}
}
