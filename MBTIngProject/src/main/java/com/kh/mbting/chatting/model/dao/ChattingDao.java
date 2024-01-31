package com.kh.mbting.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mbting.chatting.model.vo.BlockMember;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.chatting.model.vo.SearchMember;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;

@Repository
public class ChattingDao {
	
	@Autowired
    SqlSessionTemplate sqlSession;

    public int createChat(ChatRoom room) {
        return sqlSession.insert("chatMapper.createChat", room);
    }

    public ChatRoom searchChatRoom(ChatRoom room) {
        return sqlSession.selectOne("chatMapper.searchChatRoom", room);
    }
    
    public List<ChatRoom> chatRoomList(String userEmail) {
        return sqlSession.selectList("chatMapper.chatRoomList", userEmail);
    }
    
    public ChatRoom chatRoom(ChatRoom room) {
    	return sqlSession.selectOne("chatMapper.chatRoom", room);
    }
    
    public ChatRoom selectChatRoom(String roomNo) {
        return sqlSession.selectOne("chatMapper.selectChatRoom", roomNo);
    }
    
    public int insertMessage(ChatMessage chatMessage) {
        return sqlSession.insert("chatMapper.insertMessage", chatMessage);
    }
    
    public List<ChatMessage> messageList(String roomNo) {
        return sqlSession.selectList("chatMapper.messageList", roomNo);
    }
    
    public int updateCount(ChatMessage message) {
        return sqlSession.update("chatMapper.updateCount", message);
    }
    
    public Member masterInfo(String email) {
    	return sqlSession.selectOne("chatMapper.masterInfo" , email);
    }
    
    public ArrayList<Member> allMemberList(Member loginMember) {
    	return (ArrayList)sqlSession.selectList("chatMapper.allMemberList" , loginMember);
    }
    
    public ArrayList<Member> searchMember(SearchMember sm) {
    	return (ArrayList)sqlSession.selectList("chatMapper.searchMember" , sm);
    }
    
    public ArrayList<Mbti> checkProposer(int userNo) {
    	return (ArrayList)sqlSession.selectList("chatMapper.checkProposer" , userNo);
    }
    
    public ArrayList<Mbti> checkReciever(int userNo) { 
    	return (ArrayList)sqlSession.selectList("chatMapper.checkReciever" , userNo);
    }
    
    public ArrayList<Mbti> checkMatching(int userNo) {
    	return (ArrayList)sqlSession.selectList("chatMapper.checkMatching" , userNo);
    }
    
    public int cancleMatching(Mbti mbti) {
    	return sqlSession.update("chatMapper.updateMatchStat" , mbti);
    }
    
    public int deleteMatching(Mbti mbti) {
    	return sqlSession.delete("chatMapper.deleteMatching" , mbti);
    }
    
    public int insertUnReadMessage(ChatMessage chatMessage) {
    	return sqlSession.insert("chatMapper.insertUnReadMessage" , chatMessage);
    }
    
    public int countAll(String email) {
    	return sqlSession.selectOne("chatMapper.countAll" , email);
    }
    
    public ArrayList<ChatMessage> countRoomAll(String email) {
    	return (ArrayList)sqlSession.selectList("chatMapper.countRoomAll" , email);
    }
    
    public String getDeleteRoomNo(HashMap<String, String> map) {
    	return sqlSession.selectOne("chatMapper.getDeleteRoomNo" , map);
    }
    public int deleteMessage(String roomNo) {
    	return sqlSession.delete("chatMapper.deleteMessage" , roomNo);
    }
    public int deleteChatRoom(String roomNo) {
    	return sqlSession.delete("chatMapper.deleteChatRoom" , roomNo);
    }
    
    public int deleteMatchFromChat(HashMap<String, String> map) {
    	return sqlSession.delete("chatMapper.deleteMatchFromChat", map);
    }
    
    public int blockMem(BlockMember bm) {
    	return sqlSession.insert("chatMapper.blockMem" , bm);
    }
    
    public ArrayList<Member> blockList(String email) {
    	return (ArrayList)sqlSession.selectList("chatMapper.blockList" , email);
    }
    
    public int unBlockMem(BlockMember bm) {
    	return sqlSession.insert("chatMapper.unBlockMem" , bm);
    }
} 



