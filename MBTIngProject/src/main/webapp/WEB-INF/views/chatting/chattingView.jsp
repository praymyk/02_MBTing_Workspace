<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter , java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("a hh:mm");
	String formattedTime = LocalDateTime.now().format(formatter);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <!-- 알람창 관련 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	 
<style>

body {
	width : 100%;
	height : 100%;
	overflow-y: scroll; /* 세로 스크롤바를 항상 표시 */
    scrollbar-width: thin; /* 스크롤바의 너비를 조절 */
}

/* WebKit(Chrome, Safari) 브라우저에 대한 스크롤바 스타일 */
body::-webkit-scrollbar {
    width: 3px; /* 스크롤바의 너비를 조절 */
}
body::-webkit-scrollbar-thumb {
    background-color: transparent; /* 스크롤바 색상을 투명하게 설정하여 보이지 않게 함 */
}

.wrap {
    width : 484px;
    height: 670px;
    margin: auto;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); 
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-radius : 20px;
}
.wrapPC {
    width : 1640px;
    height : 500px;
    display: inline-block;
    display: flex;
    margin : auto;
    border-radius : 20px;
}

#profileDiv {
    width: 400px;
    height: 670px;
    margin-left: 40px;
    margin-right: 50px;
    background-color: rgb(248, 244, 244);
    border-radius : 16px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.25); 
}

#profileDiv table {
    width: 400px;
    height: 650px;
}

#profileDiv table td{
    text-align: center;
    height : 40%;
}

#profileDiv img {
    height: 270px;
    width : 270px; 
    border-radius: 20px; 
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.4); 
}


/*---------------------------chatting--------------------------------*/

 ul , li {
   list-style: none;
 }
 
.chatDiv {
    width: 690px;
    height: 80%;
    border-left: 1px solid #ffffff;
    border-right: 1px solid #ffffff;
    margin-top: 100px;
    margin-left: 50px;
    overflow-y: scroll; /* 세로 스크롤바를 항상 표시 */
    scrollbar-width: thin; /* 스크롤바의 너비를 조절 */
}

.chatDiv::-webkit-scrollbar {
    width: 3px; /* 스크롤바의 너비를 조절 */
}
.chatDiv::-webkit-scrollbar-thumb {
    background-color: transparent; /* 스크롤바 색상을 투명하게 설정하여 보이지 않게 함 */
}


.chatList::-webkit-scrollbar {
    width: 0px;  /* 스크롤바의 너비를 조절 */
}

.chatList::-webkit-scrollbar-thumb {
    background-color: transparent;  /* 스크롤바 색상을 투명하게 설정하여 보이지 않게 함 */
}
.chatList {
    width: 402px;
    height: 670px;
    border : 1px solid black;
}

.Right {
    text-align: right;
}

.Right > .message {
   background-color : pink;
}
.Left {
    text-align: left;
}
.message {
  display: inline-block;
  max-width: 500px;
  border: 1px solid black;
  height: 40px;
  line-height: 43px;
  padding: 0 1rem;
  margin : 8px;
  border: 2px solid transparent;
  border-radius: 8px;
  background-color: rgb(207, 207, 207);
  color: #0d0c22;
  box-shadow: 0 0 5px rgb(233, 255, 231), 0 0 0 10px #f5f5f5eb;
  font-family: 'IBM Plex Sans KR', sans-serif;
}

.chat {
    width: 100%;
    display: inline-block;
    align-items: flex-end;
    color: black;
}

#chatInput {
    width: 620px;
    height: 120px;
    margin-left : 490px;
    margin-top : 25px;
    box-sizing: border-box;  
}

#chatInput > table {
    width: 100%;
    height : 95%;
}

#chatInput textarea {
    resize: none;
    padding : 15px;
    background-color: rgb(248, 244, 244);
}

#chatInput td {
    height : 100%;
    padding : 20px;
}

.chatList_box {
    border: 1px solid rgb(165, 165, 165);
    height : 110px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #ffffff;
    width : 400px;
    border-top-right-radius: 20px;
}

#chatList {
    width : 450px;
    height : 800px;
    border-top-right-radius: 20px;
}

.chatList {
	 border-top-right-radius: 20px;
	 border-bottom-right-radius: 20px;
	 overflow-x: hidden;
}

.chatList_box table {
    width : 100%;
    height : 80%; 
    border-top-right-radius: 20px;
}

.chatList_box img {
    width : 50px;
    height : 50px;
    border-radius: 30px;
}

.chatListText {
    font-size: 12px;
    color: gray;
    vertical-align: top;
    width :220px;
}

.chatListName {
    font-weight: bold;
    vertical-align: bottom;
}

.chatListTime {
    text-align: center;
    font-size: 10px;
    color: gray;
}

