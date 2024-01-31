<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">

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



<style>

    .enroll-outer{
        margin: auto;
        width: 800px;
        margin-bottom : 50px;
    }

    .enroll-logo{
        width: 100%;
        text-align: center;
        font-size: 16px;
        font-weight: 550;
        color: gray;
    }

    .andLine{
        margin-top: 20px;   
        margin-bottom: 20px;
        width: 100%;
        height: 15px;
        display: flex;
        flex-direction: row;
        justify-content: center;
        
    }
    .line{
        
        margin-top: 7px;
        height: 0px;
        width: 115px;
        border: 1px solid silver;
    }

    .enroll-group{
        text-align: center;    
    }

    .enroll-group input{
        width: 300px;
        height: 40px;
        margin: 5px;
        box-sizing: border-box;
        font-size: 12px;
    }

    .enroll-group button {
        width: 300px;
        height: 40px;
        border: 0px;
        border-radius: 5px;
        background-color: pink;
        color: white;
        font-weight: bold;
        font-size: 15px;
    }

    .enroll-gender{
        margin-top: 5px;
        box-sizing: border-box;
        height: 40px;
    }
    
    .enroll-gender button {
        width: 148px;
        background-color: white;
        color: gray;
        border: 1px solid pink;
    }

    .enroll-login{
        width: 500px;
        height: 80px;
        margin: auto;
        border: 1px solid pink;
        line-height: 80px;
        font-size: 15px;
        text-align: center;
    }

    .enroll-border{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 500px;
        height: 950px;
        margin: auto;
        margin-top: 50px;
        border: 1px solid pink; 
    }


    
    .login-a, #kakao-enroll, .enroll-logo>img{
    	cursor:pointer;    	
    }

</style>
</head>
<body>

    <div class="enroll-outer">
        
        <form action="insert.me" method="post" id="enrollForm">

            <div class="enroll-border">

                <div class="enroll-logo">

                    <img src="${pageContext.request.contextPath}/resources/images/mbtingLoggo2.png" alt="mbtingLogo"
                         onclick="JavaScript:location.href='<%=contextPath%>'">
                    <div style="margin-bottom: 30px ;">
                        나와 잘맞는 만남을 희망한다면 <br>
                        가입하세요.
                    </div>
                    
                    <img id="kakao-enroll" src="${pageContext.request.contextPath}/resources/images/kakaoLoginBig.png" alt="kakaoEnroll">
                    
                </div>
                    
                <div class="andLine">
                    <div class="line"></div>
                    <div style="width: 70px; text-align: center; line-height: 15px;"> 또는 </div> 
                    <div class="line"></div>
                </div>

                <div class="enroll-group">
                    
                    <input type="text" id="email" placeholder="이메일 주소" name="email" required> <br>

                    <input type="text" id="userName" placeholder="성명" name="userName" required> <br>
                    
                    <input type="password" id="userPwd" placeholder="비밀번호" name="userPwd" required> <br>

                    <input type="password" id="checkPwd" placeholder="비밀번호 확인" required> <br>

                    <input type="tel" id="phone" placeholder="휴대폰 번호 (-없이)" name="phone"> <br>
                
                    <input type="number" id="age" placeholder="나이" name="age"> <br>

                    <div class="enroll-gender">
                        <button type="button" id="M">남성</button> <button type="button" id="F">여성</button>
                        <input type="hidden" value="" id="gender" name="gender">
                    </div>

                    <div style="width: 300px; margin: auto; margin-top: 15px; margin-bottom: 15px;">
                        매칭 서비스를 이용하기 위해서는 회원 가입 후 MBTI 시물레이션 게임을 진행하셔야 합니다.
                    </div>
                                
                    <button type="submit">가입</button>
                
                </div>
                
                <!-- 회원가입 입력 내용 처리를 위한 스크립트 -->
                <script>
                	$(function(){
                		
                		$("#M").click(function(){
                			$(this).css("background-color", "skyblue");
                			$(this).css("color", "white");
                			$("#F").css("background-color", "white");
                			$("#F").css("color", "gray");
                			$("#gender").val("M");
                		})
                		
                		$("#F").click(function(){
                			$(this).css("background-color", "plum");
                			$(this).css("color", "white");
                			$("#M").css("background-color", "white");
                			$("#M").css("color", "gray");
                			$("#gender").val("F");
                		})
                	})
                
                </script>

            </div>
            
            <br>
            
            <div class="enroll-login">
                계정이 있으신가요? 
                <a class="login-a" data-toggle="modal" data-target="#loginModal" style="color : blue;">로그인</a>
            </div>

        </form>

    </div>
    
    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Login</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="userId" class="mr-sm-2">ID : </label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="memberId"> <br>
                        <label for="userPwd" class="mr-sm-2">Password : </label>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwd">
                    	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=670371a54748d4645ec474b68405a19c&redirect_uri=http://localhost:8081/mbting/kakaoLog.me"><img style="display : block; margin : auto;" src="${pageContext.request.contextPath}/resources/images/kakaoLoginSmall.png"></a>
                    </div>
                           
                           
                           
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">로그인</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</body>
</html>