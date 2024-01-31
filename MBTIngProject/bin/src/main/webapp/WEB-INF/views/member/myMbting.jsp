<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://kit.fontawesome.com/22698b3d17.js" crossorigin="anonymous"></script>
    
   
<style>

	.my-content{
		width:100%;
		margin: auto;
		margin-top : 50px;
		margin-bottom : 50px;
	}

    /*
    ////////////////////
    slider 관련 스타일
    ////////////////////
    */

    /*슬라이더*/
    .profile-menu-title{
        margin: auto;
        width: 800px;
    }
    .slider{
        margin: auto;
        width: 800px;
        height: 210px;
        display: flex;
        flex-direction: row;
        justify-content:  space-around;
        align-items: center;

    }

    .slider-button{
        margin: auto;
        margin-top: 10px;
        margin-bottom: 30px;
        width: 720px;
        text-align: center;
    }
    .slider-button button{
        margin-bottom: 20px;
        height: 100%;
        padding: 5px;
        
    }

    #l-button{
        float: left;
    }
    #r-button{
        float: right;
    }
    
    /*
    ////////////////
    프로필 카드 스타일
    //////////////// 
    */

    .profile-wrap{
        
        height: 200px;
        width: 120px;
        /*
        부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
        */
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
        float: left;
        border: 1px solid lightgrey;
    }

    .profile-info{
        width: 100%;
        height: 90px;
        text-align: center;
        box-sizing: border-box;
    }

    .profile-info div{
        margin: 5px;
        height: 20px;
        line-height: 20px;
    }

    .profile-name{
        font-weight: bold;
    }
    .profile-mbti{
        color: gray;
    }

    .profile-img-box {
    background-color: white;
    width: 100%;
    height: 110px;

    /* 아이템을 수평, 수직 가운데 정렬하는 코드 */
    display: flex;
    flex-direction: column;
    /* 방향을 row로 바꾸면 한 줄로 나온다! */
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    }

    .profile-img {
        background-color: grey;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }

    /*
    ///////////////
    하단 메뉴 스타일
    ///////////////
    */
    .shortMenu-wrap{
    margin: auto;
    width: 800px;
    box-sizing: border-box;
    /*
    부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
    */
    display: flex;
    flex-direction: row;
    /* coulumn 은 하위 요소를 위에 부터 정렬 */
    align-items: center;
    /*하위 요소들 정렬 위치*/
    
    }
    .margin{
        width: 30px;
        box-sizing: border-box;
    }
    
    .shortMenu{
        border: 1px solid lightgray;
        box-sizing: border-box;
        height: 400px;
        width: 250px;
        /*
        부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
        */
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
        float: left;
    }

    .icon-box{
        margin-top: 10px;
        width: 100%;
        height: 35%;
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }

    i {
        margin: auto;
    }

    
    .shortMenu-info{
        width: 100%;
        height: 65%;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
    }

    .shortMenu-title{
        margin-top: 20px;
        width: 100%;
        height: 25px;
        text-align: center;
        line-height: 25px;
        font-weight: bold;
        font-size: 20px;
    }

    .shortMenu-content{
        width: 90%;
        margin: auto;
        font-size: 15px;
        height: 150px;
        display: flex;
        text-align: center;
        align-items: center;
        justify-content: center;
    }

    .shortMenu-button{
        margin-bottom: 20px;
    }

    .slick-wrap{
        margin: auto;
        border: 1px solid blue;
        width: 800px;
        display: flex;
        justify-content: center;
        
    }
    
    .profile-img2{
    	width: 100px;
    	height: 100px;
    }
    .slick2 div{
        border: 1px solid red;
        height: 100px;
        width: 100px;
        margin: auto;
    }
    

