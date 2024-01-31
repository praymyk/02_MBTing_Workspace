<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">

<!--연애 MBTI TEST 하기 글씨체-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&display=swap" rel="stylesheet">

<style>
	* {
		  box-sizing: border-box;
	}
	
	body {
	  padding: 0px;
      margin: 0px;
      font-family: 'Sunflower', sans-serif;
	  font-family: "Indie Flower";
			line-height: 1.618em;
			background-color: rgb(255, 255, 255);
			background-image: repeating-radial-gradient(circle, 
				rgb(255, 255, 255), rgb(255, 255, 255) 50%, #ffffff 100%
			);
			background-size: 10px 10px;
			
	}

	/*---------------------swiper를 위한 css-------------------------*/

	/* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 100%;
        height: 1200px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
    
	
/*--------------------------------폴라로이드 사진 -----------------------------*/
	
		.polaroid > img {
		  max-width: 400px;
		  height: auto;
		}
		.wrapper {
		  width: 100%;
		  padding: 0 2rem;
		  text-align: center;
		  background-color: rgb(255, 226, 189);
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
			width : 400px;
			white-space: pre-wrap;
		}
		.item {
		  display: inline-block;
		  margin-top: 2rem;
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
		  height: 20%;
		  width: 47%;
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
		  height: 20%;
		  width: 47%;
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
		  height: 20%;
		  width: 47%;
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
		  height: 20%;
		  width: 47%;
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
		  height: 90%;
		  width: 90%;
		  bottom: 0%;
		  right: 5%;
		  box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
		  transition: all 0.35s;
		}

		/*-------------------------------MBTI Test 추천 Style--------------------------*/
		.wrap {
			width : 100%;
			position: relative;
		}
		
		#content {
			margin-top: 0px;
			background-color: pink;
		}
		#content_1 {
			display : inline-block;
			height : 900px;
		}

		#Content1BigText {
			font-size: 70px;
			margin-top: 570px;
			margin-left: 380px;
			font-family: 'Gasoek One', sans-serif;
			position: absolute;
			z-index: 2;
		}

		#Content1SmallText {
			font-size: 20px;
			font-family: 'Sunflower', sans-serif;
		}

		#content1TopText {
			font-size: 20px;
			font-family: 'Gasoek One', sans-serif;
			margin-left: 1080px;
			margin-top: 100px;
			position: absolute;
			z-index: 3;
		}

		#arrow {
			margin-top: 630px;
			margin-left: 830px;
		}
		#testImg { 
			border-radius: 30px;
			height: 450px;
			width : 600px;
			top : 100px;
			left : 380px;
			background-image: url("${pageContext.request.contextPath}/resources/images/mbtingResult.png") ;
			background-size: cover;
			position: absolute;
			z-index: 1;
			box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
			/*filter: blur(3px);*/
		}

		#testImg:hover, #testResultImg:hover{
			filter: none;
		}

		#testResultImg {
			border-radius: 30px;
			height: 600px;
			width : 500px;
			position: absolute;
			top : 170px;
			left : 1070px;
			background-image: url("${pageContext.request.contextPath}/resources/images/mbtingTest.png") ;
			background-size: cover;
			box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
			/*filter: blur(3px);*/
		}

			/*--------------------------오늘의 엠비팅 -----------------------------*/
			#content_2 {
				height: 700px;
			}

			#topViewInnerTable { width : 100%; height: 400px; }

			#topViewInnerTable td {
				width : 25%;
				height : 450px;
				text-align: center;
			}

			#topViewInnerTable img {
				width : 70%;
				height : 450px;
				margin: auto;
				border-radius: 30px;
			}

			.gradient-image {
			position: relative;
			display: inline-block;
			width : 100%;	
			}
			
			.gradient-overlay {
			margin-left: 70px;
			position: absolute;
			top: 0;
			left: 0;
			width: 70%;
			height: 100%;
			border-radius: 30px;	
			background: linear-gradient(to bottom, rgba(255, 255, 255, 0), rgba(0, 0, 0, 0.65));
			}

			.introMem {
				text-align: left;
				margin-top: 280px;
				font-size: 40px;
				color : rgb(255, 255, 255);
				font-family: 'Sunflower', sans-serif;
				padding-left: 25px;
			}
			
			.introMem > p {
				font-size: 24px;
				color: lightgray;
			}

			#topView {
				text-align: center;
				font-size: 30px;
				font-family: 'Sunflower', sans-serif;
			}


			/*프로필 사진*/

			.flip-card {
				perspective: 1000px;
			}

			.flip-card-inner {
			transition: transform 0.6s;
			transform-style: preserve-3d;
			
			}

			.flip-card-front, .flip-card-back {
			backface-visibility: hidden;
			position: absolute;
			left : 0px;
			}

			.flip-card-back {
			background-color: #8a808b;
			border: 4px solid #b3a8b6;
			transform: rotateY(180deg);
			border-radius: 20px;
			position: relative;
			margin-bottom: px;
			width :70%;
			height : 450px;
			left : 0px;
			}

			.flip-card:hover .flip-card-inner {
			transform: rotateY(180deg);
			}

			#Content1BigText label {
				color : rgb(255, 0, 221);
			}
			
			.img {
				width : 200px;
				height : 200px;
			}
			
		
		