.chatListPic {
    text-align: center;
    width : 60px;
    height: 60px;
    margin-left: 10px;
}

.time {
   font-size : 13px;
   color      : gray;
}

.timeLeft {
 display : float;
 margin-left : 20px;
 border : 1px solid black;
}

.chatInfo {
    width : 80px;
    height: 670px;
    border : 1px solid black;
    background-color: rgb(255, 218, 218);
	border-top-left-radius: 18px;
    border-bottom-left-radius: 20px;
}

#chatInfoTable {
    width : 100%;
    text-align: center;
}

#chatInfoTable img {
    width : 80%;
    height : 80%;
    cursor: pointer;
}

#chatInfoTable tr {
    height : 30px;
}


 .count {
 	width : 25px;
 	height : 25px;
 	box-shadow : 0 0.05rem 0.6rem red;
 	border-radius : 17px;
 	margin : auto;
 	background-color : red;
 	color : white;
 	text-align : center;
 	line-height: 25px;
 	font-size : 12px;
 } 

#chatInfoTable button {
    background-color: transparent;
    border: 0px;
}
/*-------------------------전송버튼 css---------------------------------*/
#submitButton {
 align-items: center;
 background-color: #ffd8d8;
 border: 1px solid rgba(0, 0, 0, 0.1);
 border-radius: .25rem;
 box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
 box-sizing: border-box;
 color: rgba(0, 0, 0, 0.85);
 cursor: pointer;
 display: inline-flex;
 font-size: 16px;
 font-weight: 600;
 justify-content: center;
 line-height: 1.25;
 min-height: 3rem;
 padding: calc(.875rem - 1px) calc(1.5rem - 1px);
 text-decoration: none;
 transition: all 250ms;
 user-select: none;
 -webkit-user-select: none;
 touch-action: manipulation;
 vertical-align: baseline;
 width: auto;
}

#submitButton:hover,
#submitButton:focus {
 border-color: rgba(0, 0, 0, 0.15);
 box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
 color: rgba(0, 0, 0, 0.65);
}

#submitButton:hover {
 transform: translateY(-1px);
}

#submitButton:active {
 background-color: #F0F0F1;
 border-color: rgba(0, 0, 0, 0.15);
 box-shadow: rgba(0, 0, 0, 0.06) 0 2px 4px;
 color: rgba(0, 0, 0, 0.65);
 transform: translateY(0);
}

