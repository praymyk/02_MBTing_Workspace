<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<meta charset="UTF-8">
<title>매칭하기</title>

<style>


.wrap {
	width : 1200px;
	margin: auto;
	font-family: 'NanumSquareBold';
}

.content_1 {
  width: 100%;
  margin: auto;
  background-color: #fff1f1; 
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); 
  border-radius: 10px; 
  padding: 30px;
  margin: 20px 0;
  transition: transform 0.3s ease-in-out;
}

#div {
    margin: 0 !important;
    width: 100%;
    border: 1px solid lightgray;
}
.content_2 {
  padding-top : 20px;
  font-family: 'Gasoek One', sans-serif;
  width : 100%;
  border-radius: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: auto;
}

.title, .more {
  padding: 10px 15px;
  text-shadow: 3px 3px 5px white;
}


.user {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  padding: 10px 15px;
  height : 200px;
  border-bottom : 1px solid lightgray;
  padding : 20px;
}

.user__content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-grow: 1;
}

.user__container {
  display: flex;
  flex-direction: column;
}

.title {
  font-weight: bold; /* 더 깔끔한 글자 두께로 변경 */
  font-size: 1.5em; /* 조금 크게 변경 */
  margin-bottom: 30px; /* 마진 조정 */
  text-align: center;
  color: #333; /* 어두운 글자색으로 변경 */
  letter-spacing: 1px; /* 글자 사이 간격 설정 */
  transition: color 0.3s ease-in-out, font-size 0.3s ease-in-out;
}

.name {
   font-weight: 900;
   font-size : 20px;
}

.mbti {
  font-size: 15px;
  color: #64696e;
  border-radius : 8px;
  margin-top : 10px;
  padding : 5px;
  width : 48px;
  background-color: rgb(242, 242, 242);
 }

.text {
 height : 150px;
 width : 200px;
 padding : 3px;
}

.image {
  width: 200px;
  height: 200px;
  border-radius: 25px;
  margin-right: 15px;
}

.follow {
  border: none;
  border-radius: 25px;
  background-color: #0f1113;
  color: white;
  padding: 8px 15px;
  font-weight: 700;
}
.address {
  font-size: 15px;
  color: #64696e;
  border-radius : 8px;
  margin-top : 10px;
  padding : 5px;
  width : 98px;
  background-color: rgb(242, 242, 242);
  margin-bottom : 10px;
}

.match {
 color : gray;
 font-size : 14px;
}
.more {
  display: block;
  text-decoration: none;
  color: rgb(29, 155, 240);
  font-weight: 800;
}

.user:hover {
  background-color: white;
  border: 1px solid gray;
  transform: scale(1.05);
  border-radius: 50px;
}

.more:hover {
  background-color: white;
  border-radius: 0px 0px 15px 15px;
}

.follow:hover {
  background-color: #2c3136;
}

.introMe {
	/*border : 1px solid lightgray;*/
	width : 450px;
	height : 130px;
	padding-top : 45px;
	color : gray;
}
/*----------프로필 사진 card 스타일-----------------*/

.image {
	margin-top : 35px;
}
.cardImage img {
    width : 160px;
    height : 160px; 
    border-radius: 10px;
    border: 2px solid lightgray;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); 
	object-fit: cover;

}


.cardImage {
	 border-radius: 100px;
	 background-color: transparent;
}

.cardImage img:active {
 	 transform: scale(0.95) rotateZ(1.7deg);

}

/*-------------좋어요 버튼----------------*/
#button {
    padding: 0 15px 0 15px;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 7px #e7413373;
    color: gray;
    font-size: 14px;
    border: none;
    display: flex;
    align-items: center;
    transition: all .5s ease-in-out;
    letter-spacing: 2px;
}
			
#button:hover {
    background-color: #f54d3e;
    transition: all .5s ease-in-out;
    box-shadow: 0px 0px 5px 3px #e7413373;
    color: white;
}
			
