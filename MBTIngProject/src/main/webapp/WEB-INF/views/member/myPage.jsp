<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<!-- 폰트(notosans)-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">  
<style>
    * {font-family: 'NanumSquare';}
	
	.my-outer{
		width: 100%;
        margin: auto;
        
    }
    .my-header{
        border-bottom: 1px solid lightgrey;
    }

    /*프로필 헤더 스타일*/
    #profile-header{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
       
        display: flex;
    }
    
    .my-bottom{
    	padding: 50px;
    }

    .empty-space-w{
        width: 50px;
    }
    .empty-space-h{
        height: 35px;
    }

    /* 비밀번호 초기화 버튼 */
    #reset-pass{
        margin-left: auto;
        margin-top: 20px;
        width: 100px;
        height: 25px;
        font-size: 10px;
    }

    #profile-table{
        width: 550px;
    }


    /*프로필 이미지 박스 스타일*/
    #profile {
        width : 80px;
        height: 100px;
    }

    #profile-img{
        width: 150px;
        height: 150px;
        border-radius: 50%;
        background-image: url("${pageContext.request.contextPath}${sessionScope.loginMember.profileImg}");
        background-size: cover;
        background-position: center;
    }

    /*마이페이지 메뉴바 스타일*/
    #menuLine{
        margin: auto;
        margin-top: 20px;
        border: 1px solid pink;
        width: 1200px;
    }
    #mymenu{
        margin: auto;
		font-size: 16px;
    }

    .emptymenu{
        width: 80px;
    }
    #mymenu tr td {
        border-top: 5px solid white; 
    }

    #myInfo:hover, #myMbting:hover, #myReview:hover{
        cursor: pointer;
        border-top: 5px solid pink;
        
    }
    
    

    /*마이페이지 폰트 스타일*/
    #profileName{
        font-weight: bold;
        font-size: 20px;
    }

    #profile-stat-value{
        font-size: 16px;
        text-align: center;
        color: gray;
    }

    #profile-stat{
        font-size: 18px;
        text-align: center;
        font-weight: bold;
    }
</style>
</head>
<body>

	<div class="my-outer">
	
		<div class="my-header">
			<!-- 메뉴바 import 부분 -->
			<jsp:include page="../common/header.jsp"></jsp:include>
		
        </div>
	
	    <div>
	        <div id="profile-header">
	            <table id="profile-table">
	                <tr>
	                    <td colspan="6" style="font-weight: bold; font-size: 18px; width: 100px; height: 50px;">
	                    	${sessionScope.loginMember.email}
	                    </td>
	                </tr>
	                <tr class="empty-space-h">
	                    <td rowspan="4" id="profile">
	                        <div id="profile-img"></div>
	                    </td>
	                    <td class="empty-space-w"></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td class="empty-space-w"></td>
	                </tr>
	                <tr id="profile-stat-value">
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td>${sessionScope.loginMember.matchCoin}</td>
	                    <td></td>	                   
	                </tr>

	                <tr id="profile-stat">
	                    <td></td>
	                    <td>매칭상태</td>
	                    <td>매칭신청자</td>
	                    <td>매칭코인</td>
	                    <td></td>
	                </tr>
	                <tr class="empty-space-h">
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td id="profileName">${sessionScope.loginMember.userName}</td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	    
	            </table>
	        
	        </div>
	        
            <!-- 상단 회원 상태 표시용 스크립트 -->
            <script>

            	$(function(){    	
            		
           	 		/* 매칭 상태 표시용 스크립트 */
	             	let mStat = "${sessionScope.loginMember.matchStat}"
	 	                
	              	switch(mStat){
	              		case '1' : $("#profile-stat-value").children('td:eq(1)').html("매칭가능")
	              		break;
	              		case '2' : $("#profile-stat-value").children('td:eq(1)').html("수락대기")
	              		break;
	              		default : $("#profile-stat-value").children('td:eq(1)').html("대화중")
	              	}
	             	
	             	/* 매칭 신청자 수 확인용 펑션 실행 구문 */
	             	proposer();
	             	setInterval(proposer,5000);
	             	
	             	/* 매칭 신청자 수 확인용 스크립트 */
			})

			function proposer(){
	             		
				$.ajax({
					url : "proposerCount.me",
					type : "get",
					data : {userNo : ${sessionScope.loginMember.userNo}}, 
					success : function(result){
						
						$("#profile-stat-value").children('td:eq(2)').html(result);
						
					},
					error : function(){
						console.log("매칭 신청자 확인용 ajax 통신 실패	")
					}
					
				});	// ajax 끝
			} // 펑션 끝
			</script>
       
	        <div id="menuLine">
	        </div>
	        <table id="mymenu">
	            <tr>
	                <td class="emptymenu"></td>
	                <td class="myMenus" id="myInfo">
	                	내 프로필
	                </td>
	                <td class="emptymenu"></td>
	                <td class="myMenus" id="myMbting">
	                	내 상태
	                </td>
	                <td class="emptymenu"></td>
	                <td class="myMenus" id="myReview">
	                    내 후기
	                </td>
	                <td class="emptymenu"></td>
	            </tr>
	        </table>
	        
	        <!-- 하단 페이지 전환용 Script -->
		    <script>
		    
		    	$(function(){
		    		
		    		$("#myInfo").click(function(){
		    			
		    			$(location).attr("href", "myProfile.me")
		    		})
		    		$("#myMbting").click(function(){
		    			
		    			$(location).attr("href", "myPage.me")
		    		})
		    		$("#myReview").click(function(){

		    			$(location).attr("href", "myList.me?uno=${sessionScope.loginMember.userNo}")
		    		})
		    		
		    	});
		    
		    </script>

	    </div>
    
    </div>
    
    
    
</body>
</html> 