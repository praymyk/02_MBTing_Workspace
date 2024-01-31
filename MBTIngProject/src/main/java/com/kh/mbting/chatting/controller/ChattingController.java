package com.kh.mbting.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.mbting.chatting.model.service.ChattingServiceImpl;
import com.kh.mbting.chatting.model.vo.BlockMember;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.chatting.model.vo.SearchMember;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;


@Controller
public class ChattingController {

	@Autowired
	private ChattingServiceImpl cService;
	
	/*검색 값을 담을 hashmap입니당*/
	@Autowired
	private HashMap<String, String> map;
	
	/**
     * 해당 채팅방의 채팅 메세지 불러오기
     * @param roomId
     * @param model
     * @param response
     * @throws JsonIOException
     * @throws IOException
     */
	

    @RequestMapping("messageList.do")
    public void messageList( String roomNo, String userEmail, Model model, HttpServletResponse response) throws JsonIOException, IOException {
       
    	//System.out.println(roomNo);
    	   // 안읽은 메세지의 숫자 0으로 바뀌기
        ChatMessage message = new ChatMessage();
        message.setEmail(userEmail);
        message.setRoomNo(roomNo);
        //System.out.println("roomNo :"  + roomNo);
        cService.updateCount(message);
        //System.out.println("userEmail :" + userEmail);
        //System.out.println(result);
        
        List<ChatMessage> mList = cService.messageList(roomNo);
        response.setContentType("application/json; charset=utf-8");
        //System.out.println(mList);

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
    }
    
    @RequestMapping("chatRoomList.do")
    public void createChat(ChatRoom room, ChatMessage message, String userEmail, HttpServletResponse response) throws JsonIOException, IOException{
       
    	List<ChatRoom> cList = cService.chatRoomList(userEmail);
        //System.out.println(cList);
        for(int i = 0; i < cList.size(); i++) {
            message.setRoomNo(cList.get(i).getRoomNo());
            message.setEmail(userEmail);
        }
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(cList,response.getWriter());
    }
    
    
    @GetMapping("convert.ch")
    public String convertChatting() {

    	//model.addAttribute("roomNo", roomNo);
    	//System.out.println(roomNo);
    	return "chatting/chattingView";
    }
    
   
    @RequestMapping("master.In") 
    public void masterInfo(String email , HttpServletResponse response)throws JsonIOException, IOException {
    	
    	 Member masterInfo = cService.masterInfo(email);
    	 response.setContentType("application/json; charset=utf-8");
    	
    	 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	 gson.toJson(masterInfo,response.getWriter());
    }
    
    @RequestMapping("all.me")
    public String allMember() {
    	return "chatting/chattingList";
    }
    
