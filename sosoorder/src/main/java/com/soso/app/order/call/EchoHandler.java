package com.soso.app.order.call;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soso.app.order.service.MessageVO;

public class EchoHandler extends TextWebSocketHandler{
    //세션 리스트
    public static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    public static Map<String,WebSocketSession> map = new HashMap<String,WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    //클라이언트가 연결 되었을 때 실행 //webSocket 연결이 열리고 준비될 때 호출
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        Map<String,Object> storeSession = session.getAttributes();
        if ( storeSession != null ) {	     	
	        String id = (String)storeSession.get("id");
	        if(id != null) {
	        	map.put(id,session);
	        }       	
        }
        logger.info("{} 연결됨", session.getId());
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
      //JSON from String to Object
        ObjectMapper mapper = new ObjectMapper();
        MessageVO msgVO = mapper.readValue(message.getPayload(), MessageVO.class);      
        try {   	
        	if(msgVO.getCmd().equals("callInsert")) {
        		map.get(msgVO.getStore()).sendMessage(new TextMessage(message.getPayload()));
        	}else if(msgVO.getCmd().equals("orderInsert")) {
        		map.get(msgVO.getStore()).sendMessage(new TextMessage(message.getPayload()));
        	}else if(msgVO.getCmd().equals("startCook")) {
        		map.get(msgVO.getMember()).sendMessage(new TextMessage(message.getPayload()));
        	}else if(msgVO.getCmd().equals("endCook")) {
        		map.get(msgVO.getMember()).sendMessage(new TextMessage(message.getPayload()));
        	}      	
        }catch(Exception e) {
        	e.printStackTrace();
        }  
    }
    
    public static void putMessage() throws Exception {
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage("yes"));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
}