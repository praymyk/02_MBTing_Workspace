package com.kh.mbting.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.mbting.chatting.model.vo.BlockMember;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.chatting.model.vo.SearchMember;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;


public interface ChattingService {

	  /**
     * DB에 채팅 방이 있는지 확인
     * @param room
     * @return
     */
    ChatRoom searchChatRoom(ChatRoom room);
	
	  /**
     * 채팅 방 DB 저장
     * @param room
     * @return
     */
    int createChat(ChatRoom room);
    
    /**
     * 채팅 방 리스트 출력
     * @param userEmail
     * @return
     */
    List<ChatRoom> chatRoomList(String userEmail);
 
    /**
     * 메인화면 처럼 아예 처음 보는 사람한테 채팅을 보내기 위함
     * @param userEmail
     * @return
     */
    ChatRoom chatRoom(ChatRoom room);
    
    /**
     * 방 번호를 선택하는 메소드
     * @param roomId
     * @return
     */
    ChatRoom selectChatRoom(String roomNo);
    
    /**
     * 채팅 메세지 DB 저장
     * @param chatMessage
     * @return 
     */
    int insertMessage(ChatMessage chatMessage);

    /**
     * 메세지 내용 리스트 출력
     * @param roomId
     * @return
     */
    List<ChatMessage> messageList(String roomNo);

    /**
     * 읽은 메세지 숫자 0으로 바꾸기
     * @param message
     * @return
     */
    int updateCount(ChatMessage message);
    
    /**
     * 마스터 정보 가져오기 
     * @param email
     * @return
     */
    Member masterInfo(String email);
    
    
    /**
     * 회원 정보 전체를 가져오기
     * @return
     */
    ArrayList<Member> allMemberList(Member loginMember);
    
    /***
     * 회원 정보 검색하기
     * @param sm
     * @return
     */
    ArrayList<Member> searchMember(SearchMember sm);
    
    /***
     * 내가 신청한 사람들 번호 검색하기
     * @param userNo
     * @return
     */
    ArrayList<Mbti> checkProposer(int userNo);
    
    /***
     * 나한테 신청한 사람들 번호 검색하기
     * @param userNo
     * @return
     */
    ArrayList<Mbti> checkReciever(int userNo);
    
    /***
     * 서로 매칭된 사람 검색하기
     * @param userNo
     * @return
     */
    ArrayList<Mbti> checkMatching(int userNo);
    
    /***
     * 신청 취소할 경우 회원의 matchStat을 1로 바꿔주기.
     * @param mbti
     * @return
     */
    int updateMatchStat(Mbti mbti);
    

    /***
     * 신청 취소할 경우 matching table에서 삭제해주기
     * @param mbti
     * @return
     */
    int deleteMatching(Mbti mbti);
    
    /***
     * 안 읽은 메시지의 session을 update해줌
     * @param roomNum
     * @param unReadMessage
     * @return
     */
    int insertUnReadMessage( ChatMessage chatMessage );

    /***
     * 안 읽은 전체 메시지 수 가져오기
     * @param email
     * @return
     */
    int countAll(String email);
    
    /***
     * 안 읽은 방 마다의 메시지수 가져오기
     * @param email
     * @return
     */
    ArrayList<ChatMessage> countRoomAll(String email);
    
    /***
     * 삭제할 메시지 방 가져오기
     * @param map
     * @return
     */
    String getDeleteRoomNo(HashMap<String, String> map);
    
    /***
     * 방 나가면 메시지 삭제하기
     * @param map
     * @return
     */
    int deleteMessage(String roomNo); 
    
    /***
     * 방 나가면 채팅방도 삭제하기
     * @param roomNo
     * @return
     */
    int deleteChatRoom(String roomNo);
    
    /***
     * 방 나가면 매칭 상태도 삭제하기 (위에있는 deleteMatching과는 다름. 그건 내가 신청한 사람만 삭제)
     * @param mbti
     * @return
     */
    int deleteMatchFromChat(HashMap<String, String> map);
    
    /***
     * 회원을 차단하는 table에 insert
     * @param bm
     * @return
     */
    int blockMem(BlockMember bm);
    
    /***
     * 차단한 회원 목록을 불러오는 method
     * @param email
     * @return
     */
    ArrayList<Member> blockList(String email);
    
    /***
     * 차단한 회원을 해제하는 method
     * @param bm
     * @return
     */
    int unBlockMem(BlockMember bm);
}