</style>
</head>
<body>


	<div>
		<jsp:include page="./myPage.jsp"></jsp:include>
	</div>

    <script>

    
	    let i = document.getElementById("myMbting");

        i.style.cssText = "border-top : 5px solid pink"
	    
    </script>
    
    <div class="slick-wrap">
        <div class="slick2">
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
            <div>
                <img class="profile-img2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
            </div>
         </div>
    </div>
	<!-- 신청자 리스트 출력용 스크립트 -->

	<script>
	    $(document).ready(function(){
	    	myStatProfile();
	    	proposerList();
         	setInterval(proposerList,5000);
         	setInterval(myStatProfile,5000);
	    	
	    	// 슬릭
            $('.slick2').slick({
                
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 3,
                slide: 'div',
                arrows : true,
                dots : true,
                prevArrow: '<button type="button" class="slick-prev">&#8592;</button>',
                nextArrow: '<button type="button" class="slick-next">&#8594;</button>'

            });
	    	
	    	
	    	// 매칭 신청자 리스트 확인용 ajax
	    	function proposerList(){
	    		
		    	$.ajax({
		    		
		    		url : "proposerList.me",
		    		type : "post",
		    		data : {"userNo":${sessionScope.loginMember.userNo}}, 
		    		success : function(result){
		    			
		    			let resultStr="";
		    			
		    			for(let i = 0; i < result.length; i++){
		    				
		    			let profileImg= "/mbting"+result[i].profileImg;
		    			
		    				 resultStr += "<form action='accept.me' method='post'>"
		    					 		+ "<div class='profile-wrap'>"
		    							+	"<div class='profile-img-box'>"
		    								+	"<img class='profile-img' src=" +profileImg+ ">"
		    							+	"</div>"
		    							+	"<div class='profile-info'>"
		    								+ "<div class='profile-name'>"
		    									+ result[i].userName
		    								+ "</div>"
		    							+ 	"<div class='profile-mbti'>"
		    									+ result[i].mbti
		    								+ "</div>"
		    								+ "<button type='submit'>수락</button>"
		    								+ "<input type='hidden' name='proposerNo' value="+ result[i].userNo + ">"
		    								+ "<input type='hidden' name='receiverNo' value="+ ${sessionScope.loginMember.userNo} + ">"
		    							+	"</div>"
		    							+ "</div>"
		    							+ "</form>";
		    			}
		    			
		    			// 매칭 신청자 리스트 출력 위치
		    			$(".slider").html(resultStr);
		    				
		    		},
		    		error : function(){
		    			
		    			console.log("매칭 신청자 리스트 조회용 ajax 통신 실패")
		    		}
		    		
		    	}) // ajax 끝
	    	}
	    	
	    	// 하단 메뉴바(내 상태) ajax 펑션 => 미완성 myRoomNo 정보는 불러오는 상태
	    	function myStatProfile(){
	    		
	    		$.ajax({
	    			url : "myStat.me",
	    			type : "post",
	    			data : {"userNo":${sessionScope.loginMember.userNo}},
	    			success : function(result){
	    				
	    				console.log(result);
	    			
	    			},
	    			error : function(){
	    				console.log("내 상태 표시용 ajax 통신 실패")
	    			}
	    			
	    		}); // ajax 끝
	    	}
	    	
	    	// 하단 메뉴바(내 대화 상대 표시용) ajax 펑션 => 미완성
	    	function myStatProfile(){
	    		
	    		$.ajax({
	    			url : "myChat.me",
	    			type : "post",
	    			data : {"userNo":${sessionScope.loginMember.userNo}},
	    			success : function(result){
	    				
	    				console.log(result);
	    			
	    			},
	    			error : function(){
	    				console.log("내 대화 상대 표시용 ajax 통신 실패")
	    			}
	    			
	    		}); // ajax 끝
	    	}
	    	
        })
        

	</script>

	<div class="my-content">
	    <div class="profile-menu-title">
	        <h5>만남 신청자</h5>
	    </div>
	    
	    <!-- 매칭 신청자 프로필 리스트 -->
	    <div class="slider">
	
			<!-- 매칭을 신청한 대상자 프로필 카드가 출력되는 부분 -->
	      
	    </div>
	    
	    <!-- 신청자 프로필 카드 슬라이드 컨트롤러-->
	    <div class="slider-button">
	        <button id="l-button"><<</button> <button>ooo</button> <button id="r-button">>>></button>
	    </div>
	
	    <!-- 하단 메뉴 카드 목록-->
        <div class="profile-menu-title">
            <h5>내 상태</h5>
        </div>

	    <div class="shortMenu-wrap">
            
	        <div class="shortMenu">
	            
	            <div class="icon-box">
	                <i class="fa-regular fa-circle-user fa-8x" style="color: #ffd1dc;"></i>
	            </div> 
	    
	            <div class="shortMenu-info">
	                <div class="shortMenu-title">
	                    프로필 편집
	                </div> 
	                <div class="shortMenu-content">
	                    사진을 등록하세요 <br>
	                    내용
	                    <br>
	                </div>
	                <div class="shortMenu-button">
	                    <button type="button" href="myProfile.me">정보 수정</button>
	                </div> 
	            </div>
	        </div>
	
	        <div class="margin"></div>
	
	        <div class="shortMenu">
	            
	            <div class="icon-box">
	                <i class="fa-regular fa-comments fa-8x" style="color: #ffd1dc;"></i>
	            </div> 
	    
	            <div class="shortMenu-info">
	                <div class="shortMenu-title">
	                    대화하기
	                </div> 
	
	                <div class="shortMenu-content">
	                    xx 님이 <br>
	                    대화를 기다리고 있어요!
	                </div>
	            
	                <div class="shortMenu-button">
	                    <button>내용 확인</button>
	                </div> 
	            </div>
	        </div>
	        
	        <div class="margin"></div>
	
	        <div class="shortMenu">
	            
	            <div class="icon-box">
	                <i class="fa-regular fa-credit-card fa-8x" style="color: #ffd1dc;"></i>
	            </div> 
	    
	            <div class="shortMenu-info">
	                <div class="shortMenu-title">
	                    결제 정보
	                </div> 
	                <div class="shortMenu-content">
	                    내용
	                </div>
	                <div class="shortMenu-button">
	                    <button>확인하기</button>
	                </div> 
	            </div>
	        </div>
	    </div>
    
    </div>

</body>

</html>