<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">

<style>
    .f-content {
        background-color: rgb(54, 55, 71);
        width: 100%;
        height: 250px;
    }

    .f-content-top {
        display: flex;
        align-items: center;
        justify-content: center;
        border-bottom: 0.1px solid rgb(156, 156, 156);
        height: 80px;

    }

    .f-content-bottom {
        height: 100%;
        background-color: rgb(54, 55, 71);
        display: flex;
        justify-content: space-between;
        flex-direction: row;
        align-items: center;
        padding: 20px;
    }

    .info {
        margin-left: 40px;
        font-size: 13px;
        color: rgb(184, 187, 216);
        font-family: 'NanumGothicBold';
    }

    .terms>a {
        text-decoration: none;
        color: white;
        font-size: 14px;
        font-family: 'NanumGothicBold';
        font-weight: 600;
    }

    .terms>a:hover {
        cursor: pointer;
        text-decoration: none;
    }

    .copyright {
        color: white;
        background-color: rgb(54, 55, 71);
        text-align: center;
        padding-bottom: 40px;
        font-size: 15px;
        font-family: 'NanumGothicBold';
        margin-top: auto; /* 추가: 아래 여백을 최대화하여 맨 아래로 이동 */
    }

    .footer-icon{
        display: flex;
        justify-content: center;
        margin-left: 40px;
        margin-top: 20px;
        float: left;
    }

    .logo-size {
        height: 50px;
        margin-right: 10px;
    }

    .footerLogo {
        width: 220px;
        margin-right: 50px;
    }

</style>

</head>
<body>

    <div class="f-content">
        <div class="f-content-top">
            <div class="terms" style="color: white;">
                <a href="terms1.te">이용약관</a> &nbsp; | &nbsp;
                <a href="terms2.te">개인정보처리방침</a> &nbsp; | &nbsp;
                <a href="introduce.in">회사소개</a>
            </div>
        </div>

        <div class="f-content-bottom">
            <div>
                <div class="info">
                    <p>서비스명: MBTIng&nbsp; | &nbsp;회사명: MBTIng&nbsp; | &nbsp;대표: 정윤석&nbsp; | &nbsp;사업자번호: 123-45-789</p>
                    <p>주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층</p>
                    <p>개인정보관리책임자: 정윤석&nbsp; | &nbsp;E-MAIL: praymyk@mbting.com</p>
                </div>
                
                <div class="footer-icon">
                    <a href="https://instagram.com/ming_my.seaweed?igshid=OGQ5ZDc2ODk2ZA%3D%3D&utm_source=qr">
                        <img class="logo-size" src="<%=request.getContextPath()%>/resources/images/instagramLogo.png" >
                    </a>
                    <a href="https://www.youtube.com/@user-jt1ep9tq9l">
                        <img class="logo-size" src="<%=request.getContextPath()%>/resources/images/youtubeLogo.png" >
                    </a>
                    <a href="https://blog.naver.com/programming_my00">
                        <img class="logo-size" src="<%=request.getContextPath()%>/resources/images/facebookLogo.png">
                    </a>
                </div>
            </div>

            <div style="display: flex;">
                <div class="f-logo">
                    <img class="footerLogo" src="<%=request.getContextPath()%>/resources/images/footerLogo.png">
                </div>
            </div>
    </div>

    <h5 class="copyright">Ⓒ 2018 MBTIng All right reserved.</h5>


</body>
</html>