</style>	
</head>


<body>

		<!-- 메뉴바 header -->
		<jsp:include page="common/header.jsp"/>

		<div class="wrap">
			<div id="content">
				<div id="content_1">
				<!--<div id="content1TopText">사람마다 각기 가지고 있는 연애 스타일을 <br>
											  설문조사를 통한 통계 기반 맞춤형 추천 서비스 <br>
											  연애는 첫단추가 중요하다 ! 처음부터 딱 맞는 상대방 찾기 </div>-->	
					<div id="Content1BigText">나의 연애 <label>MBTI TEST </label> 하기 <br>
						<p id="Content1SmallText">나의 MBTI를 기반으로 소개팅 받고싶은 상대방을 <br> 선택할 수 있어요. Test 하기를 원한다면? </p> </div>
						<div id="arrow">
						<img src="https://cdn-icons-png.flaticon.com/128/60/60934.png"> 
						</div>
					<div class="test">
						<div id="testImg"></div>
					</div>
					<div>
						<div id="testResultImg"></div>
					</div>
				</div>
			</div>
			<br><br><br><br>
				
			<div id="content_2">
					
					<table id="topViewInnerTable">
					  <tr class="topViewTr">
					  </tr>
				  </table>
				  </div>

		<div class="wrapper">
			<h1 style="font-family: 'Sunflower', sans-serif;">인기 게시글</h1>
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
		    <div class="polaroid"><img src="https://img.insight.co.kr/static/2023/08/13/700/img_20230813105620_284dl6l1.webp">
		      <div class="caption">
				<pre>❣️2022/09/28~
사실 소개팅 어플이라는 게 믿음이 
잘 가지 않아서 걱정이 많았는데,
그런 걱정이 무색하게 남자친구랑 너무 
잘 만나고 있어요 !! 미리 mbti 검사를 하고 
매칭해준 덕인지 성격도 잘 맞고 싸우지도 않아요.
남자친구는 연애를 많이 안해봐서 
저랑 연락하기 힘들었다는데 채팅에서 
가이드도 해주니까 저랑 연락이 잘 됐다고ㅎㅎ 
좋은 인연 만들어주셔서 감사합니다 :)</pre>
			  </div>
		    </div>
		  </div>
		  
		  <div class="item">
		    <div class="polaroid"><img src="https://cphoto.asiae.co.kr/listimglink/1/201212070644023645158A_1.jpg">
		      <div class="caption">
				<pre>❣️2022/09/28~
별 기대 없이 시작했는데 이렇게 오래가는 
여자친구를 만나게 될 줄 몰랐어요 !! 
사실.. 성격 좋은 사람은 만날 수 
있을 거라 생각했는데 외적으로도 
너무 이쁜 여자친구라 이런 여자친구를 제가 
만날 수 있게 됐다는 게 너무 감사하더라구요. 
서로 이쁘게 사랑하면서 잘 만나겠습니다 ㅎㅎ
</pre>				
			  </div>
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

  <script>
  	$(function() {
  		
  		$.ajax({
  			 url : "list.mem",
  			type : "post",
  		 dataType: "json",
  		 success : function(result) {
  			
  			 let resultStr = "";
  			
  			 console.log(result);
  			 for(let i = 0; i < result.length; i++) {
  				 
  				let roomNo    = result[i].myRoomNo;
  				let profile	  = result[i].profileImg;
  				
  				resultStr += 
  				    "<td style='border: none;'>" + 
  				    "<div class='flip-card'>" + 
  				        "<div class='flip-card-inner'>" + 
  				            "<div class='gradient-image flip-card-front'>" + 
  				                "<a><img class='img' src='" + '${pageContext.request.contextPath}' + profile + "'></a>" + 
  				                "<div class='gradient-overlay'>" + 
  				                    "<div class='introMem'>" + 
  				                        result[i].userName + ", " + result[i].age + "<br><p>사는곳 ㆍ " + result[i].mbti + "</p>" + 
  				                    "</div>" + 
  				                "</div>" + 
  				            "</div>" +
  				            "<div class='flip-card-back'>" + 
  				                "<button onclick=\"location.href='chatting.do?roomNo="  + roomNo + "'\">채팅하기</button>" + 
  				            "</div>" +
  				        "</div>" +
  				    "</div>" +
  				    "</td>";
				 
				 $(".topViewTr").html(resultStr);
			 }
  		 },
  		 error	 : function() {
  			 console.log("top 4명 분석에 실패했습니다.");
  		 }
  		});
  		
  	});
  </script>
		
<!-- swipe 영역 -->
	<div class="wrap">
		<div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main1.png"></div>
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main2.png"></div>
            </div>
        
            <!-- paging 바를 위한 스타일 -->
            <div class="swiper-pagination"></div>
        
            <!-- 네비게이션 버튼 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- 스크롤바 -->
            <div class="swiper-scrollbar"></div>
        </div>
   		</div> <!-- content_1 닫는 div -->

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

	<!-- 채팅 api -->
		<script type="text/javascript">
		var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
		(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/65475643f2439e1631ebe2d5/1hefahucp';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
		})();
		</script>



</datagrid>

</body>
</html>