<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	
	<!-- font-awesome 라이브러리 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  
	<!-- 부트스트랩때문에 연결함 -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 폰트(notosans)-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">  

	


<style>
	* {font-family: 'NanumSquareExtraBold';}

    html, body {
        margin: 0;
        padding: 0;
        font-family: 'TheJamsil5Bold';
        
    }
    h2 {
    	font-size: 20px;
    }
    h3 {
    	font-size: 18px;
    }

    #admin-menubar {
        width: 200px;
        height: 1600px;
        margin: auto;
        display: flex;
        position: absolute;
    }

    .left-area {
        width: 200px;
        height: 2300px;
        border-right: 2px solid #FCD19E;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
    }

    #logo, #logo a {
        font-size: 24px;
        color: #e64a19; /* 주황색 */
        text-decoration : none;
    }

    #content-menubar table {
        width: 100%;
        border-collapse: collapse;
    }

    #content-menubar th {
        padding: 15px;
        text-align: center;
        font-size: 16px;
        cursor: pointer;
        position: relative;
    }

    #content-menubar th:hover {
        background-color: #ff9800;
    }

    .menu-icon {
        position: absolute;
        left: 20px;
        font-size: 18px;
    }
    #logoIcon { 
    	width : 180px;
    	height :80px;
    	margin-top : 10px;
    }
    #logoIcon:hover {cursor:pointer;}

    /* 메뉴바 색상 */
    #content-menubar th:nth-child(1), #content-menubar a {
        color: #d32f2f;
        text-decoration : none;
    }

        
    .right-area {
        width: 100%;
        align-content: right;
        background-color: #FCD19E;
        height: 100px;
        margin: auto;
    }
    #icon1 {
     width: 70px;
     height: 60px;
     padding-right: 30px;
     margin-top: 20px;
    }
    #icon2 {
        width: 80px;
        height: 80px;
        padding-right: 10px;
        margin-top: 10px;
    }
    #content-menubar {
        width: 200px;
        height: 700px;
        margin-top: 30px;
    }
    
    
</style>
</head>
<body>

	<!-- 알람문구 출력용 코드 ( session.alertMsg )-->
	
	<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
		</script>
		
		<c:remove var="alertMsg" scope="session" />
	</c:if>


    <div class="right-area"> 
        <a onclick="mainLogo();"><img id="logoIcon" align="left" 
        	src="${pageContext.request.contextPath}/resources/images/mbtingLoggo.png" alt="로고"></a>
    </div>
	
	<script>
	function mainLogo() {
		 window.location.href = '${pageContext.request.contextPath}/';
	}
	</script>
	
        
    <div id="admin-menubar">

        <div class="left-area">
            <h1 id="logo"><a href="${pageContext.request.contextPath}/adminMain.ad">MBTing.</a></h1>

            <div id="content-menubar">
                <table>
                    <tr>
                        <th><i class="fas fa-user menu-icon"></i>
                            <a href="list.adme">회원관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-bullhorn menu-icon"></i>
                            <a href="list.no">공지사항관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-comments menu-icon"></i>
                            <a href="list.adbo">매칭후기관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-credit-card menu-icon"></i>
                            <a href="list.adpa">결제 관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-question-circle menu-icon"></i>
                            <a href="https://dashboard.tawk.to/#/chat">1:1문의</a>
                        </th>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</body>
</html>