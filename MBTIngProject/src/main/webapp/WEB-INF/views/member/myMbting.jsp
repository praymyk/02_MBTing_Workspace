<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- 폰트(notosans)-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<!-- 아이콘-->
<script src="https://kit.fontawesome.com/22698b3d17.js" crossorigin="anonymous"></script>

<style>
    	*{font-family: 'NanumSquare';
    caret-color: transparent;
    }

	.my-content{
		width:100%;
		margin: auto;
		margin-top : 80px;
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
        margin-bottom: 50px;
        height: 100px;
        width: 1200px;
        border-radius: 10px;
        background-image:url(https://dudeplace.co/wp-content/uploads/2021/04/1.%E0%B8%8B%E0%B8%B5%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B9%8C%E0%B9%80%E0%B8%81%E0%B8%B2%E0%B8%AB%E0%B8%A5%E0%B8%B5-Please-Dont-Meet-the-Man-%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88-%E0%B9%80%E0%B8%AD%E0%B9%84%E0%B8%AD%E0%B8%A7%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%81.jpg);
        background-size: cover;
        background-position:10% 50%;
        
        font-size: 26px;
        font-weight: bold;
        color: white;
        text-align: center;
        line-height: 100px;
    }
    
    /*
    ///////////////
    하단 메뉴 스타일
    ///////////////
    */
    .shortMenu-wrap{
    margin: auto;
    width: 1200px;
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
        margin: auto;
        border: 1px solid lightgray;
        box-sizing: border-box;
        height: 500px;
        width: 400px;
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
        margin: 5px;
        width: 90%;
        margin-bottom: 15px;
        padding: 5px;
    }

    .shortMenu-button button{
        height: 40px;
        width: 100%;
        border: 1px;
        border-radius: 10px;
        background-color: pink;
        color: white;
        font-weight: bold;
    }

    .shortMenu-button button:hover{
        background-color: hotpink;
        cursor: pointer;
    }

    
    /*
    ////////////////
    슬라이드 스타일
    //////////////// 
    */

    ul,ol,li {list-style: none;}

    .slider-wrap{
        width: 1200px;
        margin: auto;
        margin-bottom: 80px; 
        
    }
    
	.slider {
        max-width: 1200px;
        margin: 50px auto 0;
        font-size: 0;
        text-align: center;
    }

	.slider .inner {
        overflow: hidden;
        height: 450px;
        width: 100%;
        margin: 0 auto;
        padding: 100px 0;
        border-radius: 5px;
        background-color: white;
        
        
    }

	.slide_list > li {
        position: relative;
        width: 150px; 
        height: 210px;
        margin-left: 30px;
        margin-right: 30px;
        font-size: 10px;
        z-index: 0;
        transform: scale(1); 
        transition: all 0.3s;}
	
	/* 영역별 크기 설정 */
	.slide_list > li.swiper-slide-next,
	.slide_list > li.swiper-slide-prev,
	.slide_list > li.swiper-slide-duplicate-next,
	.slide_list > li.swiper-slide-duplicate-prev {z-index: 50;transform: scale(1.3);}
	.slide_list > li.swiper-slide-active,
	.slide_list > li.swiper-slide-duplicate-active {z-index: 100;transform: scale(1.8);}
	
	/* 영역별 밝기 설정 */
	.slide_list > li:after {
		content:'';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background:rgba(0,0,0,0.5);
		transition: all 0.3s;
		opacity: 1;}

	.slide_list > li.swiper-slide-next:after,
	.slide_list > li.swiper-slide-prev:after,
	.slide_list > li.swiper-slide-duplicate-next:after,
	.slide_list > li.swiper-slide-duplicate-prev:after {background:rgba(0,0,0,0.05);} 
	.slide_list > li.swiper-slide-active:after,
	.slide_list > li.swiper-slide-duplicate-active:after{display: none;}
	
	/* 화살표 */
	.slider .btn {
		display: inline-block;
		width: 35px;
		height: 35px;
		margin:30px 15px 0;
		background:url('${contextPath}/resources/icon/icon-right-arrow.png') center center no-repeat;
		background-size: cover;
		text-indent: -999em;
		cursor: pointer;}
					
	.slider .btn_prev {transform: rotateY(180deg);}
	
	@media (max-width: 768px) {
	    .slider .inner {padding: 38px 0;}
	    .slide_list > li { width: 33.333%; }
	    .slide_list > li.swiper-slide-next,
	    .slide_list > li.swiper-slide-prev,
	    .slide_list > li.swiper-slide-duplicate-next,
	    .slide_list > li.swiper-slide-duplicate-prev {transform: scale(1);}
	    .slide_list > li.swiper-slide-active,
	    .slide_list > li.swiper-slide-duplicate-active {transform: scale(1.5);}
	}
	
	.swiper-slide > div{
	width: 100%;
	height: 100%;
    box-sizing: border-box;
    border: 1px solid silver;
    border-radius: 5px;
	}


    /*
    ////////////////
    프로필 카드 스타일
    //////////////// 
    */

    .profile-wrap{
        height: 200px;
        width: 140px;
        /*
        부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
        */
        
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
        border-radius: 5px;
        border: 1px solid pink;
        justify-content: center;

    }

    .profile-info{
        width: 100%;
        height: 90px;
        text-align: center;
        box-sizing: border-box;
        background-color: seashell;
    }

    .profile-info div{
        margin: 5px;
        height: 22px;
        line-height: 20px;
    }

    .profile-name{
        font-weight: bold;
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
        width: 95px;
        height: 95px;
        border-radius: 50%;
        border: 1px solid silver;
        box-shadow: 5px 5px 5px darkgrey;
        object-fit: cover;
    }

    /* 프로필 카드 백 스타일 */
    .profile-wrap-b{
        height: 200px;
        width: 140px;
        display: flex;
        flex-direction: column;
        text-align: left;
        border-radius: 5px;
        border: 1px solid pink;
    }
    
    .profile-info-b{
        display: flex;
        flex-direction: column;
        text-align: left;
        width: 100%;
        
        padding: 10px;
        padding-top: 0px;
        box-sizing: border-box;
        background-color: white;
    }

    .close {
        display: block;
        box-sizing: border-box;
        position: relative;
        width:20px;
        height:20px;
    	    margin-left:120px;
    }

    .close:after {
        position: absolute;
        content: "\00d7";
        line-height: 20px;
        font-size:10pt;
    }

    .close:hover{
        cursor: pointer;
    }
    
    .profile-name-b{
        font-weight: bold;
    }

    .profile-introduce{
        width: 120px;
        margin-top: 5px;
        margin-bottom: 5px;
        font-size: 8px;
    }

    .introduce{
        height: 50px;
        border: none;
        resize: none;
    }

    .swiper-no-swiping {
        pointer-events: none;
    }

    #submitB{
        margin: auto;
        border-radius: 5px;
        border: 0px solid hotpink;
        background-color: pink;
        color: white;
        width: 100px;
        height: 20px;
        font-weight: bold;
    }

    #submitB:hover{
        background-color: hotpink;
    }

    /*프로필 플립*/
    .card {
    width: 100%;
    height: 100%;
    transition: all .5s;
    transform-style: preserve-3d;
    box-shadow: 5px 10px 10px grey;
    }

    .swiper-slide:hover .card {
    transform: rotateY(180deg);
    }

    .swiper-slide .card > div {
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    backface-visibility: hidden;
    }

    .swiper-slide .card .card-front {
    z-index: 10;
    }

    .swiper-slide .card .card-back {
        z-index: 5;
        transform: rotateY(180deg);
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

	<div class="my-content">
	    <div class="profile-menu-title">
	    Mbting 신청자
	    </div>

        <div class="slider-wrap">
    
            <div class="slider">
                <div class="inner">
                    <ul class="swiper-wrapper slide_list"></ul>
                </div>
                <span class="btn btn_prev"></span>
                
                <span class="btn btn_next"></span>
            </div>
   
        </div>

        <!-- 신청자 리스트 출력용 스크립트 -->
        <script>
            $(document).ready(function(){
            	
                myStatProfile();    // 내 상태 갱신용 펑션
                proposerList();     // 대화 신청자 리스트 갱신용 펑션
                slider();           // 대화 신청자 리스트 슬라이드 표시용 펑션
                
                setInterval(myStatProfile, 50000);
                setInterval(proposerList, 50000);
            });

                // 매칭 신청자 리스트 확인용 ajax
                function proposerList(){
                    
                    $.ajax({
                        
                        url : "proposerList.me",
                        type : "post",
                        data : {"userNo":"${sessionScope.loginMember.userNo}"}, 
                        success : function(result){
                            
                            let resultStr="";
                                
                                for(let i = 0; i < result.length; i++){
                                    
                                let profileImg= "/mbting"+result[i].profileImg;
                                
                                    resultStr += "<li class='swiper-slide'>"
                                                + "<div class='card'>"
                                                    + "<div class='card-front'>"
                                            
                                                        + "<form action='accept.me' method='post'>"
                                                            + "<div class='profile-wrap'>"
                                                            +	"<div class='profile-img-box'>"
                                                                +	"<img class='profile-img' src=" +profileImg+ ">"
                                                            +	"</div>"
                                                            +	"<div class='profile-info'>"
                                                                + "<div class='profile-name'>"
                                                                    + result[i].userName
                                                                + "</div>"
                                                            + 	  "<div class='profile-mbti'>"
                                                                    + result[i].mbti
                                                                + "</div>"
                                                                + "<button id='submitB' type='submit'>수락</button>"
                                                                + "<input type='hidden' name='proposerNo' value="+ result[i].userNo + ">"
                                                                + "<input type='hidden' name='receiverNo' value='${sessionScope.loginMember.userNo}'>"
                                                            +	"</div>"
                                                            + "</div>"
                                                            + "</form>"
                                                        + "</form>"
                                                    
                                                    + "</div>"
    
                                                    + "<div class='card-back'>"
                                            
                                                        + "<form action='accept.me' method='post'>"
                                                            +"<div class='profile-wrap-b'>"
                                                            +   "<div class='close' onclick='refusePropose(this)'>"
                                                            +       "<input type='hidden' id='proposerNo' name='proposerNo' value="+ result[i].userNo + ">"
                                                           
                                                            +   "</div>"
                                                            +   "<div class='profile-info-b'>"
                                                                +    "<div class='profile-name-b'>"
                                                                       + "거주지"
                                                                    +"</div>"
                                                                +    "<div class='profile-introduce'>"
                                                                        + result[i].address 
                                                                +    "</div>"
                                                                +    "<div class='profile-name-b'>"
                                                                       + "키"
                                                                    +"</div>"
                                                                +     "<div class='profile-introduce'>"
                                                                    +   result[i].height  +" cm"
                                                                +     "</div>"
                                                                +     "<div class='profile-name-b'>"
                                                                        + "소개"
                                                                    + "</div>"
                                                                    + " <textarea class='profile-introduce introduce'>"
                                                                        + result[i].introduce
                                                                    + "</textarea>"
                                                                + "<button id='submitB' type='submit'>수락</button>"
                                                                + "<input type='hidden' name='receiverNo' value='${sessionScope.loginMember.userNo}'>"
                                                            +	"</div>"
                                                            +"</div>"
                                                          
                                                        + "</form>"
                                                    
                                                    + "</div>"
    
                                                + "</div>"
                                }

                                if(resultStr==""){
                                    console.log("매칭 신청자 리스트가 없을때 안뜸")
                                }

                            
                            // 매칭 신청자 리스트 출력 위치
                            $(".slide_list").html(resultStr);
                                
                        },
                        error : function(){
                            
                            console.log("매칭 신청자 리스트 조회용 ajax 통신 실패")
                        }
                        
                    }) // ajax 끝
                }
                
                // 하단 메뉴바(상태 표시용) ajax 펑션
                function myStatProfile(){
              
                    
                    $.ajax({
                        url : "myChat.me",
                        type : "post",
                        data : {"userNo":"${sessionScope.loginMember.userNo}"},
                        success : function(result){

                            // 대화 상대 리스트 조회용 
                        	if(result.length != 0){
                        		
                        		// 대화방 인원수 에 따라 출력되는 문구 구별 (ex. 단둘일 경우 and 다수일 경우)
                        		if(result.length ==2){
                        			$("#myChat").html(result[0].userName+ "님이 <br>대화를 기다리고 있어요!" )
                        		} else {
		                        	$("#myChat").html(result[0].userName+ "님 외 " +(result.length-3)+ "명이 <br>대화를 기다리고 있어요!" )
                        		}
                        		
                        	} else {
                        		$("#myChat").html("MBTING 매칭을 통해 대화 상대를 찾아보세요!")
                        	}

                            // 프로필 미완성 내용 확인용
                            if("${sessionScope.loginMember.introduce}" == "" ||
                                "${sessionScope.loginMember.profileImg}" == "" ||
                                "${sessionScope.loginMember.phone}" == "" ||
                                "${sessionScope.loginMember.address}" == "null" ||
                                "${sessionScope.loginMember.mbti}" == ""
                                ) {
                                    
                                    $("#myProfile"  ).html("프로필에 모든 정보를 작성 하면 매칭 리스트에 표시됩니다. <br>");

                                    if ("${sessionScope.loginMember.introduce}" == "") {
                                       
                                        $("#myProfile").html("자기소개를 작성하면 매칭 리스트에 표시됩니다. <br>");
                                    } else if ("${sessionScope.loginMember.profileImg}" == "") {
                                     
                                        $("#myProfile").html("프로필 이미지를 등록하면 매칭 리스트에 표시됩니다. <br>");
                                    } else if ("${sessionScope.loginMember.phone}" == "") {
                                       
                                        $("#myProfile").html("연락처 정보를 등록하면 리스트에 표시됩니다. <br>");
                                    } else if ("${sessionScope.loginMember.address}" == "null") {
                                        
                                        $("#myProfile").html("거주지 정보를 등록하면 리스트에 표시됩니다. <br>");
                                    } else if ("${sessionScope.loginMEmber.mbti}" == "") {

                                        $("#myProfile").html("연애테스트를 통해 내 성향을 알아보고 <br> 최고의 궁합을 찾아보세요. <br>");
                                    }
                            }

                            // 결제 정보 노출 용
                            if(${sessionScope.loginMember.matchCoin} < 10){
                                $("#myMatchCoin").html("MBTIng 코인이 ${sessionScope.loginMember.matchCoin}개 밖에 안남았어요! <br> MBTIng 코인을 충전하고 <br> 마음에 드는 상대에게 대화를 신청해보세요!");
                            } else {
                                $("#myMatchCoin").html("MBTIng 코인이 ${sessionScope.loginMember.matchCoin}개 <br> 여유로워 보이지만 <br> 마음에 드는 상대방에 비해 부족한건 아닐까요?");
                            }
        
                        },
                        error : function(){
                            console.log("내 대화 상대 표시용 ajax 통신 실패");
                        }
                        
                    }); // ajax 끝
                }

                
                // 대화 신청자 리스트 표시용 펑션
                function slider() {
                    let swiper = undefined;
                    let slideNum = $('.slider .swiper-slide').length //슬라이드 총 개수
                    let slideInx = 0; //현재 슬라이드 index
            
                    //디바이스 체크
                    let oldWChk = window.innerWidth > 767 ? 'pc' : 'mo';
                    sliderAct();
            
                    let resizeTimer;
                    $(window).on('resize', function() {
                        clearTimeout(resizeTimer);
                        resizeTimer = setTimeout(function() {
                            let newWChk = window.innerWidth > 767 ? 'pc' : 'mo';
                            if (newWChk != oldWChk) {
                                oldWChk = newWChk;
                                sliderAct();
                            }
                        }, 300);
                    })
            
                    //슬라이드 실행
                    function sliderAct() {
                        //슬라이드 초기화 
                        if (swiper != undefined) {
                            swiper.destroy();
                            swiper = undefined;
                        }
            
                        //slidesPerView 옵션 설정
                        let viewNum = oldWChk == 'pc' ? 4 : 2;
                        //loop 옵션 체크
                        let loopChk = slideNum > viewNum;
            
                        swiper = new Swiper(".slider .inner", {
                            slidesPerView: "auto",
                            initialSlide: slideInx,
                            loop: loopChk,
                            centeredSlides: true,
                            observer : true,
                            observeParents : true,

                            navigation: {
                                nextEl: '.slider .btn_next',
                                prevEl: '.slider .btn_prev',
                            },
                            on: {
                                activeIndexChange: function() {
                                    slideInx = this.realIndex; //현재 슬라이드 index 갱신
                                }
                            },
                        });
                    }

                }  
            
            
            // 슬라이드 내 프로필 카드 닫힘 처리
            function refusePropose(e){
                console.log(e);
                var proposerNo = e.querySelector('input[name="proposerNo"]').value;

                console.log(proposerNo);
                
               $.ajax({
	               url : "refusePropose.me",
	               type : "post",
	               data : {
	            	   "proposerNo":proposerNo,
	            	   "receiverNo":"${sessionScope.loginMember.userNo}"
	            	   },
	               success : function(result){
	            	   console.log(result)
	            	   alert(result);
	            	   proposerList();
	               },
	               error : function(result){
	            	   console.log("신청 거절용 ajax 통신 실패")
	               }
            	})	// ajax 끝
            }
        </script>


<!-- 하단 메뉴 카드 목록-->
        <div class="profile-menu-title">
        내 현황
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
	                <div class="shortMenu-content" id="myProfile">
	                    멋진 프로필을 작성하고 상대에게 어필해보세요! <br>
                        잘 작성된 소개는 높은 매칭 성공률을 가집니다. :D
	                    <br>
	                </div>
	                <div class="shortMenu-button">
	                    <button type="button" onclick="location.href='myProfile.me'">정보 수정</button>
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
	
	                <div class="shortMenu-content" id="myChat">
	                    xx 님이 <br>
	                    대화를 기다리고 있어요!
	                </div>
	            
	                <div class="shortMenu-button">
	                    <button button type="button" onclick="location.href='convert.ch'">내용 확인</button>
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
	                <div class="shortMenu-content" id="myMatchCoin">
                       
	                </div>
	                <div class="shortMenu-button">
	                    <button id="test" type="button" onclick="location.href='myPay.me'">확인하기</button>
	                </div> 
	            </div>
	        </div>
	    </div>
    
    </div>
    
    <div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

</body>

</html>