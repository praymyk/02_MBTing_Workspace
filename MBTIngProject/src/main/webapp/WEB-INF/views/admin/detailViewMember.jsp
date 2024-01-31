<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {font-family: 'Noto Sans KR', sans-serif;
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

	.btn {
		margin-top : 10px;
		margin-bottom : 30px;
	}
	#btnWrap {
	}
</style>
</head>
<body>
	<!-- 알람문구 출력용 코드 ( session.alertMsg )-->
	<jsp:include page="../common/adminMenubar.jsp" />
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
		<div id="btnWrap"><button type="button" class="btn btn-primary" onclick="adminMemberList();">목록으로</button></div>
		
		<script>
		function adminMemberList() {
			var currentPage = ${requestScope.currentPage};
			location.href="${pageContext.request.contextPath}/list.adme?cpage=" + currentPage;
		}
		</script>
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
                                value="" disabled>
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
                        <td class="profile-title" >가입일</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="enrollDate"
                            value="" disabled>
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
                            <input class="profile-content" type="text" name="address" 
                            value="" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td class="profile-title">MBTI</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="mbti" 
                            value="" disabled>
                        </td>
                    </tr>
                                      
                    <tr>
                        <td class="profile-title">MBTI 별명</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="mbtiNick" 
                            value="" disabled>
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

                    <div class="profle-img-title">
                        <div id="name"> </div>
                        <div id="mbtiNick"></div>
                        <div class="line"></div>
                        <div style="font-weight: bold; margin-top: 20px;" >소개</div>
                        <div style="border: 1px solid pink; border-radius: 5px; margin-bottom: 20px;" >
                            <textarea id="myIntroduce" style="background-color: white;" readonly disabled></textarea>
                        </div>

                        <div>
                            <input type="hidden" id="oldfile" name="profileImg" style="display: none;" value="">
                        </div>
                    </div>
                    
                </div>

            </div>
		</form>
	</div>
    
    <script>
    	$(function() {
    		detailMember();
    	});
    	
    	function detailMember() {
    		$.ajax({
    			url : "adminMemberDetailView.adme",
    			type : "get",
    			data : {"userNo"  :  ${requestScope.userNo}},
    			success : function(e) {
    				console.log(e);
    				$("[name='address']").val(e.address);
    				$("[name='introduce']").val(e.introduce);
    				$("[name='age']").val(e.age);
    				$("[name='userName']").val(e.userName);
    				$("[name='gender']").val(e.gender);
    				$("[name='height']").val(e.height);
    				$("[name='enrollDate']").val(e.enrollDate);
    				$("[name='phone']").val(e.phone);
    				$("[name='mbti']").val(e.mbti);
    				$("[name='mbtiNick']").val(e.mbtiNick);
    				$("#name").text(e.userName);
    				$("#mbtiNick").text(e.mbtiNick + "/" + e.mbti);
    				$("#myIntroduce").text(e.introduce);
    				$(".profile-img").attr("src", "${pageContext.request.contextPath}" + e.profileImg);
    				
    				//console.log("${pageContext.request.contextPath}" + e.profileImg);
    				
    			}, 
    			error : function() {
    				console.log("회원 상세 정보 가져오기 실패 ㅠ");
    			}
    			
    		});
    	}
    </script>
</body>
</html>