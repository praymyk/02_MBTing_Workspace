


package com.kh.mbting.chatting.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("cSession")
public class ChatSession {
   
   // static으로 필드변수를 설정하여 같은 ArrayList를 이용 할 수 있도록 선언합니다.
    private static ArrayList<String> loginMember = new ArrayList<String>();
    
    // 로그인 시 ArrayList에 추가합니다.
    public void addLoginMember(String email) {
       loginMember.add(email);
    }
    
    // 로그아웃 시 ArrayList에서 제거합니다.
    public void removeLoginMember(String email) {
       loginMember.remove(email);
    }
 
    // 현재 로그인 되어 있는 유저 목록을 가져옵니다.
    public static ArrayList<String> getLoginMember() {
        return loginMember;
    }

}