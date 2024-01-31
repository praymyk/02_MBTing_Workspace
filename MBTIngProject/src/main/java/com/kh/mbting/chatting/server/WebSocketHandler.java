package com.kh.mbting.chatting.server;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mbting.chatting.model.service.ChattingService;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;

public class WebSocketHandler extends TextWebSocketHandler  {

	@Autowired
	ChattingService cService;
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	// 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.  => 1 , 제니 사나  + 2, 제니 민정 같이 
    private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
    // session, 방 번호가 들어간다. => 전체 회원 때문인 거 같아.
    private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
    
    private static int i;

    
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		 i++;
	     System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	 @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 전달받은 메세지
        String msg = message.getPayload();
        //System.out.println(msg);
        // Json객체 → Java객체
        // 출력값 : [roomId=123, messageId=null, messageContent=asd, name=천동민, email=cheon@gmail.com, unReadCount=0]
        ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
        
        //System.out.println("unReadMessage : " + chatMessage.getSendTime());
        
        // 받은 메세지에 담긴 roomNo로 해당 채팅방을 찾아온다.
        ChatRoom chatRoom = cService.selectChatRoom(chatMessage.getRoomNo());
        
        // 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔고, DB에서의 채팅방이 있을 때
        // 채팅방 생성
        if(RoomList.get(chatRoom.getRoomNo()) == null && chatMessage.getMessageContent().equals("ENTER-CHAT") && chatRoom != null) {
        	
            // 채팅방에 들어갈 session들
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            //제니가 sessionTwo안에 들어감
            // sessionList에 추가
            sessionList.put(session, chatRoom.getRoomNo());
            //제니 세션과 1번이 sessionList에 들어가고 
            // RoomList에 추가
            RoomList.put(chatRoom.getRoomNo(), sessionTwo);

            // 확인용
            //RoomList에 1번이랑 제니가 들어감. 
            System.out.println("채팅방 생성");
          
           //System.out.println(sessionTwo);
           //System.out.println(sessionList);
           //System.out.println(RoomList);
            String roomNum = chatMessage.getRoomNo();
            TextMessage textMessage = new TextMessage("한 명이다 ," + roomNum + chatMessage.getEmail());
            System.out.println("한 명이다");
            for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
                sess.sendMessage(textMessage);
                //System.out.println(textMessage);
            }
        } 
        
        // 채팅방이 존재 할 때
        else if(RoomList.get(chatRoom.getRoomNo()) != null && chatMessage.getMessageContent().equals("ENTER-CHAT") && chatRoom != null) {
            
        	System.out.println("난 이미 생성된 방에 들어간 두 번째사람");
            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
            RoomList.get(chatRoom.getRoomNo()).add(session);
            //원래는 1번이랑 제니 , 1번이랑 유지민, 2번이랑 김민정 
            // sessionList에 추가
            sessionList.put(session, chatRoom.getRoomNo());
            //원래는 제니 세션과 1번, 유지민 세션과 1번, 김민정 세션과 2
            // 확인용
            System.out.println("생성된 채팅방으로 입장");
            
            String roomNum = chatMessage.getRoomNo();
            int sessionCount = 2;
            
            if(RoomList.get(roomNum).size() == 1) {
            	 TextMessage textMessage = new TextMessage ("한 명이다 ," + roomNum + chatMessage.getEmail());
            	 System.out.println("한 명이다");
            	 for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
                     sess.sendMessage(textMessage);
                 }
            }
            if(RoomList.get(roomNum).size() == 2) {
            	 chatMessage.setSessionCount(sessionCount);
            	 cService.insertUnReadMessage(chatMessage);
            	 
            	 TextMessage textMessage = new TextMessage("세션 두명임 읽음팡팡 ," + roomNum );
            	 System.out.println("두 명이다");
            	 for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
                     sess.sendMessage(textMessage);
                     //System.out.println(textMessage);
                 }
            	 //System.out.println(result + "ㅋㅋㅋㅋㅋ");
            }
        }
        
        // 채팅 메세지 입력 시
        else if(RoomList.get(chatRoom.getRoomNo()) != null && !chatMessage.getMessageContent().equals("ENTER-CHAT") && chatRoom != null) {
        	
        	String num = chatMessage.getRoomNo();
        	//System.out.println(RoomList.get(num).size());
            // 메세지에 이름, 이메일, 내용을 담는다.
            TextMessage textMessage = new TextMessage(chatMessage.getName() + "," + chatMessage.getEmail() + "," + chatMessage.getMessageContent() + "," + chatMessage.getSendTime() + "," + RoomList.get(num).size());
            
            //System.out.println("엥" +textMessage);
            // 현재 session 수
            int sessionCount = 0;
 
            // 해당 채팅방의 session에 뿌려준다.
            for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
                sess.sendMessage(textMessage);
                sessionCount++;
            }
            
            // 동적쿼리에서 사용할 sessionCount 저장
            // sessionCount == 2 일 때는 unReadCount = 0,
            // sessionCount == 1 일 때는 unReadCount = 1
            chatMessage.setSessionCount(sessionCount);
      
            // DB에 저장한다.
            int a = cService.insertMessage(chatMessage);
            
            if(a == 1) {
                System.out.println("메세지 전송 및 DB 저장 성공");
            }else {
                System.out.println("메세지 전송 실패!!! & DB 저장 실패!!");
            }
        }
	 }

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			i--;
	        System.out.println(session.getId() + " 연결 종료 => 총 접속 인원 : " + i + "명");
	        // sessionList에 session이 있다면
	        if(sessionList.get(session) != null) {
	            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
	            RoomList.get(sessionList.get(session)).remove(session);
	            sessionList.remove(session);
	        }
	}

	
	
}
