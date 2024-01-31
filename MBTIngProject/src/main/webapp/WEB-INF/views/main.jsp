<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>MBTIng</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">

<!--연애 MBTI TEST 하기 글씨체-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&display=swap" rel="stylesheet">

<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<style>
	* {
		  box-sizing: border-box; 
	}
	
	/* html {
    	overflow: hidden;
	} */
	
	body {
	  padding: 0px;
      margin: 0px;
      font-family: 'NanumSquareBold';
			line-height: 1.618em;
			background-color: rgb(255, 255, 255);
			background-image: repeating-radial-gradient(circle, 
				rgb(255, 255, 255), rgb(255, 255, 255) 50%, #ffffff 100%
			);
			background-size: 10px 10px;
	}
	
		
	html, body {
	    display: block;
	    width: 100%;
	    height: 100%;
	    margin: 0;
	    
	}

	/*---------------------swiper를 위한 css-------------------------*/

	/* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 100%;
		height : 100%;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
    
	
/*--------------------------------폴라로이드 사진 -----------------------------*/
	
		.polaroid > img {
		  max-width: 23em;
		  height: 20em;
		}
		
		#content_3 {
		  width: 1600px;
		  padding: 0 2rem;
		  text-align: center;
		  background-color: rgb(255, 226, 189);
		}

		#content_3>h1>a {
			font-family: 'NanumSquareBold'; 
			padding-top: 50px; display: flex; 
			align-items: center; 
			justify-content: center;
			color: black;
		}

		#content_3>h1>a:hover {
			text-decoration: none;
			color: rgb(255, 161, 161);
		}

		.polaroid {
		  background: #fff;
		  padding: 1rem;
		  box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
		}
		.caption {
		  font-size: 1.125rem;
		  text-align: center;
		  line-height: 2em;
		}

		.caption > pre {
			width : auto;
			padding: 10px;
			white-space: pre-wrap;
		}
		.item {
		  display: inline-block;
		  filter: brightness(100%);
		}

		.item .polaroid:before {
		  content: '';
		  position: absolute;
		  z-index: -1;
		  transition: all 0.35s;
		}
		.item:nth-of-type(4n+1) {
		  transform: scale(0.8, 0.8) rotate(5deg);
		  transition: all 0.35s;
		}
		.item:nth-of-type(4n+1) .polaroid:before {
		  transform: rotate(6deg);
		  height: 250px;
		  width: 300px;
		  bottom: 30px;
		  right: 12px;
		  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
		}
		.item:nth-of-type(4n+2) {
		  transform: scale(0.8, 0.8) rotate(-5deg);
		  transition: all 0.35s;
		}
		.item:nth-of-type(4n+2) .polaroid:before {
		  transform: rotate(-6deg);
		  height: 250px;
		  width: 300px;
		  bottom: 30px;
		  left: 12px;
		  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
		}
		.item:nth-of-type(4n+4) {
		  transform: scale(0.8, 0.8) rotate(3deg);
		  transition: all 0.35s;
		}
		.item:nth-of-type(4n+4) .polaroid:before {
		  transform: rotate(4deg);
		  height: 300px;
		  width: 250px;
		  bottom: 30px;
		  right: 12px;
		  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
		}
		.item:nth-of-type(4n+3) {
		  transform: scale(0.8, 0.8) rotate(-3deg);
		  transition: all 0.35s;
		}
		.item:nth-of-type(4n+3) .polaroid:before {
		  transform: rotate(-4deg);
		  height: 300px;
		  width: 250px;
		  bottom: 30px;
		  left: 12px;
		  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
		}
		.item:hover {
		  filter:brightness();
		  transform: scale(1, 1) rotate(0deg) !important;
		  transition: all 0.35s;
		}
		
		.item:hover .polaroid:before {
		  content: '';
		  position: absolute;
		  z-index: -1;
		  transform: rotate(0deg);
		  height: 300px;
		  width: 250px;
		  bottom: 0%;
		  right: 5%;
		  box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
		  transition: all 0.35s;
		}

		/*-------------------------------MBTI Test 추천 Style--------------------------*/
		.wrap {
			width : 100%;
			height : 100%;
		}
		
		.content {
			width: 100%;
		}
		
		#content {
			width : 100%;
		}
		

		#content_4 {
			display : inline-block;
			width : 100%;
			height: calc(85% - 100px);
		}
		
		#content_2 , #content_3 {
			width : 100%;
			height : 100%;
		}

		#content_1 {
			position: relative;
			width : 100%;
			height : 100%;
			background-color: pink;
		}
		#Content1BigText {
			font-size: 4.6em;
			margin-top: 4.8em;
			margin-left: 1.5em;
			font-family: 'Gasoek One', sans-serif;
			position: absolute;
			z-index: 2;
			height: 1em;
		}

		#Content1BigText2 {
			font-size: 4.6em;
			margin-top: 5.9em;
			margin-left: 1.5em;
			font-family: 'Gasoek One', sans-serif;
			position: absolute;
			z-index: 2;
			height: 1em;
		}
		
		#Content1BigText2 a {
			text-decoration : none;
			color : rgb(255, 142, 161);
		}

		#Content1BigText2 a:hover {
			color : rgb(196, 246, 253);
			cursor: pointer;
		}

		#Content1SmallText {
			font-size: 0.31em;
			font-family: 'NanumSquareBold';
		}

		#arrow {
			margin-top : 39em;
			margin-left: 53em;
		}
		
		#testImg img { 
			border-radius: 30px;
			height: 320px;
			width: 620px;
			top: 3em;
			left: 44em;
			object-fit: cover;
			position: absolute;
			z-index: 1;
			box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
		}

		#testResultImg img {
			border-radius: 30px;
			height: 450px;
			width: 520px;
			object-fit: cover;
			position: absolute;
			top: 9em;
			left: 79em;
			box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
		}

		/*-----------------------------Top4 분석----------------------------*/
		
			#topViewTableDiv {
			    display: flex;
				justify-content: center; /* 수평 가운데 정렬 */
				align-items: center; /* 수직 가운데 정렬 */
				margin-top : 4.5%;
				margin-bottom : 10%;
				height : 60%;
			}
			
			#topViewInnerTable { width : 100%; height: 60%; }

			#topViewInnerTable td {
				width : 25%;
				height : 60%;
				text-align: center;
			}

			#topViewInnerTable img {
				width : 65%;
				height : 97%;
				margin: auto;
				border-radius: 30px;
			}

			.gradient-image {
				position: relative;
				display: inline-block;
				width : 100%;	
			}

			.gradient-image img {
				object-fit: cover;
			}
			
			.gradient-overlay {
				display: flex; 
				flex-direction: column; 
				justify-content: flex-end; 
				margin-left: 17.8%;
				position: absolute;
				top: 0;
				left: 0;
				width: 65%;
				height: 97%;
				border-radius: 30px;	
				background: linear-gradient(to bottom, rgba(255, 255, 255, 0), rgba(0, 0, 0, 0.65));
			}

			.introMem {
				text-align: left;
				font-size: 30px;
				color : rgb(255, 255, 255);
				font-family: 'NanumSquareBold';
				padding: 10px;
				padding-left: 20px;
			}
			
			.introMem > p {
				font-size: 0.5em;
				color: lightgray;
			}

			#topView {
				text-align: center;
				font-size: 30px;
				font-family: 'NanumSquareBold';
			}

			#topText {
				font-size : 2.5em;
				font-family: 'NanumSquareBold';
				display: flex;
				justify-content: center; /* 수평 가운데 정렬 */
				align-items: center; /* 수직 가운데 정렬 */
				padding-top: 5%;
			}

			.content2Login>a {
				font-family: 'NanumSquare';
				color: black;
				display: flex;
				align-items: center;
				justify-content: center;
			}

			.content2Login>a:hover {
				cursor: pointer;
				font-family: 'NanumSquare';
				color: rgb(255, 161, 161);
				text-decoration: none;
				
			}

			.mainBanner2 img {
				width: 100%;
				position: relative;
				z-index: 1;
			}

			.mainBanner2>h1 {
				font-family: 'NanumBarunGothicYetHangul';
				font-weight: bold;
				position: absolute;
				z-index: 2;
				top: 200px;
				left: 200px;
			}

			.mainBanner3>h1,
			.mainBanner3>h4 {
				width: 100%	;
				top: 180px;
				right: 280px;
				text-align: end;
				font-family: 'NanumBarunGothicYetHangul';
				font-weight: bold;
				position: absolute;
				z-index: 2;
			}

			.mainBanner3>h4 {
				width: 100%	;
				top: 180px;
				right: 300px;
				text-align: end;
				font-family: 'NanumBarunGothicYetHangul';
				position: absolute;
				z-index: 2;
			}

			.mainBanner2>h1>a,
			.mainBanner3>h1>a {
				color: rgb(254, 111, 111);
				text-decoration: none;
				font-size: 60px;
			}

			.mainBanner2>h1>a:hover,
			.mainBanner3>h1>a:hover {
				color: rgb(255, 92, 92);
			}
			
			/*----------------------------------------------------------좋아요 버튼------------------------------------------*/
			#button {
			  padding: 0.17em 1em 0.17em 1em;
			  border-radius: 10px;
			  box-shadow: 0px 0px 5px 7px #e7413373;
			  color: lightgray;
			  font-size: 1em;
			  border: none;
			  display: flex;
			  align-items: center;
			  transition: all .5s ease-in-out;
			  letter-spacing: 2px;
			  margin : 1em;
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
				text-align : center;
				display : inline-block;
			}
			
			/*------------------------------------------------프로필 사진------------------------------------------------------*/

			.flip-card {
				perspective: 1000px;
			}

			.flip-card-inner {
				transition: transform 0.6s;
				transform-style: preserve-3d;
				transform-origin: center; /* 중심점을 가운데로 설정 */
				height : 70%;
			}

			.flip-card-front, .flip-card-back {
				backface-visibility: hidden;
				position: absolute;
				height : 30em;
				left : 0px;
			}

			.flip-card-back {
				background-color: white;
				border: 4px solid #b3a8b6;
				transform: rotateY(180deg);
				border-radius: 20px;
				position: relative;
				margin-bottom: px;
				width :70%;
				height : 30em;
				left : 0px;
				margin-left : 4.6em;
			}

			.flip-card:hover .flip-card-inner {
				transform: rotateY(180deg);
			}

			#Content1BigText label {
				color : rgb(255, 0, 221);
			}
		
			
		
		/*------------------------스크롤기능---------------------------------*/
		.wrap {
			 scroll-snap-type: mandatory;}
		
		.wrap #content {
			scroll-snap-align: center;
            display: inline-block;
		}