#button::before {
    content: "";
    background-image: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNzUycHQiIGhlaWdodD0iNzUycHQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDc1MiA3NTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiA8cGF0aCBkPSJtMzc2LjMyIDU1Mi4zYy0wLjM4NjcyIDAtMC43ODEyNS0wLjAxNTYyNS0xLjE3MTktMC4wNTA3ODEtMS4wNzgxLTAuMDc0MjE5LTIuMTM2Ny0wLjI2NTYyLTMuMTU2Mi0wLjU0Njg4LTIuNzMwNS0wLjU5Mzc1LTUuMjkzLTEuODUxNi03LjM0MzgtMy43ODEybC0xMzcuNTQtMTI5LjY2Yy00NC40NTMtNDEuOTAyLTQ5LjQ4LTExNS40Ni0xMS4yMTUtMTYzLjk3IDE5LjA4Mi0yNC4xODQgNDUuNzctMzguNjk1IDc1LjE1Mi00MC44NTUgMjguOTMtMi4xMTcyIDU2Ljg2MyA4LjAzMTIgNzguNjggMjguNTk4bDYuMjY1NiA1LjkwMjMgNi4yNjU2LTUuOTAyM2MyMS44MzItMjAuNTcgNDkuODA1LTMwLjY5MSA3OC42OTEtMjguNTk4IDI5LjM4MyAyLjE2NDEgNTYuMDY2IDE2LjY3NiA3NS4xNDUgNDAuODU1IDM4LjI2MiA0OC41MTIgMzMuMjM0IDEyMi4wNy0xMS4yMTUgMTYzLjk3bC0xMzcuNTQgMTI5LjY3Yy0yLjk5MjIgMi44MTY0LTYuOTM3NSA0LjM3NS0xMS4wMjMgNC4zNzV6bS03Ny44MTItMzA3LjAxYy0xLjY5NTMgMC0zLjM5NDUgMC4wNjI1LTUuMTAxNiAwLjE4NzUtMjAuMjgxIDEuNDk2MS0zOC44NTIgMTEuNjkxLTUyLjI4MSAyOC43MTEtMjguMjE1IDM1Ljc3My0yNC42MTMgODkuOTEgOC4wMjczIDEyMC42OGwxMjYuODQgMTE5LjU5IDEyNi44NC0xMTkuNTljMzIuNjQ1LTMwLjc3MyAzNi4yNDYtODQuOTEgOC4wMjczLTEyMC42OC0xMy40MjItMTcuMDItMzEuOTg0LTI3LjIxNS01Mi4yNy0yOC43MTEtMTkuODI4LTEuNDY0OC0zOS4xMDUgNS42MjExLTU0LjI4NSAxOS45MzRsLTE3LjI4NSAxNi4yOTNjLTYuMTk1MyA1LjgzOTgtMTUuODU5IDUuODM5OC0yMi4wNDcgMGwtMTcuMjg1LTE2LjI5M2MtMTMuODcxLTEzLjA3OC0zMS4xNzYtMjAuMTE3LTQ5LjE4LTIwLjExN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+Cg==");
    background-size: 100%;
    background-repeat: no-repeat;
    color: transparent;
    position: relative;
    width: 50px;
    height: 50px;
    display: block;
    margin-right: 5px;
    transition: all .9s ease-in-out;
}
			
#button:hover:before {
    background-image: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNzUycHQiIGhlaWdodD0iNzUycHQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDc1MiA3NTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiA8cGF0aCBkPSJtMzY5Ljg0IDU1MC4yOGMwLjQ3MjY2IDAuNDcyNjYgMC45NDUzMSAwLjQ3MjY2IDAuOTQ1MzEgMC45NDUzMSA2NS4zNTUtNTEuNjIxIDE5My43LTE0OC4yMyAxOTMuNy0yNDkuMTEgMC01NS44ODMtNDUuNDY1LTEwMS4zNS0xMDEuMzUtMTAxLjM1LTM5Ljc4MSAwLTc0LjM1MiAyMy4yMDctOTAuOTI2IDU2LjgyOC0wLjQ3MjY2IDAuOTQ1MzEtMS40MjE5IDMuMzE2NC0xLjQyMTkgMy4zMTY0cy0wLjk0NTMxLTEuODk0NS0wLjk0NTMxLTIuMzY3MmMtMTYuMTAyLTM0LjA5LTUwLjY3Mi01Ny43Ny05MC45MjYtNTcuNzctNTUuODgzIDAtMTAxLjM1IDQ1LjQ2MS0xMDEuMzUgMTAxLjM0IDAgMTAxLjgyIDEyNy44NyAxOTcuMDEgMTkyLjI3IDI0OC4xNnoiIGZpbGw9IiNmZmYiLz4KPC9zdmc+Cg==");
    transition: all .9s ease-in-out;
    transform: rotate(-1turn);
}
			
