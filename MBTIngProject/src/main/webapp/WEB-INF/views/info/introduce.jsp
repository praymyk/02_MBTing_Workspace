<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>

<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">


<style>

	.introBanner {
        position: relative; 
        width: 100%;
        height: 150px;
        overflow: hidden; 
    }

    .introBanner h3 {
        position: absolute;
        font-size: 30px;
        font-weight: bold;
        top: 50%;
        left: 50%; 
        transform: translate(-50%, -50%); 
        color: white; 
        z-index: 1; 
    }

    .introBanner img {
        width: 100%;
        height: 100%; 
        object-fit: cover; 
    }

	.subTop {
		position: relative;
		width: 100%;
		height: 200px;
		margin: auto;
		z-index: -1;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.subTopImg img {
		width: 300px;
		margin-left: 70px;
	}

	.subpgNav {
		position: absolute;
		width: 100%;
		height: 60px;
		text-align: center;
		padding-top: 20px;
	}
	.subpgNav > ul {
		display: flex;
		justify-content: center;
		list-style-type: none;
	}
	.subpgNav > ul > li {
		font-size: 20px;
		color: #fff;
	}
	.subpgNav > ul > li > a {
		display: block;
		width: 260px;
		height: 60px;
		text-align: center;
		line-height: 60px;
		color: #7f7f7f;
		font-size: 18px;
		border-top: 1px solid #e5e5e5;
		border-bottom: 1px solid #e5e5e5;
		border-left: 1px solid #e5e5e5;
		background-color: #fff;
		text-decoration: none;
	}

	.subpgNav > ul > li > a:hover {
		font-size: 19px;
	}

	.subpgNav > ul > li:last-child > a {
		border-right: 1px solid #e5e5e5;
	}
	.subpgNav > ul > li > a.on {
		background-color: #fd8f9f;
		color: #fff;
		font-weight: 500;
		border: none;
	}
	.subimg_wrap {
		width: 100%;
		height: 500px;
		background-size: cover;
		margin-bottom: 20px;
		display: flex;
	}

	.subTopBox {
		padding-top: 20px;
	}
	.comtle {
		font-family: 'Chosunilbo_myungjo';
		font-weight: 500;
		font-size: 48px;
		color: #fd8f9f;
		letter-spacing: -1px;
		margin-bottom: 40px;
	}
	.comtxt {
		color: #000000;
		font-size: 25px;
		letter-spacing: -1px;
		line-height: 1.4;
	}
	.comtxt b {
		font-weight: bold;
	}
	.company_wrap {
		background-color: #f0fafc;
	}

	.intro_wrap {
		padding: 100px 0 100px;
	}
	.introlist {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: space-around;
		margin: 0;
	}
	.introlist > li {
		display: table-cell;
		vertical-align: middle;
		position: relative;
		display: flex;
		align-items: center;
		width: 628px;
		height: 180px;
		background-color: #fff;
		padding: 25px 40px;
		margin-bottom: 30px;
		border-radius: 10px;
		box-shadow: 2px 2px 4px 2px rgb(0 0 0 / 10%);
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		-ms-border-radius: 10px;
		-o-border-radius: 10px;
	}

	.introlist > li.intro1::before {
		background: url("../img/icon/icon_intro1.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro2::before {
		background: url("../img/icon/icon_intro2.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro3::before {
		background: url("../img/icon/icon_intro3.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro4::before {
		background: url("../img/icon/icon_intro4.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro5::before {
		background: url("../img/icon/icon_intro5.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro6::before {
		background: url("../img/icon/icon_intro6.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro7::before {
		background: url("../img/icon/icon_intro7.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro8::before {
		background: url("../img/icon/icon_intro8.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro9::before {
		background: url("../img/icon/icon_intro9.png") no-repeat 0 0;
		background-size: contain;
	}
	.introlist > li.intro10::before {
		background: url("../img/icon/icon_intro10.png") no-repeat 0 0;
		background-size: contain;
	}

	.introlist > li > .introtleDiv > p {
		font-family: 'Noto Sans KR';
		font-size: 15px;
		color: #4a4a4a;
		line-height: 1.4;
		margin-bottom: 5px;
		margin-left: 40px;
		word-break: keep-all;
		letter-spacing: -1px;
	}
	.introlist > li > .introtleDiv > p.introtle {
		font-family: 'Noto Sans KR';
		font-size: 21px;
		color: #000000;
		line-height: 1.5;
		font-weight: bold;
		margin-left: 40px;
		margin-bottom: 15px;
		word-break: keep-all;
		letter-spacing: -1px;
		font-family: 'NanumSquareRound';

	}
	p .jointestlink {
		color: #fc7c8c;
		font-weight: bold;
		font-family: 'NanumSquareRound';
	}

	p .jointestlink::after {
		width: 8px;
		height: 12px;
		display: inline-block;
		margin-left: 5px;
		background: url("../img/icon/icon_right_arrow_pink.png") no-repeat 0 0;
		background-size: 100%;
		content: "";
	}

	p .jointestlink:hover {
		text-decoration: none;
		color: #ff6476;
	}

	.intro_subbox {
		display: flex;
		margin-left: 140px;
		margin-top: 10px;

	}
	.intro_subbox .subtle {
		width: 120px;
		font-size: 14px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.subtxt {
		font-size: 13px;
		font-weight: normal;
		margin-bottom: 6px;
	}

	.iconDiv {
		margin-left: 20px;
	}

	.subimg_wrap,
	.company_wrap,
	.enrollText,
	.intro_content {
		opacity: 0;
		transform: translateY(-50px);
		transition: opacity 1s ease, transform 1s ease;
	}

	.subimg_wrap.appear,
	.company_wrap.appear,
	.enrollText.appear,
	.intro_content.appear {
		opacity: 1;
		transform: translateY(0);
	}

	.intro_bg {
		height: 700px;
		position: relative;
	}

	.intro_content {
		position: relative;
		padding: 0 0 0 100px;
		margin-top: 30px;
	}
	.intro_content::after {
		position: absolute;
		content: '';
		display: block;
		width: 396px;
		height: 548px;
		bottom: 0;
		right: 10%;
	}
	.hellostyle {
		font-size: 34px;
		color: #000;
		font-weight: 500;
		margin-bottom: 30px;
	}

	.hellotxt {
		padding: 15px 0 10px;
		font-family: 'NanumSquare';
		font-weight: 400;
		font-size: 17px;
		color: #000;
		line-height: 1.7;
		word-break: keep-all;
	}
	.ceo {
		font-family: 'NanumSquare';
		padding-top: 50px;
		font-size: 18px;
		color: #000;
		font-weight: bold;
	}
	.ceo2 {
		font-family: 'NanumSquare';
		padding-bottom: 30px;
		font-size: 27px;
		color: #000;
		font-weight: bold;
	}

</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class="subTop_wrap1">
		<div class="introBanner">
			<h3>회사소개</h3>
			<img src="./resources/images/NoticeBanner.jpg" alt="">
		</div>
	</div>

	<div class="subimg_wrap">
		<div class="subTop">
			<div class="subTopBox">
				<p class="comtle" style="font-family: 'NanumSquareExtraBold';">MBTIng?</p>
				<p class="comtxt" style="font-family: 'NanumSquareBold';">MBTI 검사를 통한<br><b>나와 잘맞는 사람과의 소개팅</b></p>
			</div>
			<div class="subTopImg">
				<img src="./resources/images/pg1_bg.png" alt="">
			</div>
		</div>
	</div>

	<div class="company_wrap">
		<div class="body_wrap intro_wrap" >

			<ul class="introlist">
				<li class="intro1">
					<div class="iconDiv">
						<i class="fas fa-edit" style="font-size: 50px; color: #ffb0bc;"></i>
					</div>
					<div class="introtleDiv">
						<p class="introtle">설레이는 만남을 위한 선별된 회원가입</p>
						<p><a href="enrollForm.me" class="jointestlink">회원가입 &nbsp;<i class="fas fa-angle-right"></i></a></p>
					</div>
				</li>
				<li class="intro5">
					<div class="iconDiv">
						<i class="fas fa-coins" style="font-size: 50px; color: #ffb0bc;"></i>
					</div>
					<div class="introtleDiv">
						<p class="introtle">무료 회원가입 다회권 이용</p>
						<p>3회 무료 매칭 후 합리적인 다회 매칭권 이용 또는 추가 결제 가능</p>
					</div>
				</li>
				<li class="intro7">
					<div class="iconDiv">
						<i class="fas fa-hand-holding-heart" style="font-size: 50px; color: #ffb0bc;"></i>
					</div>
					<div class="introtleDiv">
						<p class="introtle">MBTI 검사를 통한 매칭시스템</p>
						<p>
							<a href="mbtiTest.mb" class="jointestlink">MBTI 테스트 &nbsp;<i class="fas fa-angle-right"></i></a>
							<p style="font-size: 12px; color: gray;">(회원가입 후 이용 가능)</p>
						</p>
					</div>
				</li>
				<li class="intro9">
					<div class="iconDiv">
						<i class="fas fa-users-slash" style="font-size: 50px; color: #ffb0bc;"></i>
					</div>
					<div class="introtleDiv">
						<p class="introtle">진중한 만남을 위한 회원관리 정책</p>
						<p>비매너에 대한 원스트라이크 아웃 시행</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="enrollText" style="padding: 100px;">
		<h1 align="center" 
			style="
			font-family: 'NanumSquareExtraBold'; 
			font-size: 80px;
			color: #ff889a;
			">지금 가입해보세요!</h1>
	</div>

	<div class="intro_bg" style="position: relative;">
		
        <div class="intro_content body_wrap" style="position: relative;">

			
			<img src="./resources/images/mj_bg.png" style="width: 100%; height: 700px; position: absolute; top: 0; left: 0; z-index: -1; border-top: 1px solid lightgray;">

			<div class="info" style="display: flex; align-items: center; height: 600px; justify-content: space-between;">
				<div class="info-text" style="height: 600px; margin-top: 60px;">
					<p class="hellostyle" style="font-family: 'NanumSquareExtraBold';">안녕하세요.</p>

					<p class="hellotxt">
						바쁜 사회생활 속 이성을 만날 기회가 줄어들고 소개팅이 생기기만을 기다리는 많은 사람들을 보았습니다. 
					</p>
					<p class="hellotxt">
						주위에서 결혼정보업체, 소개팅앱, 단체미팅 등 주선 서비스를 접할 수 있지만<br>대부분 높은 비용, 신뢰성 부족, 이익 창출만을 목적으로 하는 등 아쉬운 부분이 많았습니다. 
					</p>    
					<p class="hellotxt">
						이러한 부분을 개선하고 아름다운 남녀에게 더 많은 만남의 기회를 제공하고자 시작되어<br> 이제는 6년차가 되었습니다. 
					</p>
					
					<p class="hellotxt">
						신뢰를 바탕으로 더 좋은 서비스를 제공할 수 있도록 항상 노력하겠습니다.
					</p>
					<p class="hellotxt">감사합니다.</p>         
					
					
					<p class="ceo">MBTIng 대표</p>
					<p class="ceo2">정윤석 기준서 김선아 김민중 김민제 정현두</p>
				</div>

				<div class="info-img" style="margin-right: 60px;">
					<img src="./resources/images/mj_img.png" style="width: 250px; border-radius: 50%; margin-right: 30px;">
					<img src="./resources/images/hd_img.png" style="width: 250px; border-radius: 50%;">
				</div>
			</div>
        </div>
    </div>

	<script>
		document.addEventListener("DOMContentLoaded", function () {
		var subimgWrap = document.querySelector(".subimg_wrap");
		var companyWrap = document.querySelector(".company_wrap");
		var enrollText = document.querySelector(".enrollText");
		var introContent = document.querySelector(".intro_content");
		
		// 요소가 뷰포트 내에 있는지 확인하는 함수
		function isInViewport(element) {
			var rect = element.getBoundingClientRect();
			return (
			rect.top >= 0 &&
			rect.left >= 0 &&
			rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
			rect.right <= (window.innerWidth || document.documentElement.clientWidth)
			);
		}

		// 스크롤 이벤트를 처리하는 함수
		function handleScroll() {
			if (isInViewport(subimgWrap)) {
			subimgWrap.classList.add("appear");
			}

			if (isInViewport(companyWrap)) {
			companyWrap.classList.add("appear");
			}

			if (isInViewport(enrollText)) {
			enrollText.classList.add("appear");
			}

			if (isInViewport(introContent)) {
				introContent.classList.add("appear");
			}
		}

		// 스크롤 이벤트 리스너를 추가
		window.addEventListener("scroll", handleScroll);

		// 초기 확인을 트리거
		handleScroll();
		});

	</script>
		
		
		

	<jsp:include page="../common/footer.jsp" />

</body>
</html>