</style>	
</head>


<body>

		<!-- 메뉴바 header -->
		<jsp:include page="common/header.jsp"/>

		<div class="wrap">

			<div id="content_4">
				<!-- Slider main container -->
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<div class="swiper-slide">
							<div id="content_1" class="content">
								<div>
									<div id="testImg">
										<img src="<%=request.getContextPath()%>/resources/images/mbtingTest1.png">
									</div>
								</div>
								<div class="test">
									<div id="testResultImg">
										<img src="<%=request.getContextPath()%>/resources/images/mbtingResult1.png">
									</div>
								</div>
								<div id="Content1BigText">나의 연애</div>
								<div id="Content1BigText2">
									<a href="mbtiTest.mb">MBTI TEST </a> 하기 <br> 
									<p id="Content1SmallText">나의 MBTI를 기반으로 소개팅 받고싶은 상대방을 <br> 선택할 수 있어요. Test 하기를 원한다면? </p>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="mainBanner2">
								<h1>
									<a href="list.bo">검증된 후기</a>로<br> 
									<h1 style="margin-top: 90px;">신뢰할 수 있는 소개팅</h1>
								</h1>
								<img src="<%=request.getContextPath()%>/resources/images/MN6.jpg">
							</div>
						</div>
						<div class="swiper-slide">
							<div class="mainBanner3">
								<h1>
									MBTIng에서 나와 잘맞는 <br>
									<h1 style="margin-top: 60px;"><a href="all.me">인연을 찾아보세요!</a></h1>
									<h4 style="margin-top: 140px; font-size: 18px; color: gray;">(로그인 후 이용 가능)</h3>
								</h1>
								<img src="<%=request.getContextPath()%>/resources/images/MN7.jpg">
							</div>
						</div>
					</div>
				
					<!-- paging 바를 위한 스타일 -->
					<div class="swiper-pagination"></div>
				
					<!-- 네비게이션 버튼 -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
			
				</div>
			</div> <!-- content_4 닫는 div -->
						<script>
							// 슬라이더 동작 정의
							const swiper = new Swiper('.swiper', {
								autoplay : {
									delay : 3000 // 3초마다 이미지 변경
								},
								loop : true, 		//반복 재생 여부
								slidesPerView : 1,  // 이전, 이후 사진 미리보기 갯수
								pagination: { 		// 페이징 버튼 클릭 시 이미지 이동 가능
									el: '.swiper-pagination',
									clickable: true
								},
								navigation: { 		// 화살표 버튼 클릭 시 이미지 이동 가능
									prevEl: '.swiper-button-prev',
									nextEl: '.swiper-button-next'
								}
							}); 
						</script>

		


			
			
		
		<div id="content_2" class="content">
					<div id="topText">
						<label>매칭 신청을 가장 많이 받은 회원 Top 4!</label>
					</div>
					<c:choose>
						<c:when test="${sessionScope.loginMember != null}">
							<h3 align="center" class="content2Login"><a href="all.me">매칭 신청하러 가기&nbsp;&nbsp;<i class="fas fa-angle-right"></i></a></h3>
						</c:when>
						<c:otherwise>
							<h3 align="center" class="content2Login"><a data-toggle="modal" data-target="#loginModal" class="content2Login">로그인하고 매칭 신청하기&nbsp;&nbsp;<i class="fas fa-angle-right"></i></a></h3>
						</c:otherwise>
					</c:choose>
						
					<div id="topViewTableDiv">
						<table id="topViewInnerTable">
							  <tr class="topViewTr">
							  </tr>
						 </table>
					 </div>
		</div>
			
		<div id="content_3" class="content">
			<h1 style="display: flex; align-content: center; justify-content: center; align-items: center;">
				<a href="list.bo">만남 후기 인기 게시글&nbsp;&nbsp;<i class="fas fa-chevron-right"></i></a>
			</h1>
		  <div class="item">
		    <div class="polaroid"><img src="https://image.jtbcplus.kr/data/contents/jam_photo/202101/05/b0266449-6a8b-4a9b-8f7e-b4b250c957c0.jpg">
		      <div class="caption">
				<pre>❣️ 2023/03/22~