.like {
    display : inline-block;
    margin-left: 80px;
}

/*---------------------------------검색바--------------------------------*/

 #searchTable {
 	text-align : center;
 	margin : auto;
	/*text-shadow: 2px 2px  white;*/
	font-size: 16px;
	font-weight: bold;
 }
 
.select {
  width: 150px;
  padding: 0.8em 0.5em;
  border: none;
  font-family: 'Gasoek One', sans-serif;
  border-radius: 25px; /* Adjusted border radius for a smoother appearance */
  appearance: none;
  text-align: center;
  box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* Improved box shadow for a subtle effect */
  cursor: pointer;
  height: 50px;
  margin: 10px;
  transition: background-color 0.5s ease-in-out, transform 0.3s ease-in-out;
  color : gray;
}

/* Added focus effect for better user experience */
.select:focus {
  outline: none;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.select:hover {
    background-color: #ffcccc;  /* Red shade for hover background */
  transform: scale(1.05); /* Slightly increased scale on hover for a subtle effect */
  box-shadow: 0px 0px 15px rgba(255, 77, 77, 0.3); /* Enhanced box shadow on hover for depth */
}
 

 #genderCheck {
 	text-align : center;
 }
 
 .genderButton {
 	border : 0px;
 	background-color : transparent;
 	border-radius : 5px;
	margin: 0px 10px;
 }
 
  .borders {
	/*background-color: white;*/
	transition: all .5s ease-in-out;
  }

	#Men {
	  width: 100px;
	  height: 80px;
	  border: none;
	  border-radius: 20px; /* 둥근 테두리 */
	  cursor: pointer;
	  transition: background-color 0.5s ease-in-out, transform 0.3s ease-in-out;
	  margin-bottom : 15px;
	}
	
	#Men:hover {
	  background-color: #add8e6; /* 연한 하늘색으로 변경 */
	  transform: scale(1.05); /* 약간 크기 확대 효과 */
	  color : white;
	}
	
	#woMen {
	  width: 100px;
	  height:80px;
	  border: none;
	  border-radius: 20px; /* 둥근 테두리 */
	  cursor: pointer;
	  transition: background-color 0.5s ease-in-out, transform 0.3s ease-in-out;
	  margin-bottom : 15px;
	}
	
	#woMen:hover {
	  background-color: #ffb3b3; /* 더 연한 분홍색으로 변경 */
	  transform: scale(1.05); /* 약간 크기 확대 효과 */
	  color : white;
	}

 #searchButton {
  display: inline-block;
  position: relative;
}

#searchButton button {
  position: relative;
  padding: 30px 60px; /* 버튼의 크기 및 간격을 조절할 수 있습니다. */
  border: none;
  background-color: transparent; /* 배경색을 투명하게 설정합니다. */
  cursor: pointer;
  left : 725px;
}

#searchButton button::before {
  content: '\2665'; /* 유니코드로 하트 모양을 나타냅니다. */
  font-size: 100px; /* 아이콘의 크기를 조절할 수 있습니다. */
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  color: white; /* 하트의 색상을 지정합니다. */
}

#searchButton button::after {
  content: '검색'; /* 추가하고자 하는 텍스트를 지정합니다. */
  display: block;
  position: absolute;
  left: 48%;
  top: 38%; /* 텍스트의 위치를 조절할 수 있습니다. */
  transform: translateX(-50%);
  font-size: 20px; /* 텍스트의 크기를 조절할 수 있습니다. */
  color : rgb(160, 160, 160);
}
</style>
</head>

