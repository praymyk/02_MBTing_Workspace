<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

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
<!-- alert창 관련 스타일용 라이브러리 추가  -->

<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">


<style>
	*{font-family: 'NanumSquare';}
	
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
        margin-bottom: 30px;
    }

    .enroll-group input{
        width: 300px;
        height: 40px;
        margin: 5px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 12px;
        border: 1px solid gray;
        border-radius: 5px;
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
        
        margin: auto;
        margin-top: 50px;
        border: 1px solid pink; 
    }
    
    .login-a, #kakao-enroll, .enroll-logo>img{
    	cursor:pointer;   
    }

    .enroll-logo>img {
        height: 150px;
        margin: 30px 0px;
    }

    .check{
        font-size: 12px;
        color: red;
        text-align: left;
        padding-left: 10px;
    }

    #checkPwd{
        background-color: lightgray;
    }


    /* 모달 창 스타일*/
    .modal-content>button{
        margin-left: auto;
    }

    .modal-border{
        margin: auto;
        margin-top: 10px;
        margin-bottom: 20px;
        padding: 15px;
        border-radius: 5px;

        font-size: 13px;
        text-align: center;
    }

    .modal-icon{
        margin: auto;
        text-align: center;
    }
    .modal-icon img{
        height: 150px;
        width: 100%;
    }

    /* 모달창 내 input(이메일/비번) 입력창 스타일*/
    .modal-body{
        text-align: center;
        padding: 0px;
        padding-bottom: 10px;
    }

    .modal-body input{
        margin: auto;
        border: 1px solid silver;
        border-radius: 10px;
        width: 100%;
        height: 35px; 
        font-size: 13px;
    }

    #userId{
        margin-bottom: 10px;
    }

    .modal-body button {
        margin-top: 15px;
        width: 100%;
        height: 35px;
        background-color: pink;
        border: 0px;
        border-radius: 10px;
    }
    .modal-body button:hover{
        background-color: hotpink;
    }

    .andLine{
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
        width: 110px;
        border: 1px solid silver;
    }
    .line-and{
        font-size: 12px;
        line-height: 12px;
    }

    .kakao-login{
        width: 100%;
    }

    .kakao-login img{
        width: 30px;
        height: 30px;
    }

    #kakao-login-button:hover{
        cursor: pointer;
    }

    #find-pwd{
        margin-top: 10px;
    }