MBTIng에서 만나 3개월째, 예쁜 연애 중입니다.
연애는 하고 싶은데 29살 정도 되니 
만날 곳도 없고 고민이 많았어요....
매니저님이 진짜 꼼꼼하게 상담해주시고
케어해주시는 게 느껴져서 너무 좋았어요.
MBTIng 아니였음 저희 오빠 같은 사람, 
만나기 힘들었을 것 같아요.
덕분에 하루하루 사랑 받으면서 지내고 있어요ㅎㅎ</pre></div>
		    </div>
		  </div>
		
		  <div class="item">
		    <div class="polaroid"><img src="https://img.mbn.co.kr/filewww/news/other/2020/05/26/200306052020.png">
		      <div class="caption">
				<pre>❣️ 2023/05/07~
MBTIng 덕분에 제 운명을 만났어요....!
취직해서 자취를 시작했는데
텅 빈 집에 혼자 있으려니 외롭...
아플 때 죽과 달달구리 들고 찾아오는 남친, 
진짜 이런 게 연애하는 기분이구나 느껴요
매일이 설레고 행복해요</pre>
			 </div>
		   </div>
		 </div>
		
		  <div class="item">
		    <div class="polaroid"><img src="https://i.pinimg.com/736x/65/72/0f/65720fcf50c6acb8d0f06dc3678c930d.jpg">
		      <div class="caption">
				<pre>❣️2023/01/14~