/*----------------------------사용자 화면 --------------------------*/
  .card-image > img{
        border: 1px solid black;
        width : 200px;
        height: 200px;
  }
  
 /*-------------------맨 처음 화면을 위한 css-------------------------*/
  .hidden {
       display: none;
   }
   
   /*----------------------편지봉투-------------------------*/

	 .tooltip-container {
	  height: 90px;
	  width: 160px;
	  border-radius: 5px;
	  background-color: #fff;
	  background-image: linear-gradient(
	    to left bottom,
	    #f2f5f8,
	    #ecf1f2,
	    #e7eceb,
	    #e3e7e4,
	    #e1e2de
	  );
	  border: 1px solid white;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  cursor: pointer;
	  box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.151);
	  position: relative;
	  transition: transform 0.3s ease;
	  margin : auto;
	}
	
	.tooltip-container::before {
	  position: absolute;
	  content: "";
	  top: -50%;
	  clip-path: polygon(50% 0, 0 100%, 100% 100%);
	  border-radius: 5px;
	  background-color: fff;
	  background-image: linear-gradient(
	    to left bottom,
	    #f2f5f8,
	    #e4eaec,
	    #d8dfde,
	    #cdd3cf,
	    #c5c7c1
	  );
	  width: 100%;
	  height: 50%;
	  transform-style: preserve-3d;
	  transform: perspective(1000px) rotateX(-150deg) translateY(-110%);
	  transition: transform 0.3s ease;
	}
	
	.tooltip-container .text {
	  color: rgb(32, 30, 30);
	  font-weight: bold;
	  font-size: 40px;
	}
	
	.tooltip {
	  position: absolute;
	  top: -20px;
	  opacity: 0;
	  background: linear-gradient(-90deg, rgba(0, 0, 0, 0.05) 1px, white 1px),
	    linear-gradient(rgba(0, 0, 0, 0.05) 1px, white 1px),
	    linear-gradient(-90deg, rgba(0, 0, 0, 0.04) 1px, white 1px),
	    linear-gradient(rgba(0, 0, 0, 0.04) 1px, white 1px),
	    linear-gradient(white 3px, #f2f2f2 3px, #f2f2f2 78px, white 78px),
	    linear-gradient(-90deg, #aaa 1px, white 1px),
	    linear-gradient(-90deg, white 3px, #f2f2f2 3px, #f2f2f2 78px, white 78px),
	    linear-gradient(#aaa 1px, white 1px), #f2f2f2;
	  background-size: 4px 4px, 4px 4px, 80px 80px, 80px 80px, 80px 80px, 80px 80px,
	    80px 80px, 80px 80px;
	  padding: 5px 10px;
	  border: 1px solid rgb(206, 204, 204);
	
	  height: 70px;
	  width: 110px;
	  border-radius: 5px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  transition-duration: 0.2s;
	  pointer-events: none;
	  letter-spacing: 0.5px;
	  font-size: 18px;
	  font-weight: 600;
	  text-shadow: 10px salmon;
	}
	.tooltip-container:hover {
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	.tooltip-container:hover::before {
	  transform: rotateY(0);
	  background-image: none;
	  background-color: white;
	}
	
	.tooltip-container:hover .tooltip {
	  top: -90px;
	  opacity: 1;
	  transition-duration: 0.3s;
	}
/*--------------------------------채팅 가이드를 위한 css--------------------------*/
   #hiddenDiv {
   	  float : center; 
   	  display : none; 
   	  position: fixed; 
   	  top: 50%; 
   	  left: 50%; 
   	  transform: translate(-50%, -50%); 
   	  background-color: white; 
   	  padding: 20px; 
   	  border-radius: 10px; 
   	  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
   	  width : 370px;
   	  text-align : center;
   	  }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="tooltip-container">
	  <span class="tooltip"></span>
	  <span class="text">💗</span>
	</div>
	
		<br>
    <div class="wrap">    
        <div class="wrapPC">
            <div class="chatInfo">
                <table id="chatInfoTable">
                    <tr>
                        <td>
                            <button onclick="chatHome();"><img src="https://cdn-icons-png.flaticon.com/128/5448/5448341.png"></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <button onclick="blockMembers();"><img src="https://cdn-icons-png.flaticon.com/128/5911/5911092.png"></button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="hiddenDiv">
				  <p></p>
				  <button id="hiddenDivCloseBtn">닫기</button>
			</div>
			
            <div class="chatList">
				
            </div>
            <div class="blockList">
				
            </div>

             <div class="chatDiv">
              <ul>
                  <li>
                      <div class="sender ">
                          <div></div>
                      </div>
                      <div class="chat">
                        <p></p> <label></label>
                      </div>
                  </li>
              </ul>
           </div>
          
          
          <div class="chatDiv2" style="display : none">
              <ul>
                  <li>
                      <div class="sender">
                          <div></div>
                      </div>
                      <div class="chat">
                          <p></p> <label></label>
                      </div>
                  </li>
              </ul>
          </div>
          
          
          <div class="chatDiv3" style="display : none">
              <ul>
                  <li>
                      <div class="sender">
                          <div></div>
                      </div>
                      <div class="chat">
                          <label style="align : right;"></label><p></p> 
                      </div>
                  </li>
              </ul>
          </div>
          

            <div id="profileDiv" class="hidden">
               
                <table> 
                   <tr>
                       <td colspan="3" style="height:250px; padding-top: 30px; "><img id="masterImg"> </td>
                   		<input type="hidden" id="deleteMasterEmail" value="">
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px; "><p style="font-size: 60px; margin : 0px;" id="masterName"></p></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px;" ><p id="mbti" style="font-size : 25px; margin : 0px;"></p></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px;"><p id="intro" style="padding : 25px; margin : 0px;"></p></td>
                   </tr>
                   <tr>
                       <td><div><button id="submitButton" onclick="blockMember(this);" style="background-color : rgb(255, 232, 232)">차단하기</button></div></td>
                       <td><div><button id="submitButton" onclick="deleteMessage(this);" style="background-color : rgb(255, 232, 232)">채팅 종료</button></div></td>
                       <td><div><button id="submitButton" onclick="Home();" style="background-color : rgb(255, 229, 229)">홈으로</button></div></td>
                   </tr>
                </table>
           </div>
        </div>
        <div id="chatInput" class="hidden">
            <table>
                <tr> 
                    <td>
                        <textarea style="width: 100%; height: 90%;" placeholder="메시지를 입력해주세요" name="message" id="message"></textarea>
                    </td>
                     <td style="width: 15%;"><button id="submitButton" style="width: 100%; height: 100%; margin-bottom : 5px; margin-left : 30px;>" onclick="sendMessage();" >전송</button></td> 
                </tr>
            </table>
        </div>
      </div>
    
        
  <script>

  
    $(function() {
    	//connect();
       getRoomList(); 
       countRoomAll();
       countAll();
       countAllMove();
    });
    
  
   function getRoomList() {
         $.ajax({
             url:"chatRoomList.do",
             data : {
                 userEmail:"${sessionScope.loginMember.email}"
             },
             dataType:"json",
             async:false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
             success:function(data){
                
                //console.log(data);
               
                $chatWrap = $(".chatList");

                for (var i in data) {
                    // user가 보낸사람인지, 나인지 확인하는 코드입니다.
                    var isCurrentUser = data[i].userEmail === "${sessionScope.loginMember.email}";

                    // main div를 먼저 생성해주고.
                    var $div = $("<div class='chatList_box' onclick='enterRoom(this);'>")
                        .attr("id", data[i].roomNo)
                        .attr("email", isCurrentUser ? data[i].masterEmail : data[i].userEmail);

                    // table 구조를 만드는 코드
                    var $table = $("<table>");

                    // 첫 번째 행을 만드는 코드
                    var $tr1 = $("<tr>");
                    $tr1.append($("<td rowspan='2' class='chatListPic'>").append($("<img>").attr("src", isCurrentUser ? "${pageContext.request.contextPath}/" + data[i].masterPic : "${pageContext.request.contextPath}/" + data[i].userPic)));
                    $tr1.append($("<td class='chatListName' style='height: 35px;'>").text(isCurrentUser ? data[i].masterName : data[i].userName));
                    $tr1.append($("<td class='chatListTime'>").text(data[i].sendTime + "분"));

                    // 2번째 행을 만드는 코드
                    var $tr2 = $("<tr>");
                    $tr2.append($("<td class='chatListText'>").text(data[i].messageContent));
                    $tr2.append($("<td class='chatListText'>").append($("<div class='countMessage'>")));
                    // 테이블에 넣어서 먼저 테이블 구조 완성하기
                    $table.append($tr1);
                    $table.append($tr2);

                    // main div에 붙여주기
                    $div.append($table);

                    // 그걸 chatWrap에 붙여주기
                    $chatWrap.append($div);
                }
             }
        });
   }
   
   </script>
   
   
   <!--  채팅방 관련 -->
   <script>
    let roomNo;
    let check = false; 
    var masterPic;
    function enterRoom(obj){
       
      // 현재 html에 추가되었던 동적 태그 전부 지우기
      $('div.chatDiv').html("");
      
         // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
         roomNo       = obj.getAttribute("id");
         masterPic    = obj.querySelector('img').src;
         email        = obj.getAttribute("email");

          // 해당 채팅 방의 메세지 목록 불러오기
           $.ajax({
             url:"messageList.do" ,
             data:{
                roomNo   : roomNo,
                userEmail:"${sessionScope.loginMember.email}"
             },
             async:false,
             dataType:"json",
             success:function(data){
            	 
                 for(var i = 0; i < data.length; i++){
                     // 채팅 목록 동적 추가 왜 인지 모르겠으나 얘 때문에 2번 붙음
                     CheckLR(data[i]);
                 }
                 
                 $.ajax({
                   url : "master.In",
                   data : {email : email},
                   success : function(master) {
 
                        $("#masterName").text(master.userName);
                        $("#masterImg").attr("src" , masterPic);
                        $("#mbti").text(master.mbti);
                        $("#intro").text(master.introduce);
                        $("#deleteMasterEmail").val(master.email);
                        
                   },
                   error : function() {
                      console.log("클릭한 방의 master 정보 얻어오기 실패");
                   }
                 
                 });
                 
             }, 
             error : function() {
            	 console.log("메시지 리스트 불러오기 실패");
             }
         });
          // 웹소켓 연결
          if (check){
             disconnect();
          }
             
          connect();
          console.log("enterRoom");

          $('#chatInput').removeClass('hidden');
          $('#profileDiv').removeClass('hidden');
          $('.wrap').css("width" , "1590px");
          $('.wrapPc').removeAttr("margin");
          $('.chatDiv').removeClass('hidden');
     }
   </script>
   
    <script>
        function chatHome() {
          //location.href="http://localhost:8081/mbting/convert.ch"; 
         if(socket != null) {
          disconnect();
         }
          $chatWrap = $(".chatList");
          $blockWrap = $(".blockList");
          $blockWrap.addClass('hidden');
          $chatWrap.removeClass('hidden');
          
          $('chatList').removeClass('hidden');
          $('#chatInput').addClass('hidden');
          $('#profileDiv').addClass('hidden');
          $('.wrap').css("width" , "482px");
          $('.wrapPc').attr("margin" , "auto");
          $('.chatDiv').addClass('hidden');
        }
 
    </script>
   
   <script>
    let socket;
   //연결 실행 시 실행될 함수
      
      function connect() {
         check = true;
         let url ="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat.do";
            
         socket = new WebSocket(url);
         console.log(socket);
         //연결 성공 시 실행할 함수 onopen 
         socket.onopen = function() {
             const data = {
                             "roomNo" : roomNo,
                             "name"   : "${ loginMember.userName }",
                             "email"  : "${ loginMember.email }",
                    "messageContent"  : "ENTER-CHAT"
                  };
                  
                let jsonData = JSON.stringify(data);
                  socket.send(jsonData);
         };
         
         //연결 종료 시 실행할 함수 onclose
         socket.onclose = function() {
            console.log("서버와 연결이 종료");
         };
         
         //연결 오류 발생 시 실행할 함수
         socket.onerror = function() {
            console.log("서버 오류남");
         };
         
         //메시지 수신 시에 실행되는 함수
         socket.onmessage = function(evt) {
        	 
              let receive = evt.data.split(",");
              
              //console.log(receive[0] + receive[1]);
              
              if((receive[0] == "세션 두명임 읽음팡팡 " && (receive[2] != "${sessionScope.loginMember.email}" )) || (receive[0] == "한 명이다 " && (receive[2] != "${sessionScope.loginMember.email}" ))) {
            	  $.ajax({
                      url:"messageList.do" ,
                      data:{
                         roomNo   : receive[1],
                         userEmail:"${sessionScope.loginMember.email}"
                      },
                      async:false,
                      dataType:"json",
                      success:function(data){
                    	  
                    	  //$('.chatDiv li').html("");
                          for(var i = 0; i < data.length; i++){
                              // 채팅 목록 동적 추가
                              CheckLR(data[i]);
                          }
                      }, 
                      error : function() {
                     	 console.log("메시지 리스트 불러오기 실패");
                      }
                  });  
              }else {
            	  
            	  let ce = "${sessionScope.loginMember.email}";
            	  chattingGuide(receive[1] , receive[2] , ce);
            
              const data = {
                           "name" : receive[0],
                          "email" : receive[1],
                 "messageContent" : receive[2],
                 "sendTime" 	  : receive[3],
                 "sessionCount"	  : receive[4]
              };
              
              CheckLR(data);
            }
         }
 
    }
      //연결 종료 시 실행될 함수 
      function disconnect() {
          socket.close();
          //location.href="http://localhost:8081/mbting";
      };

   //메세지를 전송하는 함수
   function sendMessage() {
      
      let message = $("#message").val();
      //console.log(message);
      if(message.trim() !== "") {
            //입력한 메세지가 있을 경우에만 전송하겠다는 뜻. 
            //websocket 객체의 send 메소드를 호출
     		
			
            const data = {
                "roomNo"           : roomNo,
                "name"             : "${ sessionScope.loginMember.userName }",
                "email"            : "${ sessionScope.loginMember.email }",
                "messageContent"   : message,
                "sendTime": "<%= formattedTime %>"
            }
            //console.log(data);
            //CheckLR(data);
      
            let jsonData = JSON.stringify(data);
        
                 socket.send(jsonData);
        
            $("#message").val("");//초기화 효과
         }
   }
   
   document.getElementById('message').addEventListener('keypress', function (e) {
       if (e.key === 'Enter') {
       	sendMessage();
           e.preventDefault(); // 폼 전송 방지
       }
   });
   
   // * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
    function CheckLR(data) {
        // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
        const LR = (data.email != "${ sessionScope.loginMember.email }") ? "Left" : "Right";
       
        let unReadMessage 	= data.unReadMessage;
        let unReadCount 	= data.sessionCount
        let email			= data.email;
        if(unReadCount == 2 || unReadMessage == 0) {
        	unReadCount = '읽음';
        }else {
            unReadCount = 1;
        }
        
        //console.log(unReadCount);
         // 메세지 추가
        //console.log(LR);
        appendMessageTag(LR, data.email, data.messageContent, data.name , data.sendTime, unReadCount);
    }
   
    // * 3 메세지 태그 append
    function appendMessageTag(LR_className, email, message, name , sendTime , unReadCount) {
         
        const chatLi = createMessageTag(LR_className, email, message, name , sendTime , unReadCount);
     
        //console.log(chatLi);
        $('div.chatDiv').append(chatLi);
     
        // 스크롤바 아래 고정
        $('div.chatDiv').scrollTop($('div.chatDiv').prop('scrollHeight'));
    }
    
    // * 4 메세지 태그 생성
    function createMessageTag(LR_className, email, message, name , sendTime , unReadCount) {
     
       //console.log(LR_className +email+message +name);
         // 형식 가져오기
         let chatLi = $("div.chatDiv2 ul li").clone();
         let chatLi2 = $("div.chatDiv3 ul li").clone();

         //console.log(chatLi);
          if(LR_className === 'Right') {
             chatLi2.find('.chat').addClass(LR_className);                 // left : right 클래스 추가
              // find() : chatLi의 하위 요소 찾기
              chatLi2.find('.sender div').text(name);                     // 이름 추가
              chatLi2.find('.chat p').text(message);                   // 메세지 추가
              chatLi2.find('.chat p').addClass("message");
              chatLi2.find('.sender div').addClass(LR_className);
              chatLi2.find('.chat label').addClass("time");
              chatLi2.find('.chat label').text(unReadCount + sendTime);
         }else {
         chatLi.find('.chat').addClass(LR_className);                 // left : right 클래스 추가
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.sender div').text(name);                  // 이름 추가
         chatLi.find('.chat p').text(message);                   // 메세지 추가
         chatLi.find('.chat p').addClass("message");
         chatLi.find('.sender div').addClass(LR_className);
         chatLi.find('.chat label').addClass("time");
         chatLi.find('.chat label').text(sendTime);
         }
        
         //console.log(chatLi);
         
         return [chatLi, chatLi2];
    };
   </script>   

   <!-- 방 내용 실시간으로 불러오기  -->
   <script>
   $(window).on('load', function(){
       // 초기에도 채팅 목록 불러오기
	   clickDiv();
       countAll();
   });
   
   function clickDiv() {
       var clickedDiv = null;

       // 클릭한 div 요소의 배경을 pink로 변경
       $(".chatList").on('click', '.chatList_box', function() {
           // 이전에 클릭한 div의 배경을 원래대로 돌리기
           if (clickedDiv !== null) {
               clickedDiv.css('background-color', '');
           }

           // 현재 클릭한 div의 배경을 pink로 변경
           $(this).css('background-color', 'pink');
        
           // 클릭한 div 정보 저장
           clickedDiv = $(this);
       });
    }

   function countAll() {
	   $.ajax({
		  	url  : "count.all",
		  	data : {email : "${sessionScope.loginMember.email}"},
		  	success : function(countAllUnReadMessage) {
		  		let countAll = document.querySelector(".tooltip");
		  		countAll.innerText = countAllUnReadMessage;
		  	},
		  	error : function() {
		  		console.log("전체 카톡 수 불러오기 실패 ㅎ.,.,,");
		  	}
	   });
   }
   
   function countRoomAll() {
	   $.ajax({
		  	url  : "countRoom.all",
		  	data : {email : "${sessionScope.loginMember.email}"},
		  	success : function(countRoomUnRead) {
		  		let countRoomAll = document.querySelector(".countMessage");

		  		 $('.chatList_box').each(function(index) {
			  	        let idValue = $(this).attr('id');
			  	  });
		  		 
		  		for(let i = 0; i < countRoomUnRead.length; i++) {
		  			room = countRoomUnRead[i].roomNo;
		  			let	countMessage = $("#" + room).find(".countMessage");
		  			countMessage.addClass("count");
		  			countMessage.text(countRoomUnRead[i].unReadMessage);
		  		}

		  	},
		  	error : function() {
		  		console.log("방 별 카톡 수 불러오기 실패.,.,,");
		  	}
		  	
	   });
   }
   </script>
   
   <script>
   let elementId;
   $(".chatList").on("click", ".chatList_box", function() {
      $(".chatList_box").not(this).css("background-color", "white");
      $(this).css("background-color", "pink");
      elementId = $(this).attr("id");
   });  
	
   <!-- 나가기 버튼 홈화면으로 돌려줌-->
   function Home() {
       location.href="${pageContext.request.contextPath}/";
   };
   
   function blockMembers() {
	     
	      $blockWrap = $(".blockList");
		  $blockWrap.html = "";
		  $('chatList').removeClass('hidden');
          $('#chatInput').addClass('hidden');
          $('#profileDiv').addClass('hidden');
          $('.wrap').css("width" , "482px");
          $('.wrapPc').attr("margin" , "auto");
          $('.chatDiv').addClass('hidden');
		  
	   $.ajax({
		  url : "list.block" ,
		  data : {"email" : "${sessionScope.loginMember.email}"},
		  type : "post" ,
		  success : function(data) {
			console.log(data);
			  
			  $blockWrap.removeClass('hidden');
			  
			  $chatWrap = $(".chatList");
			  $chatWrap.addClass("hidden");
			  
			  $blockWrap.text("");
			  
              for (var i in data) {

                  // main div를 먼저 생성해주고.
                  var $div = $("<div class='chatList_box'>")
                      .attr("email", data[i].email);

                  // table 구조를 만드는 코드
                  var $table = $("<table>");

                  // 첫 번째 행을 만드는 코드
                  var $tr1 = $("<tr>");
                  $tr1.append($("<td rowspan='2' class='chatListPic'>").append($("<img>").attr("src", "${pageContext.request.contextPath}/" + data[i].profileImg )));
                  $tr1.append($("<td  rowspan='2' style='height: 30px;'>").text(data[i].userName));
             
                  var $button = $("<button>").text("차단 해제").on("click", function() { unblock(this); }).attr("id", "submitButton").css("background-color", "lightgray");
                  // td 엘리먼트를 생성하고 버튼을 추가
                  var $td = $("<td  rowspan='2' style='height: 30px;'>").append($button);
				  // tr1에 td를 추가
                  $tr1.append($td);
                  
                  // 2번째 행을 만드는 코드
                  var $tr2 = $("<tr>");
                  
                  // 테이블에 넣어서 먼저 테이블 구조 완성하기
                  $table.append($tr1);
                  $table.append($tr2);

                  // main div에 붙여주기
                  $div.append($table);

                  // 그걸 chatWrap에 붙여주기
                  $blockWrap.append($div);
              }
		  }, 
		  error : function() {
			  console.log("차단 회원 불러오기 실패");
		  }
	   });
   }
      
   function deleteMessage(button) {
	   if(confirm("상대방과의 매칭이 종료됩니다. 정말로 나가시겠습니까?")){  
		 
		 var masterEmail = $(button).closest('table').find("input[type='hidden'][id='deleteMasterEmail']").val();
		 var userEmail = "${sessionScope.loginMember.email}";
		 
		 
		 $.ajax({
			url : "delete.mes",
			data : {"masterEmail" : masterEmail , "userEmail" : userEmail},
			success : function(response) {
				 if (response.success) {
					 location.href="${pageContext.request.contextPath}/convert.ch"; 
					 
					 alertify.alert('Alert', response.message, function() {
                         alertify.success('Ok');
                     });
				 }else {
					 alertify.alert('Alert', response.message, function() {
	                     alertify.success('Error');
	                 });
				 }
			},
			error : function() {
				console.log("메시지 삭제 실패함 ㅠ ");
			}
		 });
		 
		}else{
		    location.href="${pageContext.request.contextPath}/convert.ch"; 
		}
   }
   
   function blockMember(button) {
	     var blockMemEmail = $(button).closest('table').find("input[type='hidden'][id='deleteMasterEmail']").val();
		 var blockProEmail = "${sessionScope.loginMember.email}";
		 
		 //console.log("a" +blockMemEmail);
		 $.ajax({
			url  : "block.mem",
			type : "post" ,
			data : {"blockMemEmail" : blockMemEmail ,"blockProEmail" : blockProEmail },
			success : function(e) {

				location.href="${pageContext.request.contextPath}/convert.ch"; 
				
			},
			error : function() {
				
				console.log("회원 신고하기 실패");	
			}
		 });
   }
   
 	function chattingGuide(em, msg, ckEmail) {

 		let divId = "hiddenDiv";
 		
 		//console.log(ckEmail);ㅉㅉㅉㅉ
 		var Hello = ["안녕하세요", "안녕히세용", "안녕" , "안녕하십니까" , "안뇽" , "안넝" , "하이" , "ㅎㅇ"];
 		var Food  = ["드실래요?" , "음식좋아하세요" , "먹을래" , "드실까" , "좋아하는 음식 있으세요?"];
 		
 		var Place = ["어디서볼까요" , "어디서볼래" , "어디서보지" , "어디갈래" , "어디가편해", "어디가 편하세요"];
 		var Doing = ["뭐할래" , "뭐할까" , "뭐하지" , "뭐하고놀까" , "뭐하실래요", "뭐좋아하세요", "뭐하고싶어요" ];
 		
 		if(ckEmail == em && (Hello.some(hi => msg.includes(hi)))) {
 			 $("#" + divId).show();
 		     $("#" + divId).find("p").html("┍━━━━━━━━»•» 🌸 «•«━━━━━━━━┑ 첫 인사를 하고 계시는군요 !!<br> 보통 첫 인사 후에는 상대방 프로필의 취미에 대해서 <br> 공감을 하거나 프로필 사진에 대한 칭찬으로 <br> 시작하는 게 좋아요!<br> ex) <p style='color : green; margin : 0px;'>클라이밍 좋아하세요?</p> <br>tip!!<br> 질문을 너무 자주하거나 질문 후에 <br> 설명이 길면 안좋아요 <br> ex) <p style='color : red; margin : 0px;'>클라이밍 좋아하세요? 저도 좋아하는데 저는 ~~</p> ┕━━━━━━━━»•» 🌸 «•«━━━━━━━━┙");	
 		}else if(ckEmail == em && (Food.some(food => msg.includes(food)))) {
 			 $("#" + divId).show();
		     $("#" + divId).find("p").html("┍━━━━━━━━»•» 🌸 «•«━━━━━━━━┑ 흠 어떤 밥을 먹으러 갈 지 이야기 중인 것 같아요 맞나요?<br> 보통 첫 만남에서는 조용하고 분위기있는 <br>그리고 먹는 내 모습이 조신한 <br> 일식, 양식을 많이 먹어요. <br> ex) <p style='color : green; margin : 0px;'>파스타, 스시, 덮밥</p> <br>tip!!<br> 입을 크게 벌리거나 냄새베고 <br> 이빨에 끼는 음식은 피해요 <br> ex) <p style='color : red; margin : 0px;'>김치찌개, 햄버거, 고기, 생성구이, 국밥</p> ┕━━━━━━━━»•» 🌸 «•«━━━━━━━━┙");	
 		}else if(ckEmail == em && (Place.some(place => msg.includes(place)))) {
			 $("#" + divId).show();
		     $("#" + divId).find("p").html("┍━━━━━━━━»•» 🌸 «•«━━━━━━━━┑ 어디서 볼 지는 너무너무 중요해요!<br> 평균적으로 조용하고 분위기를 <br>유지할 수 있는 장소를 많이 가요 ! <br> ex) <p style='color : green; margin : 0px;'> 혜화동, 을지로, 종로(청계천)<br> 익선동, 성수<br> 만약 비가 온 다면 ? <br>실내 데이트!  </p> <br>tip!!<br> 날씨나 서로의 신발을 고려하지 못한 <br> 장소는 피해요 <br> ex) <p style='color : red; margin : 0px;'>더운 여름 등산<br> 힐 신은 여자인데 혜화 낙상공원 <br> 추운 겨울 장시간 밖에서 대기하는 맛집 <br> 비오는 날 사람 붐비는 익선동</p> ┕━━━━━━━━»•» 🌸 «•«━━━━━━━━┙");	
 		}else if(ckEmail == em && (Doing.some(doing => msg.includes(doing)))) {
			 $("#" + divId).show();
		     $("#" + divId).find("p").html("┍━━━━━━━━»•» 🌸 «•«━━━━━━━━┑ 뭐하느냐에 따라 솔탈이 달립니다..<br> 보통은 여자라면 이쁜 카페를 <br>미리 찾아서 보내주시면 좋아해요! <br> 혹시나 취미에 운동이 많다면 <br> 같은 취미를 하러가자해도 좋고요 <br><br> 남자라면 경기를 보러가자거나 <br>여자가 적극적으로 무언가를 하자는 걸 <br> 좋아할 수 있어요(보통 잘 안그래서) <br>ex) <p style='color : green; margin : 0px;'> 여자 : 익선동, 성수, 을지로, 문래 카페<br>(디저트 맛집 프렌차이즈 x!!!)<br> 특히 여자가 힐 신고 올 경우 <br> 지하철과 가까운 장소를 선정하세요 <br><br>남자 : 모르겠어요 제가 여자라서! </p> <br>tip!!<br> 여자는 예약 잘 하는 남자를 좋아해요 ㄹㅇ ex) <p style='color : red; margin : 0px;'>영화든 , 밥이든 미리 예약해놓으면 <br> 매우매우 좋아할 겁니다. </p> ┕━━━━━━━━»•» 🌸 «•«━━━━━━━━┙");	
 		}  		
	    
	    $("#hiddenDivCloseBtn").on("click", function() {
	    // 미리 만들어진 div 요ㄴ소를 숨김
	    $("#hiddenDiv").hide();
	   });
	  }
 	
     function unblock(button) {
    	    var $div = $(button).closest('.chatList_box');
    		var blockMemEmail = $div.attr("email");
		 	var blockProEmail = "${sessionScope.loginMember.email}";
		 //console.log("차단해제를 위한 정보" + blockMemEmail + blockProEmail);
		 	
		 $.ajax({
			url  : "unblock.mem",
			type : "post" ,
			data : {"blockMemEmail" : blockMemEmail ,"blockProEmail" : blockProEmail },
			success : function(e) {

				console.log(e);
			},
			error : function(e) {
				
				console.log(e);
			}
		 });
		 
		 /*
		 $.ajax({
					url : "unblock.mem",
					type : "post",
					data : {"blockMemEmail" : blockMemEmail , "blockProEmail" , blockProEmail},
					success : function() {
						console.log("차단 해제 성공");
					},
					error : function() {
						console.log("차단 해제 실패");
					}
				 });*/
     }
     
 	 // 2초에 한번씩 채팅 목록 불러오기
	 setInterval(function(){
	       $(".chatList").html("");
	      // 방 목록 불러오기
	      countRoomAll();
	      getRoomList(); 
	      countAll();
	      $("#" + elementId).css("background-color", "pink");
	 }, 1000);
 	 

   </script>
</body>
</html>