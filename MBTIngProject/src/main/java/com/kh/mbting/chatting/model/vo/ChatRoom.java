package com.kh.mbting.chatting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
@ToString
public class ChatRoom {
    private String roomNo;           // 방 번호
    private String userEmail;       // 사용자 이메일
    private String userName;       // 사용자 이름
    private String userPic;        // 사용자 사진 
    private String masterEmail;    // 상대방 이메일
    private String masterName;       // 상대방 이름
    private String masterPic;       // 상대방 사진
    private int    unReadCount;    // 안 읽은 메세지 수
    private String messageContent;  // message 내용
    private String sendTime; 		//보낸시간
}