일도 자리 잡아 경제적인 능력도 되고
외모도 훈훈하다는 소리 좀 들었습니다...ㅎ
다들 여자친구 안 만나냐, 연애는 왜 안하냐 하는데
아무 여자나 만나고 싶진 않더라구요.
예쁜 건 둘째치고 성격, 가치관이 잘 맞았음 했는데
딱 찾아주시니 너무 신기하고 내년에는 결혼까지
생각하고 있습니다. :)</pre></div>
		    </div>
		  </div>

		  <div class="item">
		    <div class="polaroid"><img src="${pageContext.request.contextPath}/resources/images/jsPhoto.jpg">
		      <div class="caption">
				<pre>❣️2023/09/25~
저희는 같은 직업끼리 만났어요 ! 
둘다 개발자로 일을 하고 있는데
이런 공통사까지 맞는 상대라니
너무 좋네요 ㅎㅎ 제 여자친구가 
저보다 4살 연하인데 저랑 성격도 
잘 맞고 외적으로도 제 이상형이라 
만나면 코드 얘기도 하고 
같이 놀러가기도 하는 그런 행복한
연애중입니다 !! 서나야 사랑해 ~~ 
</pre>				
			  </div>
		    </div>
		  </div>
		</div>	

	<jsp:include page="common/footer.jsp"/>


	</div>

  <script>
  	$(function() {
  		
  		$.ajax({
  			 url : "list.mem",
  			type : "post",
  		 dataType: "json",
  		 success : function(result) {
  			
  			 let resultStr = "";
  			
  			 console.log(result);
  			 
  			 let num		  = 1;
  			 
  			 for(let i = 0; i < 4; i++) {
  				 
  				let roomNo    = result[i].myRoomNo;
  				let profile	  = result[i].profileImg;
  				//console.log(result[i].userNo);
  				resultStr += 
  				    "<td style='border: none;'>";
  				    
  				    if(result[i].userNo != "${sessionScope.loginMember.userNo}") {
  				    	resultStr += "<div class='like' id='user" + result[i].userNo + "'><button id='button' onclick='requestMatch(this , " + result[i].userNo + ");' ><span>채팅신청</span></button></div>";
  				    }
  				    
	  				  resultStr += "<div class='flip-card'>" + 
	  				        "<div class='flip-card-inner'>" + 
	  				            "<div class='gradient-image flip-card-front'>" + 
	  				                "<a><img class='img' src='" + '${pageContext.request.contextPath}' + profile + "'></a>" + 
	  				                "<div class='gradient-overlay'>" + 
	  				                    "<div class='introMem'>" + 
	  				                        result[i].userName + ", " + result[i].age + "<br><p>" + result[i].mbtiNick + "ㆍ " + result[i].mbti + "</p>" + 
	  				                    "</div>" + 
	  				                "</div>" + 
	  				            "</div>" +
	  				            "<div class='flip-card-back'>" + 
	  				            "</div>" +
	  				        "</div>" +
	  				    "</div>" +
	  				  	"<input type='hidden' id='masterEmail" + num + "' name='masterEmail" + (num) + "' value=''>" +
					  	"<input type='hidden' id='masterName" + num + "' name='masterName" + (num) + "' value=''>" +
						"<input type='hidden' id='masterPic" + num + "' name='masterPic" + (num++) + "' value=''>" +
	  				    "</td>";
	  				    
					 $(".topViewTr").html(resultStr);
	
				 }

  			checkReceiver();
		  	checkProposer();
		  	checkMatching();
		  	
  			 $("#masterEmail1").val(result[0].email);
  			 $("#masterEmail2").val(result[1].email);
  			 $("#masterEmail3").val(result[2].email);
  			 $("#masterEmail4").val(result[3].email);
  			 
  			 $("#masterName1").val(result[0].userName);
 			 $("#masterName2").val(result[1].userName);
 			 $("#masterName3").val(result[2].userName);
 			 $("#masterName4").val(result[3].userName);
 			 
 			 $("#masterPic1").val(result[0].profileImg);
 			 $("#masterPic2").val(result[1].profileImg);
 			 $("#masterPic3").val(result[2].profileImg);
 			 $("#masterPic4").val(result[3].profileImg);
 			 
 			
		  	
  		 },
  		 error	 : function() {
  			 console.log("top 4명 분석에 실패했습니다.");
  		 }
  		});
  		
  	});
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
	            	 console.log("하하 성공");
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
			location.href="http://${pageContext.request.contextPath}/convert.ch";
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
  
  
  function checkProposer() {
	  
		  $.ajax({
			 url : "check.pro",
			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
		 success : function(proposerNoList) {
			 
			 console.log(proposerNoList);
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

  <!-- mouse wheel을 사용하기 위한 script 코드 입니당. -->
  <!-- <script>
 	 window.addEventListener("wheel", function(e){
	   	 e.preventDefault();
	},{passive : false});
  
 	 
 	var mHtml = $("html");
 	var page = 1;


 	mHtml.animate({scrollTop : 0},10);
 	
 	$(window).on("wheel", function(e) {
 	    if(mHtml.is(":animated")) return;
 	    if(e.originalEvent.deltaY > 0) {
 	        if(page == 4) return;
 	        page++;
 	    } else if(e.originalEvent.deltaY < 0) {
 	        if(page == 1) return;
 	        page--;
 	    }
 	    var posTop =(page-1) * $(window).height();
 	    mHtml.animate({scrollTop : posTop});
 	}) -->
 	
  </script>
	<!-- swipe 영역 -->
	

		<!-- 채팅 api -->
		<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
		(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/656413b31db16644c554f30c/1hg7eptem';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
		})();
	</script>
	<!--End of Tawk.to Script-->

</body>
</html>