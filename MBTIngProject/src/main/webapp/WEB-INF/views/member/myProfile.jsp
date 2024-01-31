<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang="en">
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
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  
<!-- 부트스트랩때문에 연결함 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- 알람문구 용 -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<style>
    * {font-family: 'NanumSquare';
    caret-color: transparent;
    }
    
    #profile-outer{
        margin: auto;
		margin-bottom: 50px;
		width: 1000px;

	}
    
    .profile-intro{
        margin-top: 100px;
        height: 100px;
        width: 1000px;
        border-radius: 10px;
        margin-bottom: 20px;
        
        background-image:url(https://dudeplace.co/wp-content/uploads/2021/04/1.%E0%B8%8B%E0%B8%B5%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B9%8C%E0%B9%80%E0%B8%81%E0%B8%B2%E0%B8%AB%E0%B8%A5%E0%B8%B5-Please-Dont-Meet-the-Man-%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88-%E0%B9%80%E0%B8%AD%E0%B9%84%E0%B8%AD%E0%B8%A7%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%81.jpg);
        background-size: cover;
        background-position:10% 50%;
        
        font-size: 26px;
        font-weight: bold;
        color: white;
        text-align: center;
        line-height: 100px;
    }
    
    
    #mypage-form{
        display: flex;
    }
    
    .left-profile{
        width: 550px;
    }
    .right-profile{
        width: 410px;
    }
    .right-profile-content{
        padding: 30px;
        background-color: #EBEDEF;
        border-radius: 10px;
        border: px solid ;
        -webkit-box-shadow: 15px 15px 20px -10px rgba(66, 68, 90, 1);
        -moz-box-shadow: 15px 15px 20px -10px rgba(66, 68, 90, 1);
        box-shadow: 15px 15px 20px -10px rgba(66, 68, 90, 1);
    }
    .right-profile-header{
        display: flex;
        align-items: center;
        flex-direction: column;
        
    }
    
    .line{
        margin-top: 7px;
        margin-bottom: 7px;
        height: 0px;
        width: 100%;
        border: 1px solid silver;
    }
    
    
	.profile-img-box {
        background-color: #EBEDEF;
        width: 150px;
        height: 150px;
        box-sizing: border-box;
    }
    
    .profile-img {
        background-color: snow;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        
    }
    
    .profle-img-title{
        padding: 15px;
        border-radius: 10px;
        background-color: white;
    }
    
    #email{
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
        margin-top: 10px;
        
    }
    
    #name{
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 2px;
    }
    #mbtiNick{
        font-size: 14px; 
    }
    
    input{
        padding-left: 10px;
    }

    input[type="checkbox"]{
        margin: 6px;
    }

	textarea {
        padding-left: 10px;
        background-color: #EBEDEF;
        border: 0px;
		box-sizing: border-box;
        border-radius: 5px;
		height: 150px;
		width: 310px;
		resize : none;
	}

	.profile-title{
		font-weight: bolder;
		height: 30px;
		line-height: 20px;
        font-size: 15px;
        font-weight: bold;
        margin: 10px;
	}

	.profile-content{
		margin: auto;
        border: 0px;
        border-radius: 5px;
        height: 40px;
        width: 300px;
        background-color: #EBEDEF;
	}
	
	#change-profile{
        width: 100%;
        height: 40px;   
        border: 2px solid pink;
        border-radius: 5px;
        background-color: pink;
        color: white;
        font-weight: bold;
        font-size: 15px;
	}
	
	#change-profile:hover{
		cursor: pointer;
        background-color: hotpink;
        color: white;
	}

    .final-button{
        margin-top: 25px;
    }

    .final-button button{
        width: 410px;
        height: 40px;
        font-size: 18px;
        font-weight: bold;
        color: white;
        border: 1px solid hotpink;
        border-radius: 5px;
        margin-top: 10px;
    }

    .final-button button:hover{
        cursor: pointer;
    }

    #final-button1{
        background-color: plum;
    }
    #final-button2{
        background-color: skyblue;
    }

    #final-button1:hover{
        background: rgb(212, 134, 212);
    }

    #final-button2:hover{
        background-color: rgb(79, 178, 218);
    }

    #mbti-test{
        margin-left: 10px;
        height: 40px;
        border-radius: 5px;
        border: 1px solid hotpink;
        background-color: pink;
        line-height: 30px;
        color: white;
        font-weight: bold;
    }

    #mbti-test:hover{
        background-color: hotpink;
        cursor: pointer;
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

	<div>

	</div>
	<script>
	    let i = document.getElementById("myProfile");

        // i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

	<div id="profile-outer">

        <div class="profile-intro">
            사용자 프로필
        </div>
	
		<form id="mypage-form" 
		  action="update.me"
		  method="post"
		 enctype="multipart/form-data"
         style="border: 1px solid pink; padding: 20px; border-radius: 5px;">
		
			<!--
				마이페이지에서 보여져야 하는 것들
				아이디, 이름, 전화번호, 이메일, 주소, 취미
			-->

            <div class="left-profile">

                <table border="0px" style="table-layout: fixed;">

                    <tr>
                        <td style="display: flex; height: 40px; line-height: 40px; font-size: 18px; font-weight: bold;"> 
                            기본 정보 (수정 불가) 
                            <div style="border: 1px solid gray; width: 135px; height: 0px; margin-top: 20px; margin-left: 20px;"></div></td>
                    </tr>
                                        
                    <tr>
                        <td class="profile-title">이름</td>
                    </tr>
                    <tr>
                        <td>
                        <input class="profile-content" type="text" name="userName" required 
                                value="${sessionScope.loginMember.userName}" disabled>
                    </td>
                    </tr>

                    <tr>
                        <td class="profile-title">나이</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="age" 
                            value="${sessionScope.loginMember.age}" disabled>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="profile-title">성별</td>
                    </tr>
                    <td>
                        <input class="profile-content" type="text" name="gender" 
                        value="${sessionScope.loginMember.gender}" disabled>
                    </td>

                    <tr>
                        <td class="profile-title">키</td>
                    </tr>
                    <td>
                        <input class="profile-content" type="text" name="height" 
                        value="${sessionScope.loginMember.height}" disabled>
                    </td>

                    <tr>
                        <td class="profile-title">가입일</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요"
                            value="${sessionScope.loginMember.enrollDate}" disabled>
                        </td>
                    </tr>

                    <tr>
                        <td style="display: flex; height: 40px; line-height: 40px; font-size: 18px; font-weight: bold; margin-top: 20px; "> 
                            부가 정보 (수정 가능)
                            <div style="border: 1px solid gray; width: 130px; height: 0px; margin-top: 20px; margin-left: 20px;"></div></td>
                    </tr>
                    
                    <tr>
                        <td class="profile-title">휴대폰</td>
                    </tr>
                    <td>
                        <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요" style="caret-color: auto;"
                        value="${sessionScope.loginMember.phone}">
                    </td>

                    <tr>
                        <td class="profile-title">소개</td>
                    </tr>
                    <tr>
                        <td>
                            <textarea style="caret-color: auto;" placeholder="사용자의 소개 내용을 입력해 주세요." name="introduce">${sessionScope.loginMember.introduce}</textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="profile-title"> 거주지</td>
                    </tr>
                    <tr>
                        <td>
                            <select name="address" id= "address">
                            	<option value=null>== 주소선택 ==</option>
	                            <option value="서울특별시">서울특별시</option>
							    <option value="부산광역시">부산광역시</option>
							    <option value="대구광역시">대구광역시</option>
							    <option value="인천광역시">인천광역시</option>
							    <option value="광주광역시">광주광역시</option>
							    <option value="대전광역시">대전광역시</option>
							    <option value="울산광역시">울산광역시</option>
							    <option value="세종특별시">세종특별시</option>
							    <option value="경기도">경기도</option>
							    <option value="강원도">강원도</option>
							    <option value="충청북도">충청북도</option>
							    <option value="충청남도">충청남도</option>
							    <option value="전라북도">전라북도</option>
							    <option value="전라남도">전라남도</option>
							    <option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
								<option id="jeju" value="제주도">제주도</option>
                            </select>
                        </td>
                    </tr>
                    <script>
                    $(function(){
                    	
                    // 주소 기본값 설정
	                    if("${sessionScope.loginMember.address}" != null){
	                    	console.log($("#address option[value='${sessionScope.loginMember.address}']"))
	                    	$("#address option[value='${sessionScope.loginMember.address}']").prop("selected", true)
	                    	
	                    }
                    	
                    })
                    
                    </script>
                    
                    <tr>
                        <td class="profile-title">MBTI</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요"
                            value="${sessionScope.loginMember.mbti}" disabled>
                        </td>
                    </tr>
                                      
                    <tr>
                        <td class="profile-title">MBTI 별명</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요"
                            value="${sessionScope.loginMember.mbtiNick}" disabled>
                        </td>
                        <td>
                            <button id="mbti-test" type="button" onclick="location.href='mbtiTest.mb'">내 성향 검사</button>
                        </td>
                    </tr>

        
                    
                    
               
                </table>
            </div>

            <div class="right-profile">
                <div class="profile-title" style="line-height: 30px;">
                    미리보기
                </div>

                <div class="right-profile-content">
                    
                    <div class="right-profile-header">
    
                        <div class="profile-img-box">
                            <img class="profile-img" src="${pageContext.request.contextPath}${sessionScope.loginMember.profileImg}" alt="" />
                        </div>
                        <div id="email">
                            ${sessionScope.loginMember.email}
                        </div>
                        
                    </div>

                    <!-- 회원 정보 변경 시 DB로 부터 수정할 회원을 지정하기 위해 로그인 유저의 EMAIL 정보 담아 둘 input -->
                    <input type="hidden" name="email" value="${sessionScope.loginMember.email}" />
                    <div class="profle-img-title">
                        <div id="name"> ${sessionScope.loginMember.userName}</div>
                        <div id="mbtiNick">${sessionScope.loginMember.mbtiNick} / ${sessionScope.loginMember.mbti}</div>
                        
                        <div class="line"></div>

                        <div style="font-weight: bold; margin-top: 20px;" >소개</div>
                        <div style="border: 1px solid pink; border-radius: 5px; margin-bottom: 20px;" >
                            <textarea placeholder="사용자의 소개 내용을 입력해 주세요." style="background-color: white;" readonly disabled>${sessionScope.loginMember.introduce}</textarea>
                        </div>

                        <div>
                            <button id="change-profile" type="button">프로필 이미지 변경</button>
                            <input type="file" id="upfile" name="reupfile" style="display: none;" accept="image/*, .gif">
                            <input type="hidden" id="oldfile" name="profileImg" style="display: none;" value="${sessionScope.loginMember.profileImg}">
                        </div>
                    </div>
                    
                </div>

                <div class="final-button">
                    <button id="final-button1" type="button" data-toggle="modal" data-target="#changePwd">비밀번호 변경</button>
                    <button id="final-button2" type="submit">적용 </button>
                </div>  
            </div>


            <!-- 프로필 이미지 등록 미리보기용 스크립트 -->
            <script>
                

                $("#change-profile").click(function(){
                        
                        $("#upfile").click();	
                });
            
                $("#upfile").on("change", function(event) {
                    console.log($("#upfile").val());

                    var upfile = $("#upfile")
                   
                    var file = event.target.files[0];

                    var reader = new FileReader(); 
                    reader.onload = function(e) {

                        $(".profile-img").attr("src", e.target.result);
                    }

                    reader.readAsDataURL(file);
                });
            </script>


		</form>
	</div>

	<!-- 비밀번호 변경용 모달창 -->
	<div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
                <form action="updatePwd.me" method="post">
		            <div class="modal-body">
		                    <input type="hidden" name="email" value="${sessionScope.loginMember.email}">
		                    <div class="form-group">
		                        <label for="message-text" class="col-form-label">현재 비밀번호</label>
		                        <input type="password" class="form-control" id="userPwd" name="userPwd">
		                    </div>
		                    <div class="form-group">
		                        <label for="message-text" class="col-form-label">변경할 비밀번호</label>
		                        <input type="password" class="form-control" id="changePwd" name="changePwd"
		                        		required onkeyup="checkPwd1(this)">
		                        <div id="passwordCheck1">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="message-text" class="col-form-label">변경 비밀번호 확인</label>
		                        <input type="password" class="form-control" id="checkPwd"
		                        		disabled required onkeyup="checkPwd2(this)">
		                        <div id="passwordCheck2">
		                        </div>
		                    </div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                <button type="submit" class="btn btn-primary" disabled>결정</button>
		            </div>
                </form>
            </div>
        </div>
    </div>
   
    <script>
    // 유효성 검사 최종 확인용
    let checkArr = [false, false]
    // 최종 확인용 스크립트
    function finalCheck(){
        	
            if(checkArr.every(value => value === true)){
             // 회원가입 버튼 활성화
             $(".modal-footer button[type=submit]").attr("disabled", false)
         } else {
             // 회원가입 버튼 비활성화
             $(".modal-footer button[type=submit]").attr("disabled", true)
         }
         
     }
 	
    // 1. 비밀번호 입력 유효성 검사
    function checkPwd1(e){

        // 사용자 입력 비번
        let changePwd = e.value;

        // 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 정규식
        let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,16}$/;

        if(regExp.test(changePwd)) {
            // 유효한 비번일 경우
            checkArr[0] = true;
            $("#changePwd").css("border-color", "gray");
            $("#passwordCheck1").css("color", "red").text("");
            $("#checkPwd").val("");
            $("#checkPwd").attr("disabled", false).css("background-color", "white");
            finalCheck();

        } else {
            // 유효하지 않은 비번일 경우
            checkArr[0] = false;
            $("#changePwd").css("border-color", "red");
            $("#passwordCheck1").css("color", "red").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
            $("#checkPwd").val("");
            $("#checkPwd").attr("disabled", true).css("background-color", "lightgray");
            finalCheck();

        }
    }

    // 2. 비밀번호 일치 검사
    
    function checkPwd2(e){

        let checkPwd = e.value;
        let userPwd = document.getElementById("userPwd").value;

        if(userPwd == checkPwd) {
        // 유효한 검사결과
        $("#checkPwd").css("border-color", "gray");
        $("#passwordCheck2").css("color", "red").text("");
        finalCheck();

        checkArr[1] = true;

        } else {
            // 유효하지 않은 검사결과

            $("#checkPwd").css("border-color", "red");
            $("#passwordCheck2").css("color", "red").text("입력한 비밀번호가 일치하지 않습니다.");
            finalCheck();

            checkArr[1] = false;
        }
        

    }
    
    </script>
    
</body>
</html>