    @ResponseBody
    @RequestMapping("all.memList")
    public void allMemberList(HttpServletResponse response , HttpSession session)throws JsonIOException, IOException {
    	
    	Member loginMember = (Member)session.getAttribute("loginMember");
    			
    	ArrayList<Member> list = cService.allMemberList(loginMember);
    	response.setContentType("application/json; charset=utf-8");
     	
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	gson.toJson(list , response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping("search.li")
    public void searchMember(String height, String address, String age, String mbti ,String gender , int userNo, String email, HttpServletResponse response) throws JsonIOException, IOException{
    //System.out.println(height + address + age + mbti + gender);
    //System.out.println(height  + age );
    ArrayList<Member> list = new ArrayList<Member>();
  System.out.println(email);
    	if(height.equals("없음") && (!age.equals("없음"))) {
    		//System.out.println("난 지금 키만 없음이야 ");
    		int startAge 	 =  Integer.parseInt(age.substring(0, 2));
	    	int endAge 		 =  Integer.parseInt(age.substring(2, 4)); 
    		SearchMember sm  = new SearchMember(startAge, address, endAge, mbti, gender , height, userNo , email);
	    	list = cService.searchMember(sm);
	    	
    	}else if(age.equals("없음") && (!height.equals("없음")) ) {
    		//System.out.println("난 지금 나이만 없음이야 ");
    		int startHeight  =  Integer.parseInt(height.substring(0, 3));
	    	int endHeight 	 =  Integer.parseInt(height.substring(3, 6));
	    	//System.out.println("start :" + startHeight + "end :" + endHeight);
	    	SearchMember sm = new SearchMember(startHeight, endHeight, address, mbti, gender , age, userNo, email );
	    	list = cService.searchMember(sm);
	    	
    	}else if(height.equals("없음") && (age.equals("없음"))) {
    		//System.out.println("난 지금 키 나이 둘 다 없음이야 ");
    		SearchMember sm = new SearchMember(age, height, address, mbti, gender, userNo, email);
	    	list = cService.searchMember(sm);	
	    	
    
    	}else {
    		//System.out.println("난 지금 둘 다 선택했음이야 ㅋ ");
    		int startAge 	 =  Integer.parseInt(age.substring(0, 2));
	    	int endAge 		 =  Integer.parseInt(age.substring(2, 4));    	
	    	int startHeight  =  Integer.parseInt(height.substring(0, 3));
	    	int endHeight 	 =  Integer.parseInt(height.substring(3, 6));
	    	
	    	SearchMember sm = new SearchMember(startAge, endAge, startHeight, endHeight, address, mbti, gender, userNo, email);
	    	list = cService.searchMember(sm);
    	}
    

	    response.setContentType("application/json; charset-UTF-8");
    	new Gson().toJson(list, response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping("check.pro")
    public void checkProposer(int userNo, HttpServletResponse response )throws JsonIOException, IOException {
    		
    		ArrayList<Mbti> proposerNoList = cService.checkProposer(userNo);
    		 
    		response.setContentType("application/json; charset-UTF-8");
        	new Gson().toJson(proposerNoList, response.getWriter());
    		
    }
    
    @ResponseBody
    @RequestMapping("check.rec")
    public void checkReciever(int userNo, HttpServletResponse response )throws JsonIOException, IOException {
    		
    		ArrayList<Mbti> RecieverNoList = cService.checkReciever(userNo);
    		 
    		response.setContentType("application/json; charset-UTF-8");
        	new Gson().toJson(RecieverNoList, response.getWriter());
    		
    }
    
    @ResponseBody
    @RequestMapping("check.mat")
    public void checkMatching(int userNo, HttpServletResponse response )throws JsonIOException, IOException {
    		
    		ArrayList<Mbti> RecieverNoList = cService.checkMatching(userNo);
    		 
    		response.setContentType("application/json; charset-UTF-8");
        	new Gson().toJson(RecieverNoList, response.getWriter());
    		
    }
    
    @ResponseBody
    @RequestMapping("cancle.mat")
    public Map<String, Object>  cancleMatching(Mbti mbti, HttpServletResponse response)throws JsonIOException, IOException {
    	
    		Map<String, Object> allResult = new HashMap<>();
    	
    		int result1 = cService.updateMatchStat(mbti);
    		/*회원 정보 중 match_stat을 1로 업데이트함
    		 * 그리고 그 결과가 성공으로 result가 0보다 클 경우
    		 * */
    		if(result1 > 0) {
    			int result2 = cService.deleteMatching(mbti);
    			
    			if(result2 > 0) {
    				allResult.put("success", true);
    				allResult.put("message", "채팅 요청 취소를 완료했습니다.");
    			}else {
    				allResult.put("success", false);
    	            allResult.put("message", "채팅 요청 취소를 실패했습니다.");
    			}
    		}

    		return allResult;
    }
    
    @ResponseBody
    @RequestMapping("count.all")
    public int countAll(String email) {
    	
    	int countAll = cService.countAll(email);
    	
    	return countAll;
    }
    
    @ResponseBody
    @RequestMapping(value="countRoom.all" , produces="application/json; charset=UTF-8")
    public String countRoomAll(String email) {
    	ArrayList<ChatMessage> list  = cService.countRoomAll(email);
    	return new Gson().toJson(list);
    }
    
    @ResponseBody
    @RequestMapping("delete.mes")
    public Map<String, Object> deleteMessage(String userEmail, String masterEmail) {
    	//System.out.println(userEmail + masterEmail);
    	HashMap<String , String> map = new HashMap<String, String>();
    	map.put("userEmail", userEmail);
    	map.put("masterEmail", masterEmail);
    	
    	String roomNo = cService.getDeleteRoomNo(map);
    	
    	/*대화내용 삭제하기*/
    	int result1 = cService.deleteMessage(roomNo);
    	/*대화방 삭제하기*/
    	int result2 = 0;
    	/*매칭테이블에서 삭제하기*/
    	int result3 = 0;
    	
    	/*ALERTIFY를 위한 HASHMAP*/
    	Map<String, Object> allResult = new HashMap<>();
    	
    	if(result1 > 0) {
    		result2 = cService.deleteChatRoom(roomNo);
    		
    		 if(result2 > 0) {
    			 result3 = cService.deleteMatchFromChat(map);
    		 }
    	}
    	
    	if(result3 > 0) {
    		//System.out.println("result3 "  + result3);
    		allResult.put("success", true);
            allResult.put("message", "연결 종료했습니다. 이용해 주셔서 감사합니다.");
                      
            return allResult;
            
    	}else {
    		allResult.put("success", false);
            allResult.put("message", "연결 종료에 실패했습니다.");
            
            return allResult;
    	}
    }
    
    @ResponseBody
    @RequestMapping("block.mem")
    public String blockMem(String blockMemEmail, String blockProEmail) {
    	BlockMember bm = new BlockMember();
    	//System.out.println("ssss" + blockMemEmail);
    	bm.setBlockMemEmail(blockMemEmail);
    	bm.setBlockProEmail(blockProEmail);
    	
    	int result = cService.blockMem(bm);
    	/*ALERTIFY를 위한 HASHMAP*/
 
    	if(result > 0) {
    		return "신고 성공";
    	}else {
    		return "신고 실패 ㅋ";
    	}
    }
    
    @ResponseBody
    @RequestMapping(value="list.block", produces="application/json; charset=UTF-8")
    public String blockList(String email) {
    	ArrayList<Member> m = cService.blockList(email);
    	//System.out.println(m);
    	return new Gson().toJson(m);
    }
    
    @RequestMapping("unblock.mem")
    public String unBlockMem(String blockMemEmail, String blockProEmail) {
    	System.out.println("혹시.,오나");
    	BlockMember bm = new BlockMember();
    	//System.out.println("ssss" + blockMemEmail);
    	bm.setBlockMemEmail(blockMemEmail);
    	bm.setBlockProEmail(blockProEmail);
    	
    	int result = cService.unBlockMem(bm);
    	
    	if(result > 0) {
    		return "차단 해제 성공";
    	}else {
    		return "차단 해제 실패";
    	}
    	
    }
     
}