</style>
</head>
<body>
	<!-- 알람문구 출력용 코드 ( session.alertMsg )-->
	<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.alert('Alert', '${sessionScope.alertMsg}', function(){ alertify.success('Ok'); });
		</script>
		
		<c:remove var="alertMsg" scope="session" />
	</c:if>


    <div class="enroll-outer">
        
        <form action="insert.me" method="post" id="enrollForm">

            <div class="enroll-border">

                <div class="enroll-logo">

                    <img src="${pageContext.request.contextPath}/resources/images/mbtingLoggo2.png" alt="mbtingLogo"
                         onclick="JavaScript:location.href='<%=contextPath%>'">
                    <div style="margin-bottom: 30px ;">
                        나와 잘맞는 사람을 만나고 싶다면 <br>
                        지금 가입하세요!
                    </div>
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=670371a54748d4645ec474b68405a19c&redirect_uri=http://192.168.40.37:8081/mbting/kakaoLog.me">
                    	<img id="kakao-enroll" src="${pageContext.request.contextPath}/resources/images/kakaoLoginBig.png" alt="kakaoEnroll" >
                    </a>
                </div>
                    
                <div class="andLine">
                    <div class="line"></div>
                    <div style="width: 70px; text-align: center; line-height: 15px;"> 또는 </div> 
                    <div class="line"></div>
                </div>

                <div class="enroll-group">
                    
                    <input type="email" id="email" placeholder="이메일 주소" name="email" required > <br>
                    <div class="check" id="emailCheck"></div>
                    <input type="text" id="userName" placeholder="성명" name="userName" required onblur="checkName(this)"> <br>
                    <div class="check" id="nameCheck"></div>
                    <input type="password" id="userPwd" placeholder="비밀번호(8~16자의 영문 대/소문자, 숫자, 특수문자)" name="userPwd" required onkeyup="checkPwd1(this)"> <br>
                    <div class="check" id="passwordCheck1"></div>
                    <input type="password" id="checkPwd" placeholder="비밀번호 확인" disabled required onblur="checkPwd2(this)"> <br>
                    <div class="check" id="passwordCheck2"></div>
                    <input type="tel" id="phone" placeholder="휴대폰 번호 (-없이)" name="phone" required onblur="checkPhone(this)"> <br>
                    <div class="check" id="checkPhone"></div>
                    <input type="number" id="age" placeholder="나이 입력" name="age" required onblur="checkAge(this)"> 
                    <div class="check" id="checkAge"></div>
                    <br>
                    
                    <div class="enroll-gender">
                        <button type="button" id="M">남성</button> <button type="button" id="F">여성</button>
                        <input type="hidden" value="" id="gender" name="gender">
                    </div>

                    <div style="width: 300px; margin: auto; margin-top: 15px; margin-bottom: 15px;">
                        회원 가입 후 MBTI 시물레이션 게임을 진행하시면 내 연애스타일을 확인하고 환상의 궁합을 찾아볼수 있습니다.
                    </div>
                                
                    <button type="submit">가입</button>
                    
                </div>
                
            </div>
            
            <br>
            
            <div class="enroll-login">
                계정이 있으신가요? 
                <a class="login-a" data-toggle="modal" data-target="#loginModal" style="color : blue;">로그인</a>
            </div>
            
        </form>
        
    </div>
    <!-- 회원가입 입력 내용 처리를 위한 스크립트 -->
    <script>
        $(function(){
        	
        	// 카카오 계정으로 회원 가입을 시도할 경우
        	if("${sessionScope.email}" != ""){
        		console.log("잘들어옴?")
        		$("#email").val("${sessionScope.email}");   
        		
        	};
            
            $("#M").click(function(){
                $(this).css("background-color", "skyblue");
                $(this).css("color", "white");
                $("#F").css("background-color", "white");
                $("#F").css("color", "gray");
                $("#gender").val("M");

                // 성별 유효성 검사 실행
                checkgender();
            })
            
            $("#F").click(function(){
                $(this).css("background-color", "plum");
                $(this).css("color", "white");
                $("#M").css("background-color", "white");
                $("#M").css("color", "gray");
                $("#gender").val("F");

                // 성별 유효성 검사 실행
                checkgender();
            })
        })

             ////////////////////////////////////////  
            //   회원 가입 요구 조건 확인 기능 부   //
           ////////////////////////////////////////

        // 유효성 검사 항목 7가지 상태를 나타낼 변수
        // 이메일(형식/중복), 이름형식, 비밀번호형식, 비밀번호확인, 휴대전화형식, 생년월일형식
        let checkArr = [false, false, false, false, false, false, false];

        // 1. 이메일 유효성 검사

        $(function() {
    
        // email를 입력받는 input 요소 객체를 변수에 담아두기

        let $idInput = $("#enrollForm input[name=email]");
        
            $idInput.keyup(function() {                    
                
                // 단, 우선 최소 5글자 이상으로 입력되어 있을 경우에만
                // ajax 를 요청해서 중복체크를 하도록 해보자
                if($idInput.val().length >= 5) {

                    let checkEmail = RegExp(/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/);
                    let userEmail = $idInput.val()
                    
                    // 중복 체크 요청 보내기
                    $.ajax({
                        url : "emailCheck.me",
                        type : "get",
                        data : {email : $idInput.val()},
                        success : function(result) {                            
                
                            if(result == "NNNNN") { // 사용 불가능
                                checkArr[0] = false;
                                
                                // 빨간색 메세지 출력 / 인풋 테그 보더 색상 빨강
                                $("#emailCheck").text("중복된 이메일이 존재합니다. 다시 입력해 주세요.");
                                $("#email").css("border-color", "red");
                                finalCheck();

                            } else if(!checkEmail.test(userEmail)) { 
                                checkArr[0] = false;
                                $("#emailCheck").text("이메일 형식으로 입력해주세요.");
                                $("#email").css("border-color", "red");
                                finalCheck();
                                
                            } else { // 사용 가능
                                
                                // 출력메시지 없애기 / 인풋 테그 보더 색상 그레이
                                $("#email").css("border-color", "gray");
                                $("#emailCheck").css("color", "red").text("");
                                finalCheck();
                            
                                // 조건 1 만족
                                checkArr[0] = true;

                            }

                        },
                        error : function() {
                            console.log("아이디 중복 체크용 ajax 통신 실패!");
                        }
                    });
                
                } else { // 5글자 미만일 때
                    
                    $("#email").css("border-color", "gray")
                    $("#emailCheck").css("color", "red").text("");
                    finalCheck();
                }
            });
              
        });

        // 2. 이름 입력 유효성 검사
        function checkName(e){
            let regExp = /^[가-힣]{2,}$/;
                
            if(!regExp.test(e.value)) { // 올바르지 않은 형식

                checkArr[1] = false;
                $("#userName").css("border-color", "red");
                $("#nameCheck").text("올바른 형식의 한글 이름을 입력해주세요.");
                finalCheck();

            } else {    // 유효값

                checkArr[1] = true;
                $("#userName").css("border-color", "gray");
                $("#nameCheck").css("color", "red").text("");
                finalCheck();

            }

        }


        // 3. 비밀번호 입력 유효성 검사
        function checkPwd1(e){

            // 사용자 입력 비번
            let userPwd = e.value;

            // 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 정규식
            let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,16}$/;

            if(regExp.test(userPwd)) {
                // 유효한 비번일 경우
                checkArr[2] = true;
                $("#userPwd").css("border-color", "gray");
                $("#passwordCheck1").css("color", "red").text("");
                $("#checkPwd").val("");
                $("#checkPwd").attr("disabled", false).css("background-color", "white");
                finalCheck();

            } else {
                // 유효하지 않은 비번일 경우
                checkArr[2] = false;
                $("#userPwd").css("border-color", "red");
                $("#passwordCheck1").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
                $("#checkPwd").val("");
                $("#checkPwd").attr("disabled", true).css("background-color", "lightgray");
                finalCheck();

            }
        }

        // 4. 비밀번호 일치 검사
        
        function checkPwd2(e){

            let checkPwd = e.value;
            let userPwd = document.getElementById("userPwd").value;

            if(userPwd == checkPwd) {
            // 유효한 검사결과
            $("#checkPwd").css("border-color", "gray");
            $("#passwordCheck2").css("color", "red").text("");
            finalCheck();

            checkArr[3] = true;

            } else {
                // 유효하지 않은 검사결과

                $("#checkPwd").css("border-color", "red");
                $("#passwordCheck2").text("입력한 비밀번호가 일치하지 않습니다.");
                finalCheck();

                checkArr[3] = false;
            }

        }

        // 5. 휴대전화 번호 일치 검사

        function checkPhone(e){

            //  010, 011, 016, 017, 018, 019 중 하나로 시작 + 8자
            let regExp = /^(01[016789])\d{8}$/;

            if(regExp.test(e.value)){

                // 유효한 번호일 경우
                checkArr[4] = true;
                $("#phone").css("border-color", "gray");
                $("#checkPhone").css("color", "red").text("");
                finalCheck();

            } else {
                // 유효하지 않은 번호
                checkArr[4] = false;
                $("#phone").css("border-color", "red");
                $("#checkPhone").text("휴대전화번호가 정확한지 확인해 주세요.");
                finalCheck();

            }
        }

        /*
        // 6. 생년월일 검사
        function checkAge(e){

            // 생년월일 8자
            let regExp = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;

            if(regExp.test(e.value)){

            // 유효한 생년일 경우
            checkArr[5] = true;
            $("#age").css("border-color", "gray");
            $("#checkAge").css("color", "red").text("");
            finalCheck();

            } else {
            // 유효하지 않은 생년
            checkArr[5] = false;
            $("#age").css("border-color", "red");
            $("#checkAge").text("생년월일은 8자리 숫자로 입력해 주세요.");
            finalCheck();

            }
        }*/
        
     	// 6. 나이 검사
     	function checkAge(e){

            // 생년월일 8자
            let regExp = /^(?:[1-9]|[1-9][0-9]|1[0-4][0-9]|150)$/;

            if(regExp.test(e.value)){

            // 유효한 생년일 경우
            checkArr[5] = true;
            $("#age").css("border-color", "gray");
            $("#checkAge").css("color", "red").text("");
            finalCheck();

            } else {
            // 유효하지 않은 생년
            checkArr[5] = false;
            $("#age").css("border-color", "red");
            $("#checkAge").text("나이 정보가 정확한지 확인해주세요.");
            finalCheck();

            }
        }
        
        // 7. 성별 체크 검사
        function checkgender(){

            checkArr[6] = true;
            finalCheck();
            
        }       

        // 제약조건 최종 확인용 메소드
        function finalCheck(){

            if(checkArr.every(value => value === true)){
                // 회원가입 버튼 활성화
                $("#enrollForm button[type=submit]").attr("disabled", false).css("background-color", "palevioletred");
            } else {
                // 회원가입 버튼 비활성화
                $("#enrollForm button[type=submit]").attr("disabled", true).css("background-color", "pink");
            }
        }

    </script>

    
    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <button type="button" class="close" data-dismiss="modal">&times;</button>

                <div class="modal-border" style="border: 1px solid pink; width: 90%; height: 90%;">
                    
                    <div class="modal-icon">
                        <img src="${pageContext.request.contextPath}/resources/images/mbtingLoggo2.png" alt="mbtingLogo">
                    </div>
              
        
                    <form action="login.me" method="post">
                        <!-- Modal body -->
                        <div class="modal-body">
                            <input type="text" placeholder="사용자 이메일" id="userId-m" name="email"> <br>
                            <input type="password" placeholder="비밀번호" id="userPwd-m" name="userPwd">
                            <button type="submit">로그인</button>
                        </div>

                        <div class="andLine">
                            <div class="line"></div>
                            <div class="line-and" style="width: 60px; text-align: center;"> 또는 </div> 
                            <div class="line"></div>
                        </div>

                        <div class="kakao-login">
                            <div id="kakao-login-button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=670371a54748d4645ec474b68405a19c&redirect_uri=http://localhost:8081/mbting/kakaoLog.me'">
                                <img src="${pageContext.request.contextPath}/resources/images/kakaominilogo.png"> kakao로 로그인
                            </div>
                            <div id="find-pwd">
                                <a href=""> 비밀번호를 잊으셨나요?</a>
                            </div>
                        </div>
                    </form>
                        
                </div>
                        
                <div class="modal-border" style="border: 1px solid pink; width: 90%; height: 90%;">      
                    
                    <div>
                        계정이 없으신가요? <a href="enrollForm.me">가입하기</a>
                    </div>

                </div>                 

            </div>
        </div>
    </div>


</body>
</html>