<body>

	<!-- 메뉴바 header -->
	<jsp:include page="../common/header.jsp"/>
		
    <div class="wrap">
    <br>
    
	
    	<div class="content_1">

			<input type="hidden" value="N"  name="gender" id="gender">
			<div id="genderCheck">
				<button id="Men"   class="genderButton " type="button" onclick="Gender(1);" ><img style="height : 40px;"src="https://cdn-icons-png.flaticon.com/128/3741/3741578.png"> 남자 </button>
				<button id="woMen" class="genderButton " type="button" onclick="Gender(2);" ><img style="height : 40px;"src="https://cdn-icons-png.flaticon.com/128/3741/3741708.png"> 여자</button>
			</div>
			<br>
        	<table id="searchTable">
        		<tr>
        			<td>키</td>
        			<td>거주지</td>
        			<td>나이</td>
        			<td>MBTI</td>
        		</tr>
        		<tr>
        			<td>
	        			<select name="height" class="select" onchange="searchPerson();">
	        				   <option value="없음">없음</option>
			    			   <option value="000160">160이하</option>
			    			   <option value="160165">160~165</option>
			    			   <option value="165170">165~170</option>
			    			   <option value="170175">170~175</option>
			    			   <option value="175180">175~180이상</option>
			    			   <option value="180250">180이상</option>
	    				</select>
        			</td>
        			<td>
        				<select name="address" class="select" onchange="searchPerson();">
        						<option value="없음">없음</option>
		    			   		<option value="서울특별시">서울특별시</option>
						   		<option value="부산광역시">부산광역시</option>
						   		<option value="대구광역시">대구광역시</option>
							    <option value="인천광역시">인천광역시</option>
							    <option value="광주광역시">광주광역시</option>
							    <option value="대전광역시">대전광역시</option>
							    <option value="울산광역시">울산광역시</option>
							    <option value="세종특별시">세종특별시</option>
							    <option value="경기도">경기도</option>
							    <option value="강원도">강원도</option>
							    <option value="충청북도">충청북도</option>
							    <option value="충청남도">충청남도</option>
							    <option value="전라북도">전라북도</option>
							    <option value="전라남도">전라남도</option>
							    <option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
								<option id="jeju" value="제주도">제주도</option>
    					</select>
        			</td>
        			<td>
        				<select name="age" class="select" onchange="searchPerson();">
        					   <option value="없음">없음</option>
			    			   <option value="2025">20~25</option>
			    			   <option value="2530">25~30</option>
			    			   <option value="3035">30~35</option>
			    			   <option value="3540">35~40</option>
			    			   <option value="4045">40~45</option>
			    			   <option value="4550">45~50</option>
			    			   <option value="5099">50대이상</option>
    					</select>
        			</td>
        			<td>
        				<select name="mbti" class="select" onchange="searchPerson();">
        					   <option value="없음">없음</option>
			    			   <option value="INTP">INTP</option>
			    			   <option value="INTJ">INTJ</option>
			    			   <option value="INFP">INFP</option>
			    			   <option value="INFJ">INFJ</option>
			    			   <option value="ISTP">ISTP</option>
			    			   <option value="ISFP">ISFP</option>
			    			   <option value="ISTJ">ISTJ</option>
			    			   <option value="ISFJ">ISFJ</option>
			    			   <option value="ENTP">ENTP</option>
			    			   <option value="ENTJ">ENTJ</option>
			    			   <option value="ESTP">ESTP</option>
			    			   <option value="ESTJ">ESTJ</option>
			    			   <option value="ENFP">ENFP</option>
			    			   <option value="ENFJ">ENFJ</option>
			    			   <option value="ESFP">ESFP</option>
			    			   <option value="ESFJ">ESFJ</option>
    					</select>
        			</td>
        		</tr>
    		</table>
	</div>

    
    <div id="div"></div>
    

	<div class="content_2">	
		<div class="user__container">
        	
		</div>
	</div>

   </div> 

   
   <!-- gender를 처리하기 위한 script -->
   <script>
   	function Gender(num) {
   		if(num == 1) {
   			$("#gender").val("M"); 
   			$("#Men").addClass("borders");
   			$("#woMen").removeClass("borders");
   			searchPerson();
   		}else {
   			$("#gender").val("F"); 
   			$("#woMen").addClass("borders");
   			$("#Men").removeClass("borders");
   			searchPerson()
   		}	
   	}        
   	                       
   </script>
  
  
  <!-- memberList를 불러오기 위한 script -->
  <script>
  
  	$(function() {
  		// personDetail();
  		selectAllMemberList();
  	});
  	
  	function selectAllMemberList() {
  		
  		$.ajax({
  			url  : "all.memList" , 
  			type : "get" , 
  			success : function(mem) {
  				resultStr = "";
  				//console.log(mem);
  				for(let i in mem) {
 				
					 resultStr +=  "<div class='user' id='user" + mem[i].userNo + "'>" +
					 			 	"<div class='image'>" + 
					 			 		"<div class='cardImage'>" +
					 			 			"<img src='${pageContext.request.contextPath}" + mem[i].profileImg +   "'>" +
						  				"</div>" +
						  			"</div>" +
						  			"<div class='user__content'>" +
						  			 "<div class='text'>" +
						  			 "<span class='name'>" + mem[i].userName + "</span>" +
						  			 "<div class='mbti'>" + mem[i].mbti + "</div>" + "<div class='address'>" + mem[i].address + "</div>" + "<div class='match'>" + "❤️ " + mem[i].matchingCount + "명이 매칭 신청" + "</div>" +
						  			 "</div>" +
						  			 "<div class='introMe'>" + mem[i].introduce + "</div>" +
						  			 "<div class='like'><button id='button' onclick='requestMatch(this , " + mem[i].userNo + ");' ><span>채팅신청</span></button></div>" +
						  			 "</div>" +
						  			 "</div>"
						  			 
						  $(".user__container").html(resultStr);	

  				}
  				
  				checkReceiver();
  		  		checkProposer();
  		  		checkMatching();
  		  		
  			},
  			error : function() {
  				console.log("멤버 전체 조회에 실패했습니다.");	
  			}
  		});
  	}
  	
  	<!--사람을 검색한 값을 넘겨주는 function-->
  	function searchPerson() {
  		$.ajax({
  			url : "search.li" ,
  			type : "get",
  			data : {"height" : $('select[name="height"]').val(),
  					"age" 	 : $('select[name="age"]').val(),
  					"address": $('select[name="address"]').val(),
  					"mbti"	 : $('select[name="mbti"]').val(),
  					"gender" : $('input[name="gender"]').val(),
  					"userNo" : ${sessionScope.loginMember.userNo},
  					"email"  : "${sessionScope.loginMember.email}"
  			},
  			success : function(searchMem) {
  				//console.log(searchMem);
  				if(searchMem == "") {
  					 $(".user__container").html("<h1 style='margin : auto;'> 일치하는 회원이 없습니다. </h1>");
  				}else {
  				
  				resultStr = "";
  				
  				for(let i in searchMem) {
  					 //$('.content_2').children().remove();
  					 console.log(searchMem);
					 resultStr +=  "<div class='user' id='user" + searchMem[i].userNo + "'>" +
					 			 	"<div class='image'>" + 
					 			 		"<div class='cardImage'>" +
					 			 			"<img src='${pageContext.request.contextPath}" + searchMem[i].profileImg +   "'>" +
						  				"</div>" +
						  			"</div>" +
						  			"<div class='user__content'>" +
						  			 "<div class='text'>" +
						  			 "<span class='name'>" + searchMem[i].userName + "</span>" +
						  			 "<div class='mbti'>" + searchMem[i].mbti + "</div>" + "<div class='address'>" + searchMem[i].address + "</div>" + "<div class='match'>" + "❤️ " + searchMem[i].matchingCount + "명이 매칭 신청" + "</div>" +
						  			 "</div>" +
						  			 "<div class='introMe'>" + searchMem[i].introduce + "</div>" +
						  			"<div class='like'><button id='button' onclick='requestMatch(this , " + searchMem[i].userNo + ");' ><span>채팅신청</span></button></div>" +
						  			 "</div>" +
						  			 "</div>"
						  			 
						  $(".user__container").html(resultStr);
  				}
  				
  			 }
  				checkReceiver();
  		  		checkProposer();
  		  		checkMatching();
  			},
  			error : function() {
  				console.log("검색 회원 조회에 실패했습니다.");
  			}
  		}); 		
  	}
	
  </script>
        
  <script>
	function requestMatch(e , num) {
		
		let receiverNo;
		
		if(e.innerText == '수락') {
			
			receiverNo = ${sessionScope.loginMember.userNo};
			proposerNo = num;
			
			$.ajax({
	             type: "GET",
	             url: "accept.me",
	             data: {"receiverNo" : receiverNo, "proposerNo" : proposerNo},
	             success: function(response) {
	            	 //console.log("하하 성공");
	            	 e.style.backgroundColor = "#DDDEA5";
	            	 e.style.color = "white";
	            	 e.innerText = "채팅하기";
	            	 location.href="${pageContext.request.contextPath}/convert.ch";
	             },
	
	             error: function() {
	                 // 에러 처리
	                 alertify.error('Error occurred while processing the request.');
	             }
        });
			
		}else if(e.innerText == '수락 대기중'){
			$.ajax({
				type : "POST",
				url  : "cancle.mat",
				data : {"proposerNo" : ${sessionScope.loginMember.userNo}, "receiverNo" : num },
				success : function(response) {
					
					 if (response.success) {
	                      // 성공 메시지 표시
	                      alertify.alert('Alert', response.message, function() {
	                            alertify.success('Ok');
	                      });
	                      e.style.backgroundColor = "";
	                      e.innerText = "채팅신청";
	                      
					 }else {
						  alertify.alert('Alert', response.message, function() {
	                            alertify.error('Error');
	                      });
					 }   
	                      

				},
				error : function() {
					console.log("취소 실패");
				}
			});
			
		}else if(e.innerText == '채팅하기'){
			location.href="${pageContext.request.contextPath}/convert.ch";
		}else {
			
			receiverNo  = num;
			$.ajax({
	             type: "GET",
	             url: "updateMatchRequestList.mb",
	             data: {"receiverNo" : receiverNo},
	             success: function(response) {
	            	 //console.log("하하 성공");
	                 if (response.success) {
	                     // 성공 메시지 표시
	                     alertify.alert('Alert', response.message, function() {
	                         alertify.success('Ok');
	                     });
						
	             		e.style.backgroundColor = "#f54d3e";
	            		e.innerText = "수락 대기중";
	
	                     // 코인 수 업데이트
	                     var matchCoin = Number('${sessionScope.matchCoin}') - 1;
	                     // 세션의 matchCoin 값을 업데이트하는 코드를 추가해야 합니다.
	                     // 예: sessionScope.matchCoin = matchCoin;
	                 } else {
	                     // 실패 메시지 표시
	                     alertify.alert('Alert', response.message, function() {
	                         alertify.error('Error');
	                     });
	
	                     // 코인 부족 시 처리
	                     if (response.message.includes("코인 부족")) {
	                         alert("코인이 부족합니다. 코인 충전 후 다시 시도해 주세요.");
	                     }
	                 }
	             },
	
	             error: function() {
	                 // 에러 처리
	                 alertify.error('Error occurred while processing the request.');
	             }
         });
		}
 	}
  </script>
  
  <script>
  	
  	  function checkProposer() {
  		  $.ajax({
  			 url : "check.pro",
  			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
			 success : function(proposerNoList) {
				 
				 for(let i in proposerNoList) {
					 const button = $("#user" + proposerNoList[i].receiverNo).find("button");
					 button.css("background-color", "#f54d3e");
					 button.text("수락 대기중");
				 }
				 
			 }, 
			 error : function() {
				 console.log("내가 신청한 회원 정보 불러오기 실패...");
			 }
  		  });
  	  }
  	  
  	  function checkReceiver() {
  		$.ajax({
 			 url : "check.rec",
 			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
			 success : function(receiverNoList) {
				 //console.log("나한테 신청 온 사람들");
				 //console.log(receiverNoList);
				 for(let i in receiverNoList) {
					 const button = $("#user" + receiverNoList[i].proposerNo).find("button");
					 button.css("background-color", "#94B9F3");
					 button.css("box-shadow", "0px 0px 5px 3px #AAB59E");
					 button.text("수락");
				 }
				 
			 }, 
			 error : function() {
				 console.log("나한테 요청한 회원 정보 불러오기 실패...");
			 }
 		  });
  	  }
  	  
  		function checkMatching() {
  		$.ajax({
 			 url : "check.mat",
 			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
			 success : function(matchingList) {
				// console.log("매칭리스트" + matchingList[0].receiverNo);
						 
				 for(let i in matchingList) {
					 
					 let matchPerson = (${sessionScope.loginMember.userNo} == matchingList[i].proposerNo ) ? matchingList[i].receiverNo : matchingList[i].proposerNo;
					 
					 //console.log("나랑 매칭된 사람 번호임 :" +  matchPerson);
					
					 const button = $("#user" + matchPerson).find("button");
					
					 button.css("background-color", "#DDDEA5");
					 button.css("box-shadow", "0px 0px 5px 3px #AAB59E");
					 button.css("color", "white");
					 button.text("채팅하기");
					 
				 }
				 
			 }, 
			 error : function() {
				 console.log("함께 매칭된 사람들 요청 실패...");
			 }
 		  });
  	  }

  </script>

</body